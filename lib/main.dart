import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttergram/Screens/Create.dart';
import 'package:fluttergram/Screens/wrapper/Login.dart';
import 'package:fluttergram/Screens/wrapper/blog.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    home: Login(),
  ));
}
