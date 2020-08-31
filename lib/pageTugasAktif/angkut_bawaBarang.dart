import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AngkutBawa(),
    );
  }
}

class AngkutBawa extends StatefulWidget {
  @override
  _AngkutBawaState createState() => _AngkutBawaState();
}

class _AngkutBawaState extends State<AngkutBawa> {
  
  showDialogAmbilMuatan() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Perhatian",
              textAlign: TextAlign.center,
            ),
            content: Text(
              "Apakah anda sudah benar berada di BSA TOKO?",
              textAlign: TextAlign.center,
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
                        "Ya, saya yakin",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
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
                        "Tidak, saya belum yakin",
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 475,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue)),
            width: 500,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alamat",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Kampung warna-warni malang, jalan malang nggone nang malang",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.navigation,
                          color: Colors.blue,
                        ),
                        Text(
                          "Lihat peta",
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Detail :",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Container(child: Text("No. 10")),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Pesan Admin :",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Text(
                        "Harus cepet ya",
                        style: TextStyle(color: Colors.red),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Waktu",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Text(
                        "Anda harus sampai 1 jam 55 menit lagi",
                        style: TextStyle(color: Colors.grey),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        "Rabu, 28 Agustus 2020, 14:13",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Nomor Kontak",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("BSA Toko"),
                                Text("085734542356"),
                              ],
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.phone),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.chat)
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Apakah anda sudah sampai ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        "Berikan leading code anda kepada petugas/security di tempat tujuan",
                        style: TextStyle(color: Colors.grey),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        "20202022020",
                        style: TextStyle(color: Colors.blue),
                      )),
                  GestureDetector(
                    onTap: () => showDialogAmbilMuatan(),
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Apakah anda sudah sampai tujuan ?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
