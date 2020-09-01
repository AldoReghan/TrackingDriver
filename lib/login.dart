import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tracking_driver/home.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tracking_driver/main.dart';
import 'package:tracking_driver/model/driverModel.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoginPage',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController nomertelpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final list = List<DriverModel>();

  final GlobalKey<FormBuilderState> _key = GlobalKey<FormBuilderState>();

  login(String nomertelp, String password)async{

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final response = await http.post("http://app.rasc.id/log/api/auth/login", body: {
      "Phone" : nomertelp,
      "Password" : password
    });

    final data = jsonDecode(response.body);

    final id = data['Id'];
    final name = data['Name'];
    final email = data['Email'];

    if (response.statusCode == 200) {

      sharedPreferences.setInt('Id', id);
      sharedPreferences.setString('Name', name);
      sharedPreferences.setString('Email', email);
      
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        builder: (context)=>MainHome()), (route) => false);
      print(data);
    }else{
      print("error");
    }
  }

  submit(){
    if (nomertelpController == "" || passwordController == "") {
      print("username atau password kosong");
    }else{
      login(nomertelpController.text, passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        key: _key,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100)
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Center(
                        child: Text("RAFTEL", style: TextStyle(
                           fontSize: 70,
                           fontWeight: FontWeight.bold,
                           color: Colors.white
                        ),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: TextFormField(
                      controller: nomertelpController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'Masukkan nomor telpon'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:30.0, right: 30),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: 'Masukkan Password'
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                      child: GestureDetector(
                        onTap: () {
                          submit();
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
      )
    );
  }
}