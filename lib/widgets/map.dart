import 'package:flutter/material.dart';
import 'package:flutter_app/models/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../functions/map.dart';

class NewMap extends StatelessWidget {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(52.2297700, 21.0117800);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<Circle> allCircle = List<Circle>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa zanieczyszczeń'),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder<List<Town>>(
          stream: getTowns,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              for (var i = allCircle.length; i < snapshot.data.length; i++) {
                final String stanZan = snapshot.data[i].stanZanieczyszczenia;
                allCircle.add(Circle(
                  circleId: CircleId(snapshot.data[i].cityName),
                  center: LatLng(double.parse(snapshot.data[i].gegrLat),
                      double.parse(snapshot.data[i].gegrLon)),
                  strokeColor: stanZan == 'Bardzo dobry'
                      ? Color.fromRGBO(0, 255, 0, 0.5)
                      : stanZan == 'Dobry'
                          ? Color.fromRGBO(127, 255, 0, 0.5)
                          : stanZan == 'Umiarkowany'
                              ? Color.fromRGBO(240, 230, 140, 0.5)
                              : stanZan == 'Dostateczny'
                                  ? Color.fromRGBO(255, 140, 0, 0.5)
                                  : stanZan == 'Zły'
                                      ? Color.fromRGBO(255, 69, 0, 0.5)
                                      : stanZan == 'Bardzo zły'
                                          ? Color.fromRGBO(178, 34, 34, 0.5)
                                          : Colors.grey,
                  fillColor: stanZan == 'Bardzo dobry'
                      ? Color.fromRGBO(0, 255, 0, 0.3)
                      : stanZan == 'Dobry'
                          ? Color.fromRGBO(127, 255, 0, 0.3)
                          : stanZan == 'Umiarkowany'
                              ? Color.fromRGBO(240, 230, 140, 0.3)
                              : stanZan == 'Dostateczny'
                                  ? Color.fromRGBO(255, 140, 0, 0.3)
                                  : stanZan == 'Zły'
                                      ? Color.fromRGBO(255, 69, 0, 0.3)
                                      : stanZan == 'Bardzo zły'
                                          ? Color.fromRGBO(178, 34, 34, 0.3)
                                          : Colors.grey,
                  radius: 10000,
                ));
                print(stanZan);
              }
              //print(snapshot.toString() + 'SDSASADSA');

              return GoogleMap(
                circles: Set.from(allCircle),
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        /*
        child: FutureBuilder<PostsList>(
          future: fetchPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              for (var i = 0; i < snapshot.data.posts.length; i++) {
                allCircle.add(Circle(
                  circleId: CircleId('Warszawa'),
                  center: LatLng(double.parse(snapshot.data.posts[i].gegrLat),
                      double.parse(snapshot.data.posts[i].gegrLon)),
                  strokeColor: Color.fromRGBO(0, 255, 0, 0.5),
                  fillColor: Color.fromRGBO(0, 255, 0, 0.3),
                  radius: 10000,
                ));
              }

              return GoogleMap(
                circles: Set.from(allCircle),
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
        */
      ),
    );
  }
}
