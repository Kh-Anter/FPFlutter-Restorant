import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restorant/firebase_options.dart';
import 'package:restorant/screens/home.dart';
import 'package:restorant/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodie',
      theme: theme(),
      home: Home(),
    );
  }
}
