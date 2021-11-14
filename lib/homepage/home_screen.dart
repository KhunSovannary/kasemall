import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kasemall/login/login_screen.dart';
import 'package:kasemall/shopping/shopping_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key? key, required this.title}) : super(key: key);

  String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? finalPhone;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateUser().whenComplete(() async {
      Timer(Duration(seconds: 2),
          () => Get.to(()=>finalPhone == null ? Login() : Shop()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("lib/assets/logo1.jpg")),
              SizedBox(height: 20),
              Text("Welcome To KaseMall"),
            ]),
      ),
      backgroundColor: Colors.white,
      /*floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
          navigateUser();
        },
        child: const Icon(Icons.arrow_forward),
        backgroundColor: Colors.green,
      ),*/
    );
  }

  void startTimer() {
    Timer(Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  Future navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var obtainedPhone = prefs.getString('phone');
    setState(() {
      finalPhone = obtainedPhone;
    });
    print(finalPhone);
  }
  /*var status = prefs.getBool('isLoggedIn') ?? false;
    print(status);
    if (status) {
      Get.to(() => Shop());
    } else {
      Get.to(() => Login());
    }
  }*/
}
