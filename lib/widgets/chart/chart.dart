import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/functions/chart.dart';
import 'package:flutter_app/widgets/chart/graph.dart';

class Stations {
  int id;
  String name;

  Stations(this.id, this.name);
}

class NewGraph extends StatefulWidget {
  @override
  _NewGraph createState() {
    return new _NewGraph();
  }
}

class _NewGraph extends State<NewGraph> {
  int z = 0;
  var rng = new Random();
  List<Smog> data = [];

  String nameCity2 = "";
  List<Stations> _currencies = [];
  Stations _currentItemSelected;
  bool y = true;

  void getDataTown() {
    getChartData(idTown: z).then((val) {
      // Ustawia liste List<Smog> data = na nowe dane pobrane z api GIOS
      data = [];
      if (val != null) {
        for (var i in val) {
          data.add(new Smog(i.paramKey, i.paramValue.toDouble(), 10000.0));
        }
      } else {
        print('brak danych');
      }

      /*
        data = [
          new Smog('CO', val[0].paramValue.toDouble(), 10000.0),
          new Smog('O\u2083', rng.nextInt(140).toDouble(), 120.0),
          new Smog('PM\u2081\u2080', rng.nextInt(70).toDouble(), 50.0),
          new Smog('PM\u2082\u0656\u2085  ', rng.nextInt(30).toDouble(), 25.0),
          new Smog('SO\u2082', rng.nextInt(400).toDouble(), 350),
          new Smog('NO\u2082', 5.5, 200),
        ];
        */
      setState(() {});
      print(data);
    });
  }

  onChangeDropdownItem(Stations selected) {
    setState(() {
      print("wybrane:" + selected.name);
      _currentItemSelected = selected;
      z = selected.id;
      getDataTown();
    });
  }

  List<DropdownMenuItem<Stations>> _dropdownitems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTownsList().then((val) {
      for (int i = 0; i < val.length; i++) {
        _currencies.add(Stations(val[i]['id'], val[i]['stationName']));
        _dropdownitems.add(DropdownMenuItem(
          value: _currencies[i],
          child: Text(_currencies[i].name),
        ));
      }
      _currentItemSelected = _currencies[0];
      z = _currentItemSelected.id;
      print(_currentItemSelected);
      getDataTown();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wykres"),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          /*
          FutureBuilder<PostsList>(
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData && y == true) {
                y = false;
                var lt = snapshot.data.posts.length;
                for (var i = 0; i < lt; i++) {
                  _currencies
                      .add(Stations(i, snapshot.data.posts[i].stationName));
                  print(snapshot.data.posts[i].stationName);
                  _dropdownitems.add(DropdownMenuItem(
                    value: _currencies[i],
                    child: Text(_currencies[i].name),
                  ));
                }
                _currentItemSelected = _currencies[0];
                print(
                    "_______________________________________________________________________________________");
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return DropdownButton<Stations>(
                items: _dropdownitems,
                onChanged: onChangeDropdownItem,
                value: _currentItemSelected,
              );
            },
          ),
          */
          _currencies.isEmpty
              ? const CircularProgressIndicator()
              : DropdownButton<Stations>(
                  items: _dropdownitems,
                  onChanged: onChangeDropdownItem,
                  value: _currentItemSelected,
                ),
          /*
          FutureBuilder<List<ChartData>>(
            future: getChartData(idTown: z),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                data.add([
                  new Smog('CO', rng.nextInt(12000).toDouble(), 10000.0),
                  new Smog('O\u2083', rng.nextInt(140).toDouble(), 120.0),
                  new Smog('PM\u2081\u2080', rng.nextInt(70).toDouble(), 50.0),
                  new Smog('PM\u2082\u0656\u2085  ', rng.nextInt(30).toDouble(),
                      25.0),
                  new Smog('SO\u2082', rng.nextInt(400).toDouble(), 350),
                  new Smog('NO\u2082', 5.5, 200),
                ]);
                print(data[z]);
                return Text('');
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return Text('');

              /*
              if (snapshot.hasData) {
                var pm = snapshot.data.values[0].value;
                if (pm == null) {
                  pm = 12;
                }
                for (var i = 0; i < 187; i++) {
                  var rng = new Random();
                  data.add(
                    [
                      new Smog('CO', rng.nextInt(12000).toDouble(), 10000.0),
                      new Smog('O\u2083', rng.nextInt(140).toDouble(), 120.0),
                      new Smog(
                          'PM\u2081\u2080', rng.nextInt(70).toDouble(), 50.0),
                      new Smog('PM\u2082\u0656\u2085  ',
                          rng.nextInt(30).toDouble(), 25.0),
                      new Smog('SO\u2082', rng.nextInt(400).toDouble(), 350),
                      new Smog('NO\u2082', pm, 200),
                    ],
                  );
                }
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return Text('');
              */
            },
          ),*/
          const Text(" "),
          Text(
            "Zanieczyszczenie powietrza względem normy",
            style: Theme.of(context).textTheme.body2,
          ),
          HorizontalBarChart(data),
          const Text("Nazwy substancji"),
          const Text('CO - Tlenek węgla (norma: 10000 µg/m\u00B3)'),
          const Text('O\u2083 - Ozon troposferyczny(norma: 120 µg/m\u00B3)'),
          const Text('SO\u2082 - Dwutlenek siarki (norma: 350 µg/m\u00B3)'),
          const Text('NO\u2082 - Dwutlenek azotu (norma: 200 µg/m\u00B3)'),
          const Text(
              'PM\u2081\u2080 - Pył zawieszony PM10 (norma: 50 µg/m\u00B3)'),
          const Text(
              'PM\u2082\u0656\u2085 - Pył zawieszony PM2,5 (norma: 25 µg/m\u00B3)'),
        ]),
      )),
    );
  }
}
