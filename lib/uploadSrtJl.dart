import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:async/async.dart';
import 'package:path/path.dart' as path;

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

  uploadImage()async{
    try {

      var streamPO = http.ByteStream(DelegatingStream.typed(_imageFilePO.openRead()));
      var streamSrt = http.ByteStream(DelegatingStream.typed(_imageFilePO.openRead()));
      
      var lengthPO = await _imageFilePO.length();
      var lengthSrt = await _imageFileSrt.length();
      
      var uri = Uri.parse("http://app.rasc.id/log/api/driver/uploadimage");
      var request = http.MultipartRequest("POST", uri);

      request.files.add(http.MultipartFile("PO_PHOTO", streamPO, lengthPO, filename: path.basename(_imageFilePO.path)));
      request.files.add(http.MultipartFile("SuratJalan_Photo", streamSrt, lengthSrt, filename: path.basename(_imageFileSrt.path)));

      var response = await request.send();

      if (response.statusCode == 200) {
        print("Buku berhasil diinputkan");
        setState(() {
          Navigator.of(context).pop();
        });
      }else{
        print("gagal input foto");
      }

    } catch (e) {
      print(e);
    }
  }

  pilihKameraPO() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera, maxHeight: 1920.0,
      maxWidth: 1080.0);
    setState(() {
      _imageFilePO = image;
    });
  }

  pilihGalleryPO() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery, maxHeight: 1920.0,
      maxWidth: 1080.0);
    setState(() {
      _imageFilePO = image;
    });
  }

  pilihKameraSrt() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera, maxHeight: 1920.0,
      maxWidth: 1080.0);
    setState(() {
      _imageFileSrt = image;
    });
  }

  pilihGallerySrt() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery, maxHeight: 1920.0,
      maxWidth: 1080.0);
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
                  onTap: () => dialogPilihSrt(),
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
                      onTap: () => uploadImage(),
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
