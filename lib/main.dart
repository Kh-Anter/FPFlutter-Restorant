import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restorant/binding/controller_binding.dart';
import 'package:restorant/firebase_options.dart';
import 'package:restorant/routes.dart';
import 'package:restorant/screens/authentication.dart';
import 'package:restorant/screens/cart.dart';
import 'package:restorant/screens/checkout_delivery.dart';
import 'package:restorant/screens/home.dart';
import 'package:restorant/screens/onboarding_Screen.dart';
import 'package:restorant/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodie',
      theme: theme(),
      // home: HomeScreen(),
      home: FutureBuilder(
          future: isFirstUse(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return loading();
            } else if (snapshot.data) {
              return OnboardingScreen();
            } else if (!snapshot.data) {
              return Authentication();
            } else {
              return null;
            }
          }),
      getPages: routes,
      initialBinding: controlbinding(),
    );
  }

  Future<bool> isFirstUse() async {
    final prefs = await SharedPreferences.getInstance();
    var result = prefs.getBool("firstUse");
    if (result != null) {
      return false;
    } else {
      return true;
    }
  }

  Widget loading() {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
