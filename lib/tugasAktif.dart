import 'package:flutter/material.dart';

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

  List<Step> mySteps = [
    Step(
        isActive: true,
        title: Text("Ambil Muatan"),
        content: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue)),
          height: 480,
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
                      "Klik untuk lihat code leading",
                      style: TextStyle(color: Colors.blue),
                    )),
                Container(
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
              ],
            ),
          ),
        )),
    Step(
        isActive: false,
        title: Text("Muat barang ke kendaraan"),
        content: SingleChildScrollView(
          child: Container(
            height: 300,
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
                  Container(
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
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
    Step(
        isActive: false,
        title: Text("Bawa muatan ke tujuan"),
        content: Container(
          child: Text("lanjutkan"),
        )),
    Step(
        isActive: false,
        title: Text("Turunkan muatan dari kendaraan"),
        content: Container(
          child: Text("lanjutkan"),
        )),
    Step(
        isActive: false,
        title: Text("Upload surat jalan dan struk tambahan"),
        content: Container(
          child: Text("selesai"),
        ))
  ];

  goTo(int step) {
    setState(() {
      currentStep = step;
    });
  }

  next() {
    currentStep + 1 != mySteps.length
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
      appBar: AppBar(
        title: Text("Pekerjaan Anda"),
        centerTitle: true,
      ),
      body: Stepper(
        steps: mySteps,
        currentStep: currentStep,
        onStepContinue: next,
        onStepTapped: (step) => goTo(step),
        onStepCancel: cancel,
      ),
    );
  }
}