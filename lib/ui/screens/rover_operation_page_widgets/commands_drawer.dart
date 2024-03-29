import 'package:flutter/material.dart';
import 'package:mirv/constants/theme_data.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/ui/screens/webrtc_connection.dart';

class OpenCommandsDrawer extends StatelessWidget {
  const OpenCommandsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(0, 255, 17, 0),
            Color.fromARGB(0, 138, 9, 0),
            Color.fromARGB(0, 0, 0, 0),
          ],
        ),
        backgroundBlendMode: BlendMode.colorBurn,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(19, 0, 0, 0),
            spreadRadius: 1,
            blurRadius: 7.0,
            offset: Offset(-4, 4),
          ),
          BoxShadow(color: Color.fromARGB(7, 255, 255, 255), offset: Offset(7, -7), blurRadius: 7, spreadRadius: 1),
        ],
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          shadowColor: MaterialStateProperty.all(const Color.fromARGB(49, 0, 0, 0)),
          overlayColor: MaterialStateProperty.all(const Color.fromARGB(49, 21, 255, 0)),
          foregroundColor: MaterialStateProperty.all(fontColor),
          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 100, 100, 100)),
        ),
        child: const Text(
          'Open Command Drawer',
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }
}

class CommandsDrawer extends StatelessWidget {
  final WebRTCConnection webRtcConnection;
  const CommandsDrawer(this.webRtcConnection, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: allRoverCommands.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 2),
            child: ListTile(
              title: allRoverCommands[index].last,
              onTap: () {
                allRoverCommands[index].first(webRtcConnection, context);
              },
            ),
          );
        },
      ),
    );
  }
}
