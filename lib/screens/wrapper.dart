import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_.dart';
import 'package:flutter_application_1/screens/authenticate/authenticate.dart';
import 'package:flutter_application_1/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  //return either home or authenticate widget
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      return Home();
    }
  }
}
