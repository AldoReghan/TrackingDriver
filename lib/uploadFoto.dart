import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UploadFoto(),
    );
  }
}

class UploadFoto extends StatefulWidget {
  @override
  _UploadFotoState createState() => _UploadFotoState();
}

class _UploadFotoState extends State<UploadFoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("UPLOAD"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 1.8,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10))),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.description),
                        hintText: 'Deskripsi'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.monetization_on), hintText: 'Jumlah'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "UPLOAD FOTO",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
