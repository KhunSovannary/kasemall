import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kasemall/login/login_api_service.dart';
import 'package:kasemall/otp/otp_api_service.dart';
import 'package:kasemall/otp/otp_screen.dart';
import 'package:sms_autofill/sms_autofill.dart';


class Register extends StatefulWidget {
  //const Register(key) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  OtpCodeRepository getOtp = new OtpCodeRepository();
  TextEditingController _phone = new TextEditingController();
  TextEditingController _fullname = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _confirmpassword = new TextEditingController();
  
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
                controller: _fullname,
                decoration: InputDecoration(
                  hintText: "Full Name",
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.person,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                obscureText: true,
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
              TextFormField(
                controller: _confirmpassword,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
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
                  onPressed: () async {
                   if (_confirmpassword.text == _password.text) {
                            /*Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OTP()));*/
                            final signCode =
                                await SmsAutoFill().getAppSignature;
                            print(signCode);
                            
                            getOtp.getOtpCode(_phone.text)
                                .then((response) => {
                                      if (!response.status)
                                        {
                                          _showMyDialog(context,
                                               response.msg),
                                          /*else 
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OTP()))
                    }}*/

                                          // print(response.data),
                                          //print(response.status),
                                        }
                                      else
                                        {
                                          print(response.data),
                                          Get.to(() => OTP(
                                                        phoneNumber:
                                                            _phone.text,
                                                        fullName:
                                                            _fullname.text,
                                                        password:
                                                            _password.text,
                                                        requestId:
                                                            response.data,
                                                      )),
                                        }
                                    });
                          } else
                            print("not match");
                        },
                  
                  child: Text("Sign Up")),
            
              //],)
              
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
Future<void> _showMyDialog(BuildContext context, String message) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Login Failed !'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
