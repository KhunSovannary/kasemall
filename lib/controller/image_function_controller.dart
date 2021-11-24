import 'dart:io' as file;
//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ImageController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  void getPic(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    selectedImagePath.value = pickedFile!.path;

    try {
      print(pickedFile.path);
      selectedImageSize.value =
          ((file.File(selectedImagePath.value,)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              "Mb";
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
