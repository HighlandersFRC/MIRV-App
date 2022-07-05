import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class RoverMap extends StatefulWidget{
  @override
  _RoverMapState createState() => _RoverMapState();
}              

class _RoverMapState extends State<RoverMap> {
  GoogleMapController? mapController; //contrller for Google map
  static const LatLng showLocation = const LatLng(40.474019558671344, -104.9693540321517); //location to show in map
  Set<Marker> markers = {}; //markers for google map
  BitmapDescriptor mapMarker = BitmapDescriptor.defaultMarker;

@override
void initState() {
  super.initState();
  setCustomMarker();
}

void setCustomMarker() async {
  mapMarker = await BitmapDescriptor.fromAssetImage(
    ImageConfiguration(), 'assets/images/pi_lit_icon.png');

    getmarkers();
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar( 
             title: Text("Rover 1"),
             backgroundColor: Colors.deepOrangeAccent,
          ),
          body: GoogleMap( //Map widget from google_maps_flutter package
                    zoomGesturesEnabled: true, //enable Zoom in, out on map
                    initialCameraPosition: CameraPosition( //innital position in map
                      target: showLocation, //initial position
                      zoom: 15.0, //initial zoom level
                    ),
                    markers: markers, //markers to show on map
                    mapType: MapType.normal, //map type
                    onMapCreated: (controller) { //method called when map is created
                      setState(() {
                        mapController = controller; 
                      });
                    },
                  ),
       );
  }

  Set<Marker> getmarkers() { //markers to place on map
  
    setState(() { 
      markers.add(
        Marker( //add first marker
        markerId: MarkerId('Marker Title First '),
        position: showLocation, //position of marker        
        infoWindow: InfoWindow( //popup info 
          title: 'Marker Title First ',
          snippet: 'My Custom Subtitle',
        ),
        icon: mapMarker,
      ));

      markers.add(
        Marker( //add second marker
        markerId: MarkerId('Marker Title Second '),
        position: LatLng(40.47448994679306, -104.96945699138084), //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
        icon: mapMarker, //Icon for Marker
      ));

      markers.add(
        Marker( //add third marker
        markerId: MarkerId('Marker Title Third '),
        position: LatLng(40.47387580071958, -104.96979226749094), //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'Marker Title Third ',
          snippet: 'My Custom Subtitle',
        ),
        icon: mapMarker, //Icon for Marker
      ));
       //add more markers here 
    });
  
    

    return markers;
  }
}

