// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttergram/services/data.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:async';
// import 'dart:io';

// import 'package:random_string/random_string.dart';

// class CreateBlog extends StatefulWidget {
//   const CreateBlog({Key? key}) : super(key: key);

//   @override
//   _CreateBlogState createState() => _CreateBlogState();
// }

// class _CreateBlogState extends State<CreateBlog> {
//   late String authorName, title, desc;
//   bool _isLoading = false;

//   File? image;
//   // crudMethods CrudMethods = new crudMethods();
//   Future pickImage() async {
//     var image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (image == null) return;
//     final _image = File(image.path);
//     setState(() {
//       this.image = _image;
//     });
//   }

//   Future uploadBlog() async {
//     setState(() {
//       _isLoading = true;
//     });
//     if (image != null) {
//       Reference ref = FirebaseStorage.instance
//           .ref()
//           .child("Blog images")
//           .child("${randomAlphaNumeric(9)}.jpeg");
//       final UploadTask task = ref.putFile(image!);
//       var downloadUrl;
//       await task.whenComplete(() async {
//         try {
//           downloadUrl = await ref.getDownloadURL();
//         } catch (onError) {
//           print("Error");
//         }
//       });
//       print("URL Generated");
//       print("This is url $downloadUrl");

//       Map<String, String> blogMap = {
//         "imageUrl": downloadUrl,
//         "author": authorName,
//         "title": title,
//         "description": desc
//       };
//       FirebaseFirestore.instance.collection('blogs').addData(blogMap).then((value) {
//         Navigator.pop(context);
//       });

//       _isLoading = false;
//     } else {
//       print("Couldnt find the error");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: () {
//               uploadBlog();
//             },
//             icon: Icon(Icons.file_upload_rounded),
//             color: Colors.cyanAccent,
//           )
//         ],
//         automaticallyImplyLeading: false,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Flutter"),
//             Text(
//               "gram",
//               style: TextStyle(color: Colors.purple.shade500),
//             )
//           ],
//         ),
//       ),
//       body: _isLoading
//           ? Container(
//               alignment: Alignment.center,
//               child: CircularProgressIndicator(),
//             )
//           : ListView(
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(20),
//                   child: Column(
//                     children: [
//                       GestureDetector(
//                         onTap: pickImage,
//                         child: image != null
//                             ? Container(
//                                 height: size.height * .30,
//                                 width: size.width,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(10),
//                                   child: Image.file(
//                                     image!,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               )
//                             : Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(20)),
//                                 height: size.height * .30,
//                                 width: size.width,
//                                 child: Icon(
//                                   Icons.add_a_photo_rounded,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                       ),
//                       SizedBox(
//                         child: Container(
//                           child: Column(
//                             children: [
//                               TextField(
//                                 decoration: InputDecoration(
//                                     hintText: "Author Name",
//                                     prefixIcon: Icon(
//                                       Icons.person,
//                                       color: Colors.purple,
//                                     )),
//                                 onChanged: (val) {
//                                   authorName = val;
//                                 },
//                               ),
//                               TextField(
//                                 decoration: InputDecoration(
//                                     hintText: "Title",
//                                     prefixIcon: Icon(
//                                       Icons.title,
//                                       color: Colors.purple,
//                                     )),
//                                 onChanged: (val) {
//                                   title = val;
//                                 },
//                               ),
//                               TextField(
//                                 decoration: InputDecoration(
//                                     hintText: "Description",
//                                     prefixIcon: Icon(
//                                       Icons.pages,
//                                       color: Colors.purple,
//                                     )),
//                                 onChanged: (val) {
//                                   desc = val;
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  const Upload({ Key? key }) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}