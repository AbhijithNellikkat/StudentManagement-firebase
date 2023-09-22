import 'package:flutter/material.dart';
import 'package:student_management_app_firebase/features/add_student/ui/screens/add_student_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Center(
          child: Text('Home Page'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddStudentScreen()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
