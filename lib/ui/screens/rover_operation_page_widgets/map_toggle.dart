// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:rxdart/subjects.dart';
// import 'package:mirv/models/rover_location.dart';
// import 'package:mirv/ui/screens/rover_operation_map.dart';

// class ToggleDisableMap extends StatefulWidget {
//   const ToggleDisableMap({Key? key}) : super(key: key);

//   @override
//   State<ToggleDisableMap> createState() => _ToggleDisableMapState();
// }

// class _ToggleDisableMapState extends State<ToggleDisableMap> {
//   bool enable = true;
//   late final OverlayEntry? entry;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//             width: 175,
//             child: ElevatedButton.icon(
//                 onPressed: showOverlay,
//                 label: const Text(
//                   "Map",
//                   textScaleFactor: 2.5,
//                 ),
//                 icon: const Icon(
//                   Icons.map,
//                   size: 60,
//                 ),
//                  style: ButtonStyle(
//                 backgroundColor:
//                     MaterialStateProperty.all(Color.fromARGB(255, 98, 7, 255))),
                
              
//             child: enable == true
//                 ? const Text(
//                     'Show Map',
//                     style: TextStyle(fontSize: 50),
//                   )
//                 : const Text('Show Map', style: TextStyle(fontSize: 50))))
//       ],
//     );
//   }

//   void showOverlay() {
//     entry = OverlayEntry(
//         builder: (context) => Positioned(
//             top: 193,
//             right: 280,
//             child: Container(
//                 width: 800,
//                 height: 450,
//                 child: RoverOperationMap(
//                     locationStream: BehaviorSubject<LatLng>.seeded(
//                         new LatLng(40.474019558671344, -104.96957447379826)),
//                     piLitMarkers: [
//                       RoverLocation(
//                           rover_id: 'piLit1',
//                           location: new LatLng(
//                               40.47399235127373, -104.96957682073116)),
//                       RoverLocation(
//                           rover_id: 'piLit2',
//                           location: new LatLng(
//                               40.474025762131475, -104.9695798382163)),
//                       RoverLocation(
//                           rover_id: 'piLit3',
//                           location: new LatLng(
//                               40.47405381703737, -104.96958520263433)),
//                       RoverLocation(
//                           rover_id: 'piLit4',
//                           location: new LatLng(
//                               40.47408365724258, -104.96959090232849))
//                     ]))));
//     final overlay = Overlay.of(context)!;
//     overlay.insert(entry!);
//   }
// }
