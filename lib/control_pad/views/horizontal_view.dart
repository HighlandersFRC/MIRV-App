// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class HorizontalView extends StatelessWidget {
  final double size;

  final Color color;

  final List<BoxShadow>? boxShadow;

  final Border? border;

  final double? opacity;

  final Image? buttonImage;

  final Icon? buttonIcon;

  final String? buttonText;

  const HorizontalView({
    required this.size,
    this.color = Colors.transparent,
    this.boxShadow,
    this.border,
    this.opacity,
    this.buttonImage,
    this.buttonIcon,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size / 2,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        border: border,
        boxShadow: boxShadow,
        borderRadius: new BorderRadius.circular((size / 2)),
      ),
      child: Center(
        child: buttonIcon != null
            ? buttonIcon
            : (buttonImage != null)
                ? buttonImage
                : (buttonText != null)
                    ? Text(buttonText!)
                    : null,
      ),
    );
  }

  factory HorizontalView.horizontalJoystickCircle(double size, Color color) => HorizontalView(
        size: size,
        color: color,
        border: Border.all(
          color: Colors.black45,
          width: 4.0,
          style: BorderStyle.solid,
        ),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 8.0,
            blurRadius: 8.0,
          )
        ],
      );
}
