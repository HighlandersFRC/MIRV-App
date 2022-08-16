// ignore_for_file: must_be_immutable, no_leading_underscores_for_local_identifiers

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mirv/control_pad/joystick_update_controller.dart';
import 'package:mirv/control_pad/views/horizontal_view.dart';
import 'package:mirv/models/gamepad/gamepad_axis_type.dart';
import 'package:mirv/services/joystick_controller.dart';

import 'circle_view.dart';

typedef HorizontalJoystickDirectionCallback = void Function(double distance);

class HorizontalJoystickView extends StatelessWidget {
  /// The size of the joystick.
  ///
  /// Defaults to half of the width in the portrait
  /// or half of the height in the landscape mode
  final double? size;

  /// Color of the icons
  ///
  /// Defaults to [Colors.white54]
  final Color iconsColor;

  /// Color of the joystick background
  ///
  /// Defaults to [Colors.blueGrey]
  final Color backgroundColor;

  /// Color of the inner (smaller) circle background
  ///
  /// Defaults to [Colors.blueGrey]
  final Color innerCircleColor;

  /// Opacity of the joystick
  ///
  /// The opacity applies to the whole joystick including icons
  ///
  /// Defaults to [null] which means there will be no [Opacity] widget used
  final double? opacity;

  /// Callback to be called when user pans the joystick
  ///
  /// Defaults to [null]
  final HorizontalJoystickDirectionCallback? onDirectionChanged;

  /// Indicates how often the [onDirectionChanged] should be called.
  ///
  /// Defaults to [null] which means there will be no lower limit.
  /// Setting it to ie. 1 second will cause the callback to be not called more often
  /// than once per second.
  ///
  /// The exception is the [onDirectionChanged] callback being called
  /// on the [onPanStart] and [onPanEnd] callbacks. It will be called immediately.
  final Duration interval;

  /// Shows top/right/bottom/left arrows on top of Joystick
  ///
  /// Defaults to [true]
  final bool showArrows;

  final JoystickController controller;
  late JoystickUpdateController updateController;

  HorizontalJoystickView(this.controller,
      {Key? key,
      this.size,
      this.iconsColor = Colors.white54,
      this.backgroundColor = Colors.blueGrey,
      this.innerCircleColor = Colors.blueGrey,
      this.opacity,
      this.onDirectionChanged,
      this.interval = const Duration(milliseconds: 100),
      this.showArrows = true})
      : super(key: key) {
    updateController = JoystickUpdateController(controller, GamepadAxisType.right);
  }

  @override
  Widget build(BuildContext context) {
    double actualSize =
        size != null ? size! : math.min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height) * 0.5;
    double innerCircleSize = actualSize / 2;
    Offset lastPosition = Offset(innerCircleSize, innerCircleSize);
    Offset joystickInnerPosition = _calculatePositionOfInnerCircle(lastPosition, innerCircleSize, actualSize, const Offset(0, 0));

    DateTime? _callbackTimestamp;

