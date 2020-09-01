import 'package:flutter/material.dart';
import 'package:tracking_driver/home.dart';
import 'package:tracking_driver/login.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_driver/model/driverModel.dart';

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
  bool _isloggedin = true;

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
      print("anda sudah login");
    }
  }

  @override
  void initState() { 
    super.initState();
    ceklogin();
  }

  @override
  Widget build(BuildContext context) {
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
}