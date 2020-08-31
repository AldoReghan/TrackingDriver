import 'package:flutter/material.dart';
import 'package:tracking_driver/tidakAdaTugas.dart';
import 'package:tracking_driver/uploadFoto.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TugasAktif(),
    );
  }
}

class TugasAktif extends StatefulWidget {
  int value;
  TugasAktif({this.value});
  @override
  _TugasAktifState createState() => _TugasAktifState();
}

class _TugasAktifState extends State<TugasAktif> {
  int currentStep = 0;
  bool complete = false;
  int number = 1;

  // status 0 : belum berangkat
  // status 1 : berangkat
  // status 2 : pickup barang
  // status 3 : barang termuat
  // status 4 : antar ketujuan
  // status 5 : selesai

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
                      setState(() {
                        print("dialog");
                      });
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

  showDialogNaikMuatan() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Masalah",
              textAlign: TextAlign.center,
            ),
            content: Container(
              height: 150,
              child: Column(
                children: [
                  Text(
                    "Pastikan apakah:",
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    number == 2 ? "1. Barang sudah dimuat" : "1. Barang sudah diturunkan",
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "2. Surat jalan fisik sudah diterima",
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Apakah anda sudah melakukan kedua hal diatas?",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
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

  showDialogBawaMuatan() {
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
                      setState(() {
                        number = number + 1;
                      });
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

  antarBawa() {
    return Container(
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
                    "2020920920909",
                    style: TextStyle(color: Colors.blue),
                  )),
              GestureDetector(
                onTap: () => showDialogBawaMuatan(),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
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
      ),
    );
  }

  angkutTurun() {
    return Container(
      height: 300,
      child: Container(
        width: 500,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Text(
                "Kode leading anda",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    "202020202020",
                    style: TextStyle(color: Colors.red),
                  )),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  number == 2 ? "Apa yang diangkut?" : "Apa yang diturunkan?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    "1 other semen 0",
                    style: TextStyle(color: Colors.grey),
                  )),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Kapan?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text("Anda telah menurunkan barang",
                    style: TextStyle(color: Colors.grey)),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  "Jumat, 28 Agustus 2020, 17:20",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "*jangan lupa untuk minta surat jalan fisik",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              GestureDetector(
                onTap: () => showDialogNaikMuatan(),
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
                      "Apakah anda sudah menurunkan muatan ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  uploadFoto() {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PO Number / Order Number :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UploadFoto())),
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Apakah ada tambahan biaya ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "*Pastikan surat jalan sudah ditandatangani penerima",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Upload surat jalan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Tekan tombol dibawah ini jika sudah menambahakan foto pod dan biaya tambahan",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Ya, tugas sudah selesai",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    if (number == 6) {
      return Scaffold(
        body: TidakAdaTugas(),
      );
    }else{
      switch (number) {
      case 1:
        return Scaffold(
            body: Padding(
          padding: EdgeInsets.all(16),
          child: antarBawa(),
        ));
        break;
      case 2:
        return Scaffold(
            body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                antarBawa(),
                SizedBox(
                  height: 20,
                ),
                angkutTurun()
              ],
            ),
          ),
        ));
        break;
      case 3:
        return Scaffold(
            body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                antarBawa(),
                SizedBox(
                  height: 20,
                ),
                angkutTurun(),
                SizedBox(
                  height: 20,
                ),
                antarBawa(),
              ],
            ),
          ),
        ));
        break;
      case 4:
        return Scaffold(
            body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                antarBawa(),
                SizedBox(
                  height: 20,
                ),
                angkutTurun(),
                SizedBox(
                  height: 20,
                ),
                antarBawa(),
                SizedBox(
                  height: 20,
                ),
                angkutTurun()
              ],
            ),
          ),
        ));
        break;
      case 5:
        return Scaffold(
            body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                antarBawa(),
                SizedBox(
                  height: 20,
                ),
                angkutTurun(),
                SizedBox(
                  height: 20,
                ),
                antarBawa(),
                SizedBox(
                  height: 20,
                ),
                angkutTurun(),
                SizedBox(
                  height: 20,
                ),
                uploadFoto()
              ],
            ),
          ),
        ));
        break;
      default:
    }
    }
  }
}
