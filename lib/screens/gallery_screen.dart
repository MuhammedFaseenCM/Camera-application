// import 'dart:io';

// import 'package:flutter/material.dart';

// import '../functions/functions.dart';
// import 'camera_screen.dart';

// class ImageView extends StatelessWidget {
//   const ImageView({Key? key, this.image}) : super(key: key);
//   final dynamic image;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Images'),
//         centerTitle: true,
//       ),
//       body: ValueListenableBuilder(
//         valueListenable: db,
//         builder: (context, List data, _) {
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Center(
//               child: Image.file(
//                 File(
//                   image.toString(),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:camera_app/functions/functions.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String img;
  const ImageScreen({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final File image = File(img);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(name),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                  onPressed: () {
                    snackBar(context);
                  },
                  icon: const Icon(Icons.info_outline))),
        ],
      ),
      body: Center(
        child: Image.file(
          image,
        ),
      ),
    );
  }

  Future<void> snackBar(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 20.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text('Path : $img'),
        ],
      ),
      backgroundColor: Colors.blue,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
    ));
  }
}
