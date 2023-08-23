// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_.dart';
import 'package:flutter_application_1/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:provider/provider.dart';
// import '';
// import 'package:firebase_core/firebase_core.dart';
// import './firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
        // initialData: null,
        value: AuthService().user,
        initialData: MyUser(uid: 'null'),
        // initialData: u.User(uid:),
        child: const MaterialApp(
          home: Wrapper(),
        ));
  }
}
