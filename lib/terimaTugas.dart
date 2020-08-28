import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TerimaTugas(),
    );
  }
}

class TerimaTugas extends StatefulWidget {
  @override
  _TerimaTugasState createState() => _TerimaTugasState();
}

class _TerimaTugasState extends State<TerimaTugas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pekerjaan anda"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: MediaQuery.of(context).size.height/1.3,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text("Tekan tombol berangkat saat sudah siap", textAlign: TextAlign.center,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Butuh bantuan? ", textAlign: TextAlign.center,),
                            Text("Silahkan tekan disini", textAlign: TextAlign.center, 
                            style: TextStyle(color: Colors.red),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height/1.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Trip #1", style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Waktu muat: ", style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Rabu, 11 Juli 2018, 23:22", style: TextStyle(
                              color: Colors.grey
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Info kendaraan: ", style: TextStyle(
                                  color: Colors.grey
                                ),),
                                Text("AB 7287 WE", style: TextStyle(
                                  color: Colors.grey
                                ),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Asal", style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("BSA Toko, East jakarta", style: TextStyle(
                              color: Colors.grey
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Tujuan", style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("BSA Toko, East jakarta", style: TextStyle(
                              color: Colors.grey
                            ),),
                          ),
                          Padding(
                          padding: EdgeInsets.only(top: 30, left: 16, right: 16),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Berangkat",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ),
          )
        ],
      )
    );
  }
}