import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kasemall/login/login_screen.dart';

class Profile extends StatefulWidget {
  Profile({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
              Text("${widget.title}"),
            ]),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         // Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
         //Get.to(()=>Login());
        },
        child: const Icon(Icons.arrow_forward),
        backgroundColor: Colors.green,
      ),
    );
  }
}
