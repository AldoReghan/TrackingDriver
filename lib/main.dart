import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tracking_driver/home.dart';
import 'package:tracking_driver/login.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomePage',
      home: MainHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {

  SharedPreferences sharedPreferences;
  bool _isloggedin ;
  String _currentPosition;
  String lat;
  String lng;

  int driverId;
  List data;

  getLocation(){
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
    .then((Position position){
      setState(() {
        _currentPosition = "${position.latitude}, ${position.longitude}";
        lat = position.latitude.toString();
        lng = position.longitude.toString();
        if (_currentPosition != null) {
          print(_currentPosition);
          getData();
          
        }
      });
    }).catchError((e){
      //print(e);
    });
  }

  Future<String> getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    int id = sharedPreferences.get('Id');
    http.Response response = await http.post(
      Uri.encodeFull("http://app.rasc.id/log/api/driver/getdata"),
      body: {"Id": id.toString(), "IsDone": "0"},
    );
    setState(() {
      data = json.decode(response.body);
      driverId = data[0]['DriverId'];
      print("driver id "+driverId.toString());
      print("langlit " + _currentPosition.toString());
      print(id);
      updateLanglit();
      
    });
    return "Success!";
  }

updateLanglit() async {
    http.Response response = await http.post(
      Uri.encodeFull("http://app.rasc.id/log/api/driver/getlocation"),
      body: {
        "DriverId" : driverId.toString(),
        "Lat" : lat.toString(),
        "Lng" : lng.toString()
      },
    );
    print(response.body);
    return "Success!";
  }

  ceklogin()async{
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getInt("Id") == null) {
      setState(() {
        _isloggedin = false;
      });
      print("anda belum login");
    }else{
      setState(() {
        _isloggedin = true;
      });
      getLocation();
      
      
      
      print("anda sudah login");
    }
  }

  @override
  void initState() { 
    super.initState();
    ceklogin();
  }

  sepMantap(){
    switch (_isloggedin) {
      case true:
        return Scaffold(
          body: Home(),
        );
        break;
      default:
        return Scaffold(
          body: LoginPage(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: sepMantap(),));
  }
}