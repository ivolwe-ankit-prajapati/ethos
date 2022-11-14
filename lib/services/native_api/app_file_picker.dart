import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AppFilePicker {
  Future<File> getImagefromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    File val=File(pickedFile!.path);
/*    if (pickedFile != null) {
      val = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        // aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxHeight: 700,
        maxWidth: 700,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarColor: Colors.white,
          lockAspectRatio: false,
          toolbarTitle: "Edit Image",
        ),
      );
      return val;
      //return File(pickedFile.path);
    } else {
      print('No image selected.');
    }*/

return val;
  }

  Future<File> getImagefromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    File val=File(pickedFile!.path);
    return val;
 /*   if (pickedFile != null) {
      val = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        // aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxHeight: 700,
        maxWidth: 700,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarColor: Colors.white,
          lockAspectRatio: false,
          toolbarTitle: "Edit Image",
        ),
      );
      return val;
      //return File(pickedFile.path);
    } else {
      print('No image selected.');
    }*/
  }

/*
  Future<File> getImage() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (result != null) {
      File file = File(result.files.single.path);
      return file;
    } else {
      return null;
      // User canceled the picker
    }
  }*/

  Future<File?> getDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      //PlatformFile file = result.files.first;
      return file;
      // print(file.name);
      // print(file.bytes);
      // print(file.size);
      // print(file.extension);
      // print(file.path);
    } else {
      return null;
      // User canceled the picker
    }
  }

  Future<List<File>?> getMultipleFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png'],
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      // File file = File(result.files.single.path);
      //PlatformFile file = result.files.first;
      return files;
      // print(file.name);
      // print(file.bytes);
      // print(file.size);
      // print(file.extension);
      // print(file.path);
    } else {
      return null;
      // User canceled the picker
    }
  }
}
