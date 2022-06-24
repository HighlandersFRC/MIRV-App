import 'package:flutter/material.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/models/rover_state_type.dart';

class CommandList extends StatelessWidget {
  const CommandList({Key? key, required this.roverMetrics}) : super(key: key);
  final RoverMetrics? roverMetrics;

//RxList<RoverCommands> roverCommands = <RoverCommands>[].obs;

  List<String> _stateListCommands(RoverStateType roverState) {
    switch (roverState) {
      case RoverStateType.disabled:
        print('disable');
        return <String>['testa', 'test1a', 'test2a'];
      case RoverStateType.docked:
        return <String>['testb', 'test1b', 'test2b'];
      case RoverStateType.eStop:
        return <String>['testc', 'test1c', 'test2c']; //hexagon?
      case RoverStateType.remoteOperation:
        return <String>['testd', 'test1d', 'test2d'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: roverMetrics != null
            ? ListView.builder(
                itemCount: _stateListCommands(roverMetrics!.state).length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title:
                          Text(_stateListCommands(roverMetrics!.state)[index]));
                },
              )
            : null);
  }
}
