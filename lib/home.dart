import 'package:flutter/material.dart';
import 'package:tracking_driver/terimaTugas.dart';
import 'package:tracking_driver/tidakAdaTugas.dart';
import 'package:tracking_driver/tugasAktif.dart';

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
  
  int status = 0;

  cekStatus(){
    if (status == 0) {
      return Scaffold(
        body: TidakAdaTugas(),
      );
    }else if(status == 1){
      return Scaffold(
        body: TerimaTugas(),
      );
    }else{
      return Scaffold(
        body: TugasAktif(),
      );
    }
  }

  change(){
    status = status + 1;
    if(status == 3){
      return status = 0;
    }
    print(status);
  }

  @override
  void initState() {
    super.initState();
    cekStatus();
  }

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
                        "Nama Driver",
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
                onTap: () {},
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
      body:cekStatus(),
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
                      onPressed: () {},
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
          setState(() {
            change();
          });
        },
        child: Icon(Icons.chat_bubble),
      ),
    );
  }
}
