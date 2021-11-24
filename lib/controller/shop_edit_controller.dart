import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kasemall/controller/updateshop_controller.dart';
import 'package:kasemall/model/seller_model.dart';

class ShopEditController extends GetxController {
  TextEditingController shopnametxt = new TextEditingController();
  TextEditingController membershiptxt = new TextEditingController();
  TextEditingController supplier_idtxt = new TextEditingController();
  TextEditingController city_provincetxt = new TextEditingController();
  TextEditingController addresstxt = new TextEditingController();
  TextEditingController districttxt = new TextEditingController();

  var shopname = ''.obs;
  var membership_id= ''.obs;
  var supplier_id = ''.obs;
  var city_province_id = ''.obs;
  var district = ''.obs;
  var address = ''.obs;
  var logo_image = ''.obs;
  var cover_image = ''.obs;
   @override
  void onInit() {
    shopnametxt.addListener(() {
      shopname.value = shopnametxt.text;
    });
    membershiptxt.addListener(() {
      membership_id.value = membershiptxt.text;
    });
    supplier_idtxt.addListener(() {
      supplier_id.value = supplier_idtxt.text;
    });
    city_provincetxt.addListener(() {
      city_province_id.value = city_provincetxt.text;
    });
   /* districttxt.addListener(() {
      shopname.value = shopnametxt.text;
    });
    membershiptxt.addListener(() {
      shopname.value = shopnametxt.text;
    });
    membershiptxt.addListener(() {
      shopname.value = shopnametxt.text;
    });
   */
    super.onInit();
  }
  
}
