import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tracking_driver/tidakAdaTugas.dart';
import 'package:tracking_driver/uploadPO.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:tracking_driver/uploadSrtJl.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TugasAktif(),
    );
  }
}

class TugasAktif extends StatefulWidget {
  @override
  _TugasAktifState createState() => _TugasAktifState();
}

class _TugasAktifState extends State<TugasAktif> {
  int currentStep = 0;
  bool complete = false;

  // status 0 : belum berangkat
  // status 1 : berangkat
  // status 2 : pickup barang
  // status 3 : barang termuat
  // status 4 : antar ketujuan
  // status 5 : selesai

  SharedPreferences sharedPreferences;
  List data;

  int status;
  int driverId;
  int orderId;
  String messageAdmin;
  String _currentPosition;

  getLocation(){
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
    .then((Position position){
      setState(() {
        _currentPosition = position.toString();
        if (_currentPosition != null) {
          print(_currentPosition);
        }
      });
    }).catchError((e){
      print(e);
    });
  }

  updateLanglit()async{
    final response = await http.post("http://app.rasc.id/log/api/driver/getlocation", body: {
      "DriverId" : driverId.toString(),
      "LangLit" : _currentPosition
    });
    jsonDecode(response.body);
  }

  Future<String> getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    int id = sharedPreferences.get('Id');
    http.Response response = await http.post(
      Uri.encodeFull("http://app.rasc.id/log/api/driver/getdata"),
      body: {"Id": id.toString(), "IsDone": "0"},
    );
    setState(() {
      data = jsonDecode(response.body);
      status = data[0]['Status'];
      driverId = data[0]['DriverId'];
      orderId = data[0]['OrderId'];
    });
    print(data);
    print("ini status " + status.toString());
    print("ini driver " + driverId.toString());
    return "Success!";
  }

  buttonCek() {
    if (status == 1) {
      return GestureDetector(
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
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      );
    } else if (status == 3) {
      return GestureDetector(
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
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      );
    }
  }

  updateStatus(String message) async {
    final response = await http
        .post("http://app.rasc.id/log/api/driver/changestatus", body: {
      "DriverId": driverId.toString(),
      "OrderId": orderId.toString(),
      "Status": status.toString(),
      "Message": message
    });
    final data = jsonDecode(response.body);
    print(data);
  }

  cekDriverId() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final id = sharedPreferences.get("Id");
    if (id == null) {
      print("id kosong");
    } else {
      // print(id);
      return true;
    }
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
              "Apakah anda telah mengkonfirmasi tugas sebelumnya? ",
              textAlign: TextAlign.center,
            ),
            actions: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        String rondo;
                        status = status + 1;
                        if (status == 2) {
                          rondo = "Driver telah mengangkut barang";
                          updateStatus(rondo);
                          updateLanglit();
                        } else if (status == 3) {
                          rondo = "Driver telah Sampai Tujuan";
                          updateStatus(rondo);
                          updateLanglit();
                        } else if (status == 4) {
                          rondo = "Barang Sudah Sampai Tujuan";
                          updateStatus(rondo);
                          updateLanglit();
                        } else if (status == 5) {
                          rondo = "Barang Sudah Diturunkan";
                          updateStatus(rondo);
                          updateLanglit();
                        }
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
      height: status == 1 ? 475 : 400,
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
                "${data[0]['TujuanBarang']}",
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
              Container(child: Text("No.Resi: " + "${data[0]['NoResi']}")),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Pesan Admin :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 2),
                  child: Text(
                    // "${data[0]['Message']}",
                    "Harus cepat ya",
                    style: TextStyle(color: Colors.red),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "${data[0]['WaktuPenjemputan']}",
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
                            Text("${data[0]['NamaPengirim']}"),
                            Text("${data[0]['NoPengirim']}"),
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
              status == 1
                  ? GestureDetector(
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
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : Container( height: 1,)
            ],
          ),
        ),
      ),
    );
  }

  antarBawa2() {
    return Container(
      height: status == 3 ? 475 : 400,
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
                "${data[0]['TujuanBarang']}",
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
              Container(child: Text("No.Resi: " + "${data[0]['NoResi']}")),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Pesan Admin :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 2),
                  child: Text(
                    // "${data[0]['Message']}",
                    "Harus cepat ya",
                    style: TextStyle(color: Colors.red),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "${data[0]['WaktuPenjemputan']}",
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
                            Text("${data[0]['NamaPengirim']}"),
                            Text("${data[0]['NoPengirim']}"),
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
              status == 3
                  ? GestureDetector(
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
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : Container( height: 1,)
            ],
          ),
        ),
      ),
    );
  }

  angkutTurun() {
    return Container(
      height: status == 2 ? 300 : 200,
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
                  status == 2 ? "Apa yang diangkut?" : "Apa yang diturunkan?",
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
                onTap: () => showDialogBawaMuatan(),
                child: status == 2
                    ? Container(
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
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      )
                    : Container( height: 1,)
              ),
            ],
          ),
        ),
      ),
    );
  }

  angkutTurun2() {
    return Container(
      height: status == 4 ? 300 : 200,
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
                  status == 2 ? "Apa yang diangkut?" : "Apa yang diturunkan?",
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
                onTap: () => showDialogBawaMuatan(),
                child: status == 4
                    ? Container(
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
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      )
                    : Container( height: 1,),
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
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>UploadSrtJl()));
                },
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
                      "Upload surat jalan",
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
  void initState() {
    super.initState();
    getData();
    cekDriverId();
  }

  @override
  Widget build(BuildContext context) {
    print(status);
    if (status == 6) {
      return Scaffold(
        body: TidakAdaTugas(),
      );
    } else {
      switch (status) {
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
                  antarBawa2(),
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
                  antarBawa2(),
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
                  antarBawa2(),
                  SizedBox(
                    height: 20,
                  ),
                  angkutTurun2()
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
                  antarBawa2(),
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
