// // ignore_for_file: unused_field

// import 'dart:developer';
// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// // ignore: must_be_immutable
// class EditStudentScreen extends StatelessWidget {
//   EditStudentScreen(this.student, {super.key}) {
//     _controllerName = TextEditingController(text: student['name']);
//     _controllerAge = TextEditingController(text: student['age']);
//     _controllerRollNumber = TextEditingController(text: student['rollNumber']);


//        _reference = FirebaseFirestore.instance
//         .collection('students')
//         .doc(student['id']);
//   }
//   late TextEditingController _controllerName;
//   late TextEditingController _controllerAge;
//   late TextEditingController _controllerRollNumber;

//   late DocumentReference _reference;

//   Map student;
//   GlobalKey<FormState> formkey = GlobalKey();

//   final CollectionReference _collectionReference =
//       FirebaseFirestore.instance.collection('students');

//   String imageUrl = '';

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(),
//         body: Padding(
//           padding: const EdgeInsets.all(28.0),
//           child: Form(
//               key: formkey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: _controllerName,
//                     decoration:
//                         const InputDecoration(hintText: 'Enter the name '),
//                     validator: (String? value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the name';
//                       }

//                       return null;
//                     },
//                   ),
//                   TextFormField(
//                     controller: _controllerAge,
//                     decoration:
//                         const InputDecoration(hintText: 'Enter the age'),
//                     validator: (String? value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the age';
//                       }

//                       return null;
//                     },
//                   ),
//                   TextFormField(
//                     controller: _controllerRollNumber,
//                     decoration:
//                         const InputDecoration(hintText: 'Enter the rollNumber'),
//                     validator: (String? value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the rollNumber';
//                       }

//                       return null;
//                     },
//                   ),
//                   OutlinedButton(
//                     onPressed: () async {
//                       ImagePicker imagePicker = ImagePicker();
//                       XFile? file = await imagePicker.pickImage(
//                           source: ImageSource.gallery);
//                       log('${file?.path}');

//                       if (file == null) return;

//                       String uniqueFileName =
//                           DateTime.now().microsecondsSinceEpoch.toString();

//                       Reference referenceRoot = FirebaseStorage.instance.ref();
//                       Reference referenceDirImages =
//                           referenceRoot.child('images');

//                       Reference referenceImageToUpload =
//                           referenceDirImages.child(uniqueFileName);

//                       try {
//                         await referenceImageToUpload.putFile(File(file.path));

//                         imageUrl =
//                             await referenceImageToUpload.getDownloadURL();
//                       } catch (e) {
//                         // some error occurred
//                       }
//                     },
//                     child: const Icon(Icons.photo),
//                   ),
//                   OutlinedButton(
//                     onPressed: () async {
//                       if (imageUrl.isEmpty) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                                 content: Text('Please upload an image')));

//                         return;
//                       }
//                       if (formkey.currentState!.validate()) {
//                         String studentName = _controllerName.text;
//                         String studentAge = _controllerAge.text;
//                         String studentRollNumber = _controllerRollNumber.text;
//                         Map<String, String> dataTosend = {
//                           'rollNumber': studentRollNumber,
//                           'name': studentName,
//                           'age': studentAge,
//                           'image': imageUrl,
//                         };

//                         // Add a student
//                         _collectionReference.add(dataTosend);
//                         Navigator.pop(context);
//                       }
//                     },
//                     child: const Text('Save'),
//                   )
//                 ],
//               )),
//         ),
//       ),
//     );
//   }
// }
