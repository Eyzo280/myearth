import 'dart:convert';
import 'package:http/http.dart' as http;

// Odpowiada za pobieranie danych do mapy pobiera Lokalizację i Zanieczyszczenie powietrza danych miejsc

import 'package:flutter_app/models/map.dart';

Stream<List<Town>> get getTowns async* {
  final response =
      await http.get('http://api.gios.gov.pl/pjp-api/rest/station/findAll');
  final decodeResponse = jsonDecode(response.body);

  var towns = List<Town>();

  for (var i in decodeResponse) {
    var town;
    if (i != null) {
      var jsonZanieczyszczenia = await http.get('http://api.gios.gov.pl/pjp-api/rest/aqindex/getIndex/' + i['id'].toString());
      var stanZanieczyszczenia = jsonDecode(jsonZanieczyszczenia.body);

      town = Town(
          cityName: i['stationName'],
          gegrLat: i['gegrLat'],
          gegrLon: i['gegrLon'],
          stanZanieczyszczenia: stanZanieczyszczenia['stIndexLevel']['indexLevelName']);
    }

    //print(i);
    towns.add(town);
    yield towns;
  }
}
