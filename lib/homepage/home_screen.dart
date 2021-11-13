import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kasemall/login/login_screen.dart';
import 'package:kasemall/shopping/shopping_screen.dart';

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key? key, required this.title}) : super(key: key);

  String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("lib/assets/logo1.jpg")),
              SizedBox(height:20),
              Text("Welcome To KaseMall"),
            ]),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         // Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
         Get.to(()=>Login());
        },
        child: const Icon(Icons.arrow_forward),
        backgroundColor: Colors.green,
      ),
    );
  }
}
