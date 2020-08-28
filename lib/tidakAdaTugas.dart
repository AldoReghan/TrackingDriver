import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TidakAdaTugas(),
    );
  }
}

class TidakAdaTugas extends StatefulWidget {
  @override
  _TidakAdaTugasState createState() => _TidakAdaTugasState();
}

class _TidakAdaTugasState extends State<TidakAdaTugas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pekerjaan anda"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 210,
              child: DrawerHeader(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Aldo Reghan Ramadhan",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "08509089799809",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ),
              color: Colors.blue,
            )
          ],
        ),
      ),
      body: Padding(
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
        ),
    );
  }
}