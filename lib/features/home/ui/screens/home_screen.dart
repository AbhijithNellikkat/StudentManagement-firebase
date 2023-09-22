import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_management_app_firebase/features/add_student/ui/screens/add_student_screen.dart';
import 'package:student_management_app_firebase/features/authentication/ui/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _reference = FirebaseFirestore.instance.collection('students');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (route) => false
                    ,
                  );
                },
                icon: const Icon(Icons.login))
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _reference.orderBy('rollNumber').snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("some error occurred ${snapshot.error}"),
                );
              }

              if (snapshot.hasData) {
                QuerySnapshot querySnapshot = snapshot.data;
                List<QueryDocumentSnapshot> documents = querySnapshot.docs;

                List<Map> items =
                    documents.map((e) => e.data() as Map).toList();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        //Get the item at this index
                        Map thisItem = items[index];
                        //REturn the widget for the list items
                        return InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) =>
                            //           StudentDetailsScreen(),
                            //     ));
                          },
                          child: Card(
                            child: ListTile(
                              leading: SizedBox(
                                height: 80,
                                width: 80,
                                child: thisItem.containsKey('image')
                                    ? Image.network('${thisItem['image']}')
                                    : Container(),
                              ),
                              title: Text('${thisItem['name']}'),
                              subtitle: Text('${thisItem['rollNumber']}'),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete_forever,
                                    color: Colors.red,
                                  )),
                            ),
                          ),
                        );
                      }),
                );
              }

              return const Center(child: CircularProgressIndicator());
            }),
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
