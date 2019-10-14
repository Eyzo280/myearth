import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  
  List<Circle> allCircle = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allCircle.add(Circle(
      circleId: CircleId('myCircle'),
      center: LatLng(45.521563, -122.677433),
      strokeColor:  Color.fromRGBO(255, 0, 0, 0.5),
      fillColor: Color.fromRGBO(255, 0, 0, 0.5),
      radius: 15000,
    ));
    allCircle.add(Circle(
      circleId: CircleId('myCircle'),
      center: LatLng(46.522553, -122.677433),
      strokeColor:  Color.fromRGBO(255, 0, 0, 0.5),
      fillColor: Color.fromRGBO(255, 0, 0, 0.5),
      radius: 6000,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          circles: Set.from(allCircle),
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}