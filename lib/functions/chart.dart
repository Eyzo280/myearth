import 'dart:convert';

import 'package:flutter_app/models/chart.dart';
import 'package:http/http.dart' as http;

Future getTownsList() async {
  var towns = await http.get('http://api.gios.gov.pl/pjp-api/rest/station/findAll');
  return jsonDecode(towns.body);
}

// Pobieranie danych o zanieczyszczeniach z konkretnej stacji

Future<List<ChartData>> getChartData({int idTown}) async {
  try {
    List<ChartData> listData = List<ChartData>();

    var count = await http.get(
        'http://api.gios.gov.pl/pjp-api/rest/station/sensors/' +
            idTown.toString());
    var countDecode = jsonDecode(count.body);

    for (int i = 0; i < countDecode.length; i++) {
      var data = await http.get(
          'http://api.gios.gov.pl/pjp-api/rest/data/getData/' +
              countDecode[i]['id'].toString());
      var dataDecode = jsonDecode(data.body);
      print(countDecode[i]['param']['paramFormula'] +
          ' = ' +
          dataDecode['values'].last['value'].toString());
      listData.add(ChartData(
        paramKey: countDecode[i]['param']['paramFormula'],
        paramValue: dataDecode['values'].last['value'],
      ));
    }
    return listData;
  } catch (err) {
    print(err);
  }
}