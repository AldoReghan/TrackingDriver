import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UploadSrtJl(),
    );
  }
}

class UploadSrtJl extends StatefulWidget {
  @override
  _UploadSrtJlState createState() => _UploadSrtJlState();
}

class _UploadSrtJlState extends State<UploadSrtJl> {
  File _imageFilePO, _imageFileSrt;

  pilihKameraPO() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageFilePO = image;
    });
  }

  pilihGalleryPO() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFilePO = image;
    });
  }

  pilihKameraSrt() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageFileSrt = image;
    });
  }

  pilihGallerySrt() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFileSrt = image;
    });
  }

  dialogPilihPO() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: ListView(
              padding: EdgeInsets.all(20),
              shrinkWrap: true,
              children: <Widget>[
                Center(
                  child: Text(
                    "Silahkan Pilih gambar",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        pilihGalleryPO();
                      },
                      child: Text("Pilih Gallery"),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onTap: () {
                        pilihKameraPO();
                      },
                      child: Text("Pilih Kamera"),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  dialogPilihSrt() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: ListView(
              padding: EdgeInsets.all(20),
              shrinkWrap: true,
              children: <Widget>[
                Center(
                  child: Text(
                    "Silahkan Pilih gambar",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        pilihGallerySrt();
                      },
                      child: Text("Pilih Gallery"),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onTap: () {
                        pilihKameraSrt();
                      },
                      child: Text("Pilih Kamera"),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  uploadFoto()async{
    try{
      // var stream = http.ByteStream(Deleg)
    } catch(e){

    }
  }

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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Upload PO Number / Order number"),
                ),
                InkWell(
                  onTap: () => dialogPilihPO(),
                  child: _imageFilePO == null
                      ? Container(
                          height: MediaQuery.of(context).size.height / 1.8,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)))
                      : Image.file(
                          _imageFilePO,
                          fit: BoxFit.fill,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Upload surat jalan"),
                ),
                InkWell(
                  child: _imageFileSrt == null
                      ? Container(
                          height: MediaQuery.of(context).size.height / 1.8,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)))
                      : Image.file(
                          _imageFileSrt,
                          fit: BoxFit.fill,
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
