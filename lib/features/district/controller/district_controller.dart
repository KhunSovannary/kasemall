// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:kasemall/api_service/api_data.dart';
import 'package:kasemall/features/district/repository/district_repository.dart';

class DistrictController extends GetxController {
  var _districts = <District>[].obs;

  List<District> get district => _districts.value;

  void getDistrict({required String districtId}) async {
    final allDistricts = await DistrictRepository.getDistricts(districtId);
    _districts.value = allDistricts;
  }
}
