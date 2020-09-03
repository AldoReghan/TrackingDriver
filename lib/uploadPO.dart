import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

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
  Future<File> filePO, fileSrtJl;
  String status = '';
  String base64ImagePO, base64ImageSrtJl;
  File tmpFilePO, tmpFileSrtJl;
  String errMessage = 'Error Uploading Image';

  chooseImagePOCamera(){
    setState(() {
      filePO = ImagePicker.pickImage(source: ImageSource.camera);
    });
  }

  chooseImageSrtJlCamera(){
    setState(() {
      fileSrtJl = ImagePicker.pickImage(source: ImageSource.camera);
    });
  }

  Widget showImagePO(){
    return FutureBuilder<File>(
      future: filePO,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot){
        if (snapshot.connectionState == ConnectionState.done && null != snapshot.data) {
          tmpFilePO= snapshot.data;
          base64ImagePO = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(snapshot.data, fit: BoxFit.fill,)
          );
        }else if(null != snapshot.error){
          return const Text("error picking image", textAlign: TextAlign.center,);
        }else{
          return const Text("No image selected", textAlign: TextAlign.center,);
        }
      },
    );
  }

  Widget showImageSrtJl(){
    return FutureBuilder<File>(
      future: fileSrtJl,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot){
        if (snapshot.connectionState == ConnectionState.done && null != snapshot.data) {
          tmpFileSrtJl= snapshot.data;
          base64ImageSrtJl = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(snapshot.data, fit: BoxFit.fill,)
          );
        }else if(null != snapshot.error){
          return const Text("error picking image", textAlign: TextAlign.center,);
        }else{
          return const Text("No image selected", textAlign: TextAlign.center,);
        }
      },
    );
  }

  startUpload(){
    setState(() {
      print("uploading image...");
    });
    if (null == tmpFilePO && null == tmpFileSrtJl) {
      setState(() {
        print("error message");
      });
      return;
    }
    String fileNamePO = tmpFilePO.path.split('/').last;
    String fileNameSrtJl = tmpFileSrtJl.path.split('/').last;
    upload(fileNamePO, fileNameSrtJl);
  }

  upload(String fileNamePO, String fileNameSrtJl) {
    http.post("http://app.rasc.id/log/api/driver/uploadimage", body: {
      "PO_PHOTO" : base64ImagePO,
      "SuratJalan_Photo" : base64ImageSrtJl
    }).then((result){
      setState(() {
        result.statusCode == 200 ? result.body : errMessage;
      });
    }).catchError((error){
      setState(() {
        print(error);
      });
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
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                children: [
                  Text("import PO number atau Order number"),
                  SizedBox(height: 20,),
                  showImagePO(),
                  SizedBox(height: 20,),
                  Text("upload surat jalan"),
                  showImageSrtJl(),
                  GestureDetector(
                    onTap: chooseImagePOCamera(),
                    child: Container(
                      child: Text("upload image PO"),
                    ),
                  ),
                  GestureDetector(
                    onTap: chooseImageSrtJlCamera(),
                    child: Container(
                      child: Text("upload image surat jalan"),
                    ),
                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: startUpload(),
                    child: Container(
                      child: Text("upload"),
                    ),
                  )
                ],
              ),
            ),
          )
        ));
  }
}
