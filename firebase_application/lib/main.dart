import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FirebaseStudnetApp());
}

class FirebaseStudnetApp extends StatelessWidget {
  const FirebaseStudnetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const StudentList(title: 'Students Firebase Application'),
    );
  }
}

class StudentList extends StatefulWidget {
  const StudentList({super.key, required this.title});

  final String title;

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Future<void> getStudentData()async{
  //   final QuerySnapshot result = await firebaseFirestore.collection('
  //   questions').get();
  //   print(result.size);
  //   for (QueryDocumentSnapshot element in result.docs){
  //     print(element.data());
  //     print(element.get('name'));
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text('Student Name'),
          );
        },
      ),
    );
  }
}
