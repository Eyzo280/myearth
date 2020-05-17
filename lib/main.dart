import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/chart/chart.dart';
import 'package:flutter_app/widgets/curiosities.dart';
import 'package:flutter_app/widgets/map.dart';

void main() => runApp(VideoApp());

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    Curiosities(),
    NewGraph(),
    NewMap(),
    // Text('Ziemia'),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Earth',
      home: Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
     bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode),
            title: Text("Ciekawostki"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer),
            title: Text("Wykres"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text("Mapa"),
          ),
          /*
          BottomNavigationBarItem(
            icon: Icon(Icons.blur_circular),
            title: Text("Ziemia"),
          ),
          */
        ],
        onTap: _onTap,
        currentIndex: _selectedIndex,
      ),
    ),
    );
  }
}
