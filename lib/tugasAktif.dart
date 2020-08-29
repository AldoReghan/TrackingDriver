import 'package:flutter/material.dart';
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
  @override
  _TugasAktifState createState() => _TugasAktifState();
}

class _TugasAktifState extends State<TugasAktif> {
  int currentStep = 0;
  bool complete = false;

  showDialogAmbilMuatan() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Perhatian",
              textAlign: TextAlign.center,
            ),
            content: Text("Apakah anda sudah benar berada di BSA TOKO?",
             textAlign: TextAlign.center,),
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
                  Text("Pastikan apakah:",
                   textAlign: TextAlign.center,),
                   Text("1. Barang sudah dimuat",
                   textAlign: TextAlign.center,),
                   Text("2. Surat jalan fisik sudah diterima",
                   textAlign: TextAlign.center,),
                   Container(
                     margin: EdgeInsets.only(top: 20),
                     child: Text("Apakah anda sudah melakukan kedua hal diatas?",
                     textAlign: TextAlign.center,),
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
            content: Text("Apakah anda sudah benar berada di BSA TOKO?",
             textAlign: TextAlign.center,),
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

  showDialogTurunMuatan() {
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
                  Text("Pastikan apakah:",
                   textAlign: TextAlign.center,),
                   Text("1. Barang sudah diturunkan",
                   textAlign: TextAlign.center,),
                   Text("2. Surat jalan fisik sudah diterima",
                   textAlign: TextAlign.center,),
                   Container(
                     margin: EdgeInsets.only(top: 20),
                     child: Text("Apakah anda sudah melakukan kedua hal diatas?",
                     textAlign: TextAlign.center,),
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
                        "sudah, saya yakin",
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
                        "Belum",
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

  goTo(int step) {
    setState(() {
      currentStep = step;
    });
  }

  next() {
    currentStep + 1 != currentStep
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        steps: [
          Step(
              isActive: true,
              title: Text("Ambil Muatan"),
              content: Container(
                height: 475,
                child: ListView(
                  children: [
                    Container(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
          Step(
              isActive: false,
              title: Text("Muat barang ke kendaraan"),
              content: Container(
                height: 300,
                child: ListView(
                  children: [
                    Container(
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
                                "Apa yang diangkut?",
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
                              child: Text("Anda telah memuat barang",
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
                              onTap: (){
                                showDialogNaikMuatan();
                              },
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
                                    "Apakah anda sudah menaikan muatan ?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Step(
              isActive: false,
              title: Text("Bawa muatan ke tujuan"),
              content: Container(
                height: 475,
                child: ListView(
                  children: [
                    Container(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                              onTap: ()=>showDialogBawaMuatan(),
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
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
          Step(
              isActive: false,
              title: Text("Turunkan muatan dari kendaraan"),
              content: Container(
                height: 300,
                child: ListView(
                  children: [
                    Container(
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
                                "Apa yang diturunkan?",
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
                              onTap: ()=>showDialogTurunMuatan(),
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
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Step(
              isActive: false,
              title: Text("Upload surat jalan dan struk tambahan"),
              state: StepState.complete,
              content: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("PO Number / Order Number :", style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                      GestureDetector(
                        onTap: ()=>Navigator.of(context).push(MaterialPageRoute(
                          builder: (context)=>UploadFoto())),
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
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("*Pastikan surat jalan sudah ditandatangani penerima", style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
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
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Tekan tombol dibawah ini jika sudah menambahakan foto pod dan biaya tambahan", style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
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
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ))
        ],
        currentStep: currentStep,
        onStepContinue: next,
        onStepTapped: (step) => goTo(step),
        onStepCancel: cancel,
      ),
    );
  }
}
