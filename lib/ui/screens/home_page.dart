import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rxdart/subjects.dart';
import 'package:test/models/rover_location.dart';
import 'package:test/ui/screens/info_page.dart';
import 'package:test/ui/screens/overall_settings.dart';
import 'package:test/ui/screens/rover_operation_map.dart';
import 'package:test/ui/screens/rover_selection_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text(
          "MIRV App Home",
        ),
      ),
      body: ListView(
        children: [
          buildMenuItem(
              text: 'Rover Selection Page',
              icon: Icons.people,
              onClicked: () => selectedItem(context, 0)),
          buildMenuItem(
              text: 'Settings',
              icon: Icons.settings,
              onClicked: () => selectedItem(context, 1)),
          buildMenuItem(
              text: 'About',
              icon: Icons.info_outline_rounded,
              onClicked: () => selectedItem(context, 2)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RoverOperationMap(
                          locationStream: BehaviorSubject<LatLng>.seeded(
                              new LatLng(
                                  40.474019558671344, -104.96957447379826)),
                          piLitMarkers: [
                            RoverLocation(
                              roverId: 'piLit1',
                                location: new LatLng(
                                    40.47399235127373, -104.96957682073116)),
                            RoverLocation(
                                roverId: 'piLit2',
                                location: new LatLng(
                                    40.474025762131475, -104.9695798382163)),
                            RoverLocation(
                              roverId: 'piLit3',
                                location: new LatLng(
                                    40.47405381703737, -104.96958520263433)),
                            RoverLocation(
                              roverId: 'piLit4',
                                location: new LatLng(
                                    40.47408365724258, -104.96959090232849))
                          ]))),
          backgroundColor: Colors.orange,
          label: Row(
            children: const <Widget>[
              Text(
                'Open Maps',
                style: TextStyle(color: Colors.black87),
              ),
              Icon(
                Icons.map,
                color: Colors.black87,
              ),
            ],
          )),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4),
      child: ListTile(
          leading: Icon(icon),
          title: Text(text),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: onClicked),
    );
  }

  selectedItem(context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const RoverSelectionPage(),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const InfoPage()),
        );
    }
  }
}
