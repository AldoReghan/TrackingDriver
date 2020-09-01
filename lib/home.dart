import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tracking_driver/login.dart';
import 'package:tracking_driver/model/driverDataModel.dart';
import 'package:tracking_driver/model/driverModel.dart';
import 'package:tracking_driver/terimaTugas.dart';
import 'package:tracking_driver/tidakAdaTugas.dart';
import 'package:tracking_driver/tugasAktif.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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

  var loading = false;  
  int status = 2;
  final list = List<DriverDataModel>();

  SharedPreferences sharedPreferences;

  getData()async{
    sharedPreferences = await SharedPreferences.getInstance();
    int id = sharedPreferences.get('Id');
    final response = await http.post("http://app.rasc.id/log/api/driver/getdata", body: {
      "Id" : id.toString()
    });
    final data = jsonDecode(response.body)['data'];
    list.add(data);
    final type = data['Type'];
    print(type);
    print(data);
  }

  cekLogin()async{
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.get('Id') == null) {
      return false;
    }else{
      // getData();
      final type = sharedPreferences.getInt("Type");
      print(type);
      return true;
    }
  }

  logoutDriver(){
    sharedPreferences.clear();
    sharedPreferences.commit();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
  }

  @override
  void initState() {
    super.initState();
    cekLogin();
  }

  @override
  Widget build(BuildContext context) {
    final name = sharedPreferences.get("Name");
    return Scaffold(
      appBar: AppBar(
        title: Text("Pekerjaan Anda"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              child: DrawerHeader(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )),
              color: Colors.blue,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        name != null ? name : CircularProgressIndicator(),
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "08509089799809",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Saldo : Rp.",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "5.000.000",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),  
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "AB 2149 RV",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "CD engkel",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "5 CBM, ",
                          ),
                          Text(
                            "2500 KG",
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),  
            ),
            // SizedBox(height: MediaQuery.of(context).size.height/14,),
            Padding(
              padding: EdgeInsets.only(top: 70, left: 16, right: 16),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Lihat histori pengiriman",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 16, right: 16),
              child: GestureDetector(
                onTap: () {
                  logoutDriver();
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Ganti Driver",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: TugasAktif(),
      bottomNavigationBar: Container(
        height: 70,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.event_note,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                    Text("Tugas Aktif")
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.note_add,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context)=>TerimaTugas()));
                      },
                    ),
                    Text("Jadwal Tugas")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // getData();
        },
        child: Icon(Icons.chat_bubble),
      ),
    );
  }
}
