import 'package:flutter/material.dart';
import 'package:tracking_driver/home.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone),
                      hintText: 'Masukkan nomor telpon'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:30.0, right: 30),
                  child: TextFormField(
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
                       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                        builder: (context) => Home()), (route) => false);
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
        )
    );
  }
}