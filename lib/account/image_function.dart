import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ImageController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    // it is better to use try catch to prevent error or app crash
    try {} catch (e) {}

    // final pickedFile = await ImagePicker().getImage(source: imageSource);
    // selectedImagePath.value = pickedFile.path;
    // print(pickedFile.path);
    // print(selectedImagePath.value);
    // if (pickedFile != null) {
    //   selectedImagePath.value = pickedFile.path;
    //   print(selectedImagePath.value);

    //   selectedImageSize.value =
    //       ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
    //               .toStringAsFixed(2) +
    //           "Mb";
    // } else {
    //   Get.snackbar('Error', 'No image selected',
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.red,
    //       colorText: Colors.white);
    // }
  }
}
