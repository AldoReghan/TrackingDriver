import 'package:flutter/material.dart';
import 'package:tracking_driver/terimaTugas.dart';
import 'package:tracking_driver/tidakAdaTugas.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TidakAdaTugas(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TerimaTugas()));
        },
        child: Icon(Icons.chat_bubble),
      ),
    );
  }
}
