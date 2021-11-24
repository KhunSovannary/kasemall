// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:kasemall/api_service/api_data.dart';
import 'package:kasemall/features/city_province/repository/city_repository.dart';

class CityProvinceController extends GetxController {
  var _provinces = <Province>[].obs;

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    super.onInit();
    getProvince();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    super.onReady();
  }

  @override
  void onClose() {
    // called just before the Controller is deleted from memory
    super.onClose();
  }

  List<Province> get provinces => _provinces.value;

  void getProvince() async {
    final allProvinces = await CityRepository.getProvince();
    _provinces.value = allProvinces;
  }
}
