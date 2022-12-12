import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../functions/functions.dart';
import 'gallery_screen.dart';

ValueNotifier<List> imageList = ValueNotifier([]);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final imagePick = ImagePicker();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    createList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera App'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pickImage();
        },
        child: const Icon(
          Icons.camera_enhance_outlined,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ValueListenableBuilder(
        valueListenable: imageList,
        builder: ((BuildContext context, List data, Widget? _) {
          return GridView.builder(
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 3, crossAxisSpacing: 3),
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageScreen(img: data[index]),
                    ),
                  );
                },
                child: Hero(
                  tag: index,
                  child: Image(
                    fit: BoxFit.fill,
                    image: FileImage(
                      File(data[index]),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}












// import 'dart:io';
// import 'package:flutter/material.dart';
// import '../functions/functions.dart';
// import 'gallery_screen.dart';

// class camerascreen extends StatelessWidget {
//   const camerascreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Images'),
//         leading: IconButton(
//           onPressed: (() {}),
//           icon: const Icon(Icons.arrow_back),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ValueListenableBuilder(
//           valueListenable: db,
//           builder: (context, List data, text) {
//             return GridView(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 30,
//               ),
//               children: List.generate(
//                 data.length,
//                 (index) {
//                   return GestureDetector(
//                     onTap: (() {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (ctx) => ImageView(
//                             image: data[index],
//                           ),
//                         ),
//                       );
//                     }),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         image: DecorationImage(
//                           image: FileImage(
//                             File(
//                               data[index].toString(),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           cameraButton();
//         },
//         child: const Icon(Icons.add_a_photo),
//       ),
//     );
//   }
// }

