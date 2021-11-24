import 'package:get/get.dart';
import 'package:kasemall/api_service/api_data.dart';
import 'package:kasemall/features/seller/models/seller_model.dart';

class SellerController extends GetxController {
  final Rx<SellerModel> _seller = Rx<SellerModel>(SellerModel());

  var districts = <District>[].obs;

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    super.onInit();
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

  SellerModel get seller => _seller.value;

  void setSeller(SellerModel seller) {
    _seller.value = seller;
  }
}
