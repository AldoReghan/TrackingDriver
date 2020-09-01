import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'model/driverDataModel.dart';
import 'terimaTugas.dart';
import 'tugasAktif.dart';
import 'tugasAktif.dart';
import 'tugasAktif.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TidakAdaTugas(),
    );
  }
}

class TidakAdaTugas extends StatefulWidget {
  int value;
  TidakAdaTugas({this.value});
  @override
  _TidakAdaTugasState createState() => _TidakAdaTugasState();
}

class _TidakAdaTugasState extends State<TidakAdaTugas> {
  final list = List<DriverDataModel>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network("https://1ivu6q1gqh2kndjc23ryof11v5-wpengine.netdna-ssl.com/wp-content/uploads/2018/08/UPS_truck_padded_medium.png",
                scale: 2,
              ),
              Text("Anda belum memiliki pekerjaan", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text("Silahkan menunggu untuk mendapatkan panggilan atau refresh halaman ini", textAlign: TextAlign.center ,style: TextStyle(
                color: Colors.grey
              ),)
              )
            ],
          ),
        ) ,
     );
    
    
  }
}