import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../screens/camera_screen.dart';

createList() async {
  final dir = await getExternalStorageDirectory();
  imageList.value.clear();
  if (dir != null) {
    var listDir = await dir.list().toList();
    for (var i = 0; i < listDir.length; i++) {
      if (listDir[i].path.endsWith('.jpg')) {
        imageList.value.add(listDir[i].path);
        imageList.notifyListeners();
      }
    }
  }
}

String name = '${DateTime.now()}.jpg';
pickImage() async {
  final imagePick = await ImagePicker().pickImage(source: ImageSource.camera);
  if (imagePick == null) {
    return;
  } else {
    Directory? dir = await getExternalStorageDirectory();
    File imagePath = File(imagePick.path);
    final newImage = await imagePath.copy('${dir!.path}/$name');
    imageList.value.add(newImage.path);
    createList();
  }
}
























// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';

//

// void cameraButton() async {
//   final image = await ImagePicker().pickImage(source: ImageSource.camera);
//   if (image == null) {
//     return;
//   } else {
//     Directory? directory = await getExternalStorageDirectory();
//     File imagepath = File(image.path);

//     await imagepath.copy('${directory!.path}/${DateTime.now()}.jpg');

//     getitems(directory);
//   }
// }

// getitems(Directory directory) async {
//   final listDir = await directory.list().toList();
//   db.value.clear();
//   for (var i = 0; i < listDir.length; i++) {
//     if (listDir[i].path.substring(
//             (listDir[i].path.length - 4), (listDir[i].path.length)) ==
//         '.jpg') {
//       db.value.add(listDir[i].path);
//       db.notifyListeners();
//     }
//   }
// }