    return Center(
      child: StatefulBuilder(
        builder: (context, setState) {
          Widget joystick = Stack(
            children: <Widget>[
              HorizontalView.horizontalJoystickCircle(
                actualSize,
                backgroundColor,
              ),
              Positioned(
                left: joystickInnerPosition.dx,
                top: 0.0,
                child: CircleView.joystickInnerCircle(
                  actualSize / 2,
                  innerCircleColor,
                ),
              ),
              if (showArrows) ...createArrows(),
            ],
          );

          return GestureDetector(
            onPanUpdate: (details) {
              _callbackTimestamp = _processGesture(actualSize, actualSize / 2, details.localPosition, _callbackTimestamp);
              joystickInnerPosition =
                  _calculatePositionOfInnerCircle(lastPosition, innerCircleSize, actualSize, details.localPosition);

              setState(() => lastPosition = details.localPosition);
            },
            onPanEnd: (details) {
              updateController.updateJoystickVal(JoystickValue(0.0, 0.0));
              _callbackTimestamp = null;
              if (onDirectionChanged != null) {
                onDirectionChanged!(0);
              }
              joystickInnerPosition = _calculatePositionOfInnerCircle(
                  Offset(innerCircleSize, innerCircleSize), innerCircleSize, actualSize, const Offset(0, 0));
              setState(() => lastPosition = Offset(innerCircleSize, innerCircleSize));
            },
            child: (opacity != null) ? Opacity(opacity: opacity!, child: joystick) : joystick,
          );
        },
      ),
    );
  }

  List<Widget> createArrows() {
    return [
      Positioned(
        left: 16.0,
        top: 0.0,
        bottom: 0.0,
        child: Icon(
          Icons.arrow_back,
          color: iconsColor,
        ),
      ),
      Positioned(
        right: 16.0,
        top: 0.0,
        bottom: 0.0,
        child: Icon(
          Icons.arrow_forward,
          color: iconsColor,
        ),
      ),
    ];
  }

  DateTime? _processGesture(double size, double ignoreSize, Offset offset, DateTime? callbackTimestamp) {
    double middle = size / 2.0;

    double distance = (middle - offset.dx);

    double normalizedDistance = math.max(math.min(distance / (size / 2), 1.0), -1.0);

    updateController.updateJoystickVal(JoystickValue(-normalizedDistance, 0.0));
    DateTime? _callbackTimestamp = callbackTimestamp;
    // if (onDirectionChanged != null && _canCallOnDirectionChanged(callbackTimestamp)) {
    //   _callbackTimestamp = DateTime.now();
    //   onDirectionChanged!(normalizedDistance);
    // }

    return _callbackTimestamp;
  }

  /// Checks if the [onDirectionChanged] can be called.
  ///
  /// Returns true if enough time has passed since last time it was called
  /// or when there is no [interval] set.
  bool _canCallOnDirectionChanged(DateTime? callbackTimestamp) {
    if (callbackTimestamp == null) {
      return true;
    }
    if (interval != null && callbackTimestamp != null) {
      int intervalMilliseconds = interval.inMilliseconds;
      int timestampMilliseconds = callbackTimestamp.millisecondsSinceEpoch;
      int currentTimeMilliseconds = DateTime.now().millisecondsSinceEpoch;

      if (currentTimeMilliseconds - timestampMilliseconds <= intervalMilliseconds) {
        return false;
      }
    }

    return true;
  }

  Offset _calculatePositionOfInnerCircle(Offset lastPosition, double innerCircleSize, double size, Offset offset) {
    double middle = size / 2.0;

    double angle = math.atan2(offset.dy - middle, offset.dx - middle);
    double degrees = angle * 180 / math.pi;
    if (offset.dx < middle && offset.dy < middle) {
      degrees = 360 + degrees;
    }
    bool isStartPosition = lastPosition.dx == innerCircleSize && lastPosition.dy == innerCircleSize;
    double lastAngleRadians = (isStartPosition) ? 0 : (degrees) * (math.pi / 180.0);

    var rBig = size / 2;
    var rSmall = innerCircleSize / 2;

    var x = (lastAngleRadians == -1) ? rBig - rSmall : (rBig - rSmall) + (rBig - rSmall) * math.cos(lastAngleRadians);
    var y = (lastAngleRadians == -1) ? rBig - rSmall : (rBig - rSmall) + (rBig - rSmall) * math.sin(lastAngleRadians);

    var xPosition = lastPosition.dx - rSmall;
    var yPosition = lastPosition.dy - rSmall;

    var angleRadianPlus = lastAngleRadians + math.pi / 2;
    if (angleRadianPlus < math.pi / 2) {
      if (xPosition > x) {
        xPosition = x;
      }
      if (yPosition < y) {
        yPosition = y;
      }
    } else if (angleRadianPlus < math.pi) {
      if (xPosition > x) {
        xPosition = x;
      }
      if (yPosition > y) {
        yPosition = y;
      }
    } else if (angleRadianPlus < 3 * math.pi / 2) {
      if (xPosition < x) {
        xPosition = x;
      }
      if (yPosition > y) {
        yPosition = y;
      }
    } else {
      if (xPosition < x) {
        xPosition = x;
      }
      if (yPosition < y) {
        yPosition = y;
      }
    }
    return Offset(xPosition, yPosition);
  }
}
