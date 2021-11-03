import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kasemall/login/login_api_service.dart';
import 'package:kasemall/register/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
 // const Login(key) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _phone = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.green,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("lib/assets/logo1.jpg")),
              SizedBox(height: 30),
              TextFormField(
                controller: _phone,
                decoration: InputDecoration(
                  hintText: "Phone number",
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.phone_android_outlined,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _password,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(height: 20),
              /*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [*/
              FlatButton(
                  color: Colors.green,
                  onPressed: () {
                    logIn(_phone.text, _password.text);
                  },
                  child: Text("Log In")),
              SizedBox(height: 10),
              Text("OR"),
              SizedBox(height: 10),
              FlatButton(
                  color: Colors.blue[500],
                  onPressed: () {},
                  child: Text("LOG IN with FACEBOOK")),
              //],)
              InkWell(
                onTap: () {},
                child: Text("Frogot Password ?"),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  InkWell(
                    onTap: () {
                      Get.to(() => Register());
                    },
                    child: Text(
                      " Sign Up",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
