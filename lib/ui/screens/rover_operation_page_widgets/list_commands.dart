import 'package:flutter/material.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover/rover_state_type.dart';

class CommandList extends StatelessWidget {
  const CommandList({
    Key? key,
    required this.state,
    required this.sendCommand,
  }) : super(key: key);
  final RoverStateType? state;
  final Function(RoverCommand) sendCommand;

  @override
  Widget build(BuildContext context) {
    var commandList = roverCommandsByState[state];
    return Container(
        child: state != null
            ? ListView.builder(
                itemCount: commandList!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 2),
                    child: ListTile(
                      title: SizedBox(
                        height: 110,
                        width: 64,
                        child: Container(
                          height: 150,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color.fromARGB(0, 255, 17, 0),
                                Color.fromARGB(0, 138, 9, 0),
                                Color.fromARGB(0, 0, 0, 0),
                              ], //colors
                            ),
                            backgroundBlendMode: BlendMode.colorBurn,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(19, 0, 0, 0),
                                spreadRadius: 1,
                                blurRadius: 7.0,
                                offset: Offset(-4, 4),
                              ),
                              BoxShadow(
                                  color: Color.fromARGB(7, 255, 255, 255), offset: Offset(7, -7), blurRadius: 7, spreadRadius: 1),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(const Size(64, 64)),
                              shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                ),
                              ),
                              shadowColor: MaterialStateProperty.all(const Color.fromARGB(49, 0, 0, 0)),
                              overlayColor: MaterialStateProperty.all(const Color.fromARGB(49, 21, 255, 0)),
                              foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 50, 50, 50)),
                              backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 100, 100, 100)),
                            ),
                            child: commandList[index].last,
                            onPressed: () {
                              sendCommand(commandList[index].first);
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : null);
  }
}
