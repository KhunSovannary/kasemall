import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:kasemall/model/response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future logIn(String phoneNumber, String password) async {
  final Map<String, dynamic> data = {
    'phone': phoneNumber,
    'password': password,
    'fcm_token': "test",
    'device_type': "Android",
  };
  var url = Uri.parse('https://kasefarm1.kasegro.com/api/login');
  var jsonData;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var response = await http.post(url, body: data);
  print(jsonDecode(response.body));
  if (response.statusCode == 200) {
    print(response.body);
    jsonData = jsonDecode(response.body);
    //setState(() {});

    sharedPreferences.setString("token", jsonData["data"]["token"]);
    print("login success");
    /*Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context)=>HomePage()),
              (Route<dynamic> route) => false);*/
  } else
    print(response.body);
}
