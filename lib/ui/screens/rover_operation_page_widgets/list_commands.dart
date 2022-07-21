import 'package:flutter/material.dart';
import 'package:mirv/models/rover_control/rover_command.dart';
import 'package:mirv/models/rover_state_type.dart';

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
                                color: Color.fromARGB(29, 0, 0, 0),
                                spreadRadius: 1,
                                blurRadius: 7.5,
                                offset: Offset(-5, 5),
                              ),
                              BoxShadow(
                                  color: Color.fromARGB(40, 255, 255, 255),
                                  offset: Offset(7, -7),
                                  blurRadius: 7,
                                  spreadRadius: 1),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(Size(64, 64)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                ),
                              ),
                              shadowColor: MaterialStateProperty.all(Color.fromARGB(0, 0, 0, 0)),
                              overlayColor: MaterialStateProperty.all(Color.fromARGB(49, 21, 255, 0)),
                              foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 50, 50, 50)),
                              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 100, 100, 100)),
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
