import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kasemall/login/login_screen.dart';
import 'package:kasemall/model/user_model.dart';
import 'package:kasemall/otp/otp_api_service.dart';
import 'package:kasemall/register/register_api_service.dart';
//import 'package:sms_autofill/sms_autofill.dart';

class OTP extends StatefulWidget {
  final String phoneNumber, fullName, password, requestId;
  OTP({required this.phoneNumber, required this.fullName, required this.password,required this.requestId});

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  String _code = "";
  RegisterRepository register = new RegisterRepository();
  OtpCodeRepository getOtp = new OtpCodeRepository();

  final scaffoldKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // _listenOtp();
    /*pin1Focus = FocusNode();
    pin2Focus = FocusNode();
    pin3Focus = FocusNode();
    pin4Focus = FocusNode();*/
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //SmsAutoFill().unregisterListener();
    super.dispose();
    /*  pin1Focus.dispose();
    pin2Focus.dispose();
    pin3Focus.dispose();
    pin4Focus.dispose();
    pin1.dispose();
    pin2.dispose();
    pin3.dispose();
    pin4.dispose();
  }*/
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "OTP Verification",
            style: TextStyle(
                color: Colors.green[500],
                fontSize: 29,
                fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 100.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_rounded,
                  color: Colors.green,
                  size: 80,
                ),
                SizedBox(height: 10),
                Text(
                  "Please enter the one time password to verify your account",
                  style: TextStyle(
                    color: Colors.green[400],
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text("A code has been sent to "),
                Text("${hidePhoneNumber(widget.phoneNumber)}"),
                Container(
                    padding: const EdgeInsets.all(10),
                    /*child: PinFieldAutoFill(
                        codeLength: 4,
                        onCodeChanged: (val) {
                          print(val);
                          _code = val;
                        })*/

                    /*Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        pinBox(pin1, pin1Focus, pin2Focus),
                        pinBox(pin2, pin2Focus, pin3Focus),
                        pinBox(pin3, pin3Focus, pin4Focus),
                        pinBox(pin4, pin4Focus, pin4Focus),
                      ],
                    ),
                  ),*/

                    /* TextFieldPinAutoFill(
                    currentCode: _code,
                  ),*/
                    ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        child: Text(
                          "Resend",
                          style: TextStyle(fontSize: 17),
                        ),
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: () {
                          getOtp
                              .getOtpCode(widget.phoneNumber)
                              .then((response) => {
                                    if (!response.status)
                                      {print("failed")}
                                    else
                                      print("resend succeeded.")
                                  });
                        },
                      ),
                      RaisedButton(
                        child: Text(
                          "Confirm",
                          style: TextStyle(fontSize: 17),
                        ),
                        color: Colors.green,
                        textColor: Colors.white,
                        onPressed: () {
                          if (_code != null) {
                            Map<String, dynamic> data = user(
                                widget.fullName,
                                widget.password,
                                widget.phoneNumber,
                                _code,
                                widget.requestId);
                            print(data);
                            register.register(data).then((response) => {
                                  if (!response.status)
                                    {
                                      print(response.status),
                                      print("error"),
                                    }
                                  else
                                    {Get.to(() => Login())}
                                });
                          } else {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

String hidePhoneNumber(String phone) {
  String newNumber = phone;
//function for replacing string wtih *
  String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }

  for (int i = 0; i < phone.length - 4; i++) {
    newNumber = replaceCharAt(newNumber, i, "*");
  }

  return newNumber;
}

/*void _listenOtp() async {
  await SmsAutoFill().listenForCode;
}
*/