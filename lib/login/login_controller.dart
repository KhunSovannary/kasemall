import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kasemall/homepage/home_screen.dart';
import 'package:kasemall/shopping/shopping_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var loginProcess = false.obs;
  var error = '';
  Future logIn(String phoneNumber, String password) async {
    try {
      loginProcess(true);
      final Map<String, dynamic> data = {
        'phone': phoneNumber,
        'password': password,
        'fcm_token': "test",
        'device_type': "Android",
      };
      var url = Uri.parse('https://kasefarm1.kasegro.com/api/login');
      Map<String, dynamic>? jsonData;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('phone', phoneNumber);
      var response = await http.post(url, body: data);
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        print(response.body);
        jsonData = jsonDecode(response.body);
        //setState(() {});

        sharedPreferences.setString("token", jsonData!["data"]["token"]);
        print(jsonData['data']['token']);

        Get.to(() => Shop());
      } else
        print(response.body);
      // Profile( title: "Welcome to our App"));
      /*Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context)=>HomePage()),
              (Route<dynamic> route) => false);*/
    } catch (e) {
      print(e);
    }
  }
}
