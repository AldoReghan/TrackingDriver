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
  _dialogAccept() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Konfirmasi", textAlign: TextAlign.center,),
              content: SingleChildScrollView(
                child: Container(
                  // color: Colors.red,
                  height: 400,
                  child: Column(
                    children: [
                      Text("Anda memiliki pekerjaan pengiriman", textAlign: TextAlign.center,  style: TextStyle(
                        color: Colors.grey
                      ),),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("Pesan Admin :", textAlign: TextAlign.center,  style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Text("Harus cepat ya", textAlign: TextAlign.center,  style: TextStyle(
                        color: Colors.red
                      ),),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("Waktu Muat :", textAlign: TextAlign.center,  style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Text("Sabtu, 29 Agustus 2020", textAlign: TextAlign.center,  style: TextStyle(
                        color: Colors.grey
                      ),),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("AB 2178 RV", textAlign: TextAlign.center,  style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("Asal", textAlign: TextAlign.center,  style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("Null", textAlign: TextAlign.center,  style: TextStyle(
                                color: Colors.black,
                              ),),
                              Text("Kopi Rempong", textAlign: TextAlign.center,  style: TextStyle(
                                color: Colors.black,
                              ),),
                              Text("Jl. Buduran siwalan panji", textAlign: TextAlign.center,  style: TextStyle(
                                color: Colors.black,
                              ),),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("Tujuan", textAlign: TextAlign.center,  style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("Null", textAlign: TextAlign.center,  style: TextStyle(
                                color: Colors.black,
                              ),),
                              Text("Kopi Rempong", textAlign: TextAlign.center,  style: TextStyle(
                                color: Colors.black,
                              ),),
                              Text("Jl. Buduran siwalan panji", textAlign: TextAlign.center,  style: TextStyle(
                                color: Colors.black,
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          "Ya, berangkat",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    SizedBox(height: 5,),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          "Tidak, terima kasih",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  ],
                )
              ],
            );
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pekerjaan anda"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              "Tekan tombol berangkat saat sudah siap",
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Butuh bantuan? ",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Silahkan tekan disini",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.blue)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Trip #1",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Waktu muat: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Rabu, 11 Juli 2018, 23:22",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Info kendaraan: ",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      "AB 7287 WE",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Asal",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "BSA Toko, East jakarta",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Tujuan",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "BSA Toko, East jakarta",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 30, left: 16, right: 16),
                                child: GestureDetector(
                                  onTap: () {
                                    _dialogAccept();
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        border: Border.all(color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                  )),
            )
          ],
        )));
  }
}
