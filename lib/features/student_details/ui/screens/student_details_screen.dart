// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:student_management_app_firebase/features/edit_student/ui/screen/edit_student_screen.dart';

// // ignore: must_be_immutable
// class StudentDetailsScreen extends StatelessWidget {
//   // ignore: non_constant_identifier_names
//   String? StudentId;
//   late DocumentReference _reference;

//     late Map data;

//   // ignore: unused_field
//   late Future<DocumentSnapshot> _futureData;
//   // ignore: non_constant_identifier_names
//   StudentDetailsScreen({super.key, this.StudentId}) {
//     _reference =
//         FirebaseFirestore.instance.collection('students').doc(StudentId);
//     _futureData = _reference.get();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       appBar: AppBar(
//         title: const Text("Student Details"),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () {

//                data['id'] = StudentId;
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => EditStudentScreen(data),
//                   ));
//             },
//             icon: const Icon(Icons.edit),
//           ),
//         ],
//       ),
//     ));
//   }
// }
