import 'package:flutter/material.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/app_bar.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/center_panel.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/left_side_buttons.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/list_commands.dart';
import 'package:test/ui/screens/rover_operation_page_widgets/right_side_buttons.dart';

import 'package:test/services/mirv_api.dart';
import 'package:test/ui/screens/webrtc_connection.dart';

class RoverOpPage extends StatefulWidget {
  const RoverOpPage({Key? key}) : super(key: key);

  @override
  State<RoverOpPage> createState() => _RoverOpPageState();
}

class _RoverOpPageState extends State<RoverOpPage> {
  final MirvApi _mirvApi = MirvApi();
  final RoverMetrics roverMetrics = RoverMetrics();
  final WebRTCConnection webRTCConnection = WebRTCConnection();

  @override
  void initState() {
    super.initState();
    _mirvApi.startPeriodicMetricUpdates();
    webRTCConnection.makeCall();
    webRTCConnection.startJoystickUpdates();
  }

  @override
  void dispose() {
    super.dispose();
    _mirvApi.stopPeriodicMetricUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpPgAppBar(
        periodicMetricUpdates: _mirvApi.periodicMetricUpdates,
        roverMetrics: roverMetrics,
        stopCall: webRTCConnection.stopCall,
      ),
      endDrawer: Drawer(
        child: StreamBuilder<RoverMetrics>(
            stream: _mirvApi.periodicMetricUpdates,
            builder: (context, snapshot) {
              return CommandList(
                roverMetrics: snapshot.data,
                sendCommand: webRTCConnection.sendCommand,
              );
            }),
      ),
      body: Row(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
                width: 200,
                child: LeftSideButtons(
                    roverMetrics: roverMetrics,
                    sendGeneralCommand: webRTCConnection.sendGeneralCommand,
                    periodicMetricUpdates: _mirvApi.periodicMetricUpdates,
                    sendCommand: webRTCConnection.sendCommand)),
          ),
          Align(
              alignment: Alignment.center,
              child:
                  CenterPanel(localRenderer: webRTCConnection.localRenderer)),
          Align(
              alignment: Alignment.bottomRight,
              child: RightSideButtons(
                roverMetrics: roverMetrics,
                sendCommand: webRTCConnection.sendCommand,
                makeCall: webRTCConnection.makeCall,
                stopCall: webRTCConnection.stopCall,
                joystickPublish: webRTCConnection.joystickPublish,
                periodicMetricUpdates: _mirvApi.periodicMetricUpdates,
                startJoystickUpdates: webRTCConnection.startJoystickUpdates,
              ))
        ],
      ),
    );
  }
}
