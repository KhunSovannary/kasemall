import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kasemall/login/login_screen.dart';
import 'package:kasemall/shopping/shopping_screen.dart';

class Profile extends StatefulWidget {
  Profile({key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _gender = new TextEditingController();
  TextEditingController _birthdate = new TextEditingController();
  TextEditingController _address = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("lib/assets/logo1.jpg")),
              SizedBox(height: 20),
              Text("${widget.title}"),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                ),
                controller: _email,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Gender",
                ),
                controller: _gender,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Birth Date",
                ),
                controller: _birthdate,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Address",
                ),
                controller: _address,
              ),
            ]),
      )),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Done");
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
          Get.to(()=>Shop());
        },
        child: const Icon(Icons.check),
        backgroundColor: Colors.green,
      ),
    );
  }
}
