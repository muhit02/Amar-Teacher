import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/intro_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: body_might_complete_normally_catch_error
  await Firebase.initializeApp().catchError((error) {
    // ignore: avoid_print
    print("Firebase initialization error: $error");
    // Handle Firebase initialization errors here
  });
  runApp(const AmarTeacher());
}




class AmarTeacher extends StatelessWidget {
  const AmarTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
