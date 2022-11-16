import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/getx/auth.dart';
import 'package:restorant/screens/authentication.dart';
import 'package:restorant/screens/home/home.dart';
import 'package:restorant/size_config.dart';

class NotAuthentication extends StatelessWidget {
  const NotAuthentication({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = SizeConfig(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_add_disabled, size: 142),
          Text(
            "No Registration",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("Your and not register, go to login",
              style: TextStyle(fontSize: 16, color: mySecondTextColor)),
          Container(
              margin: const EdgeInsets.only(bottom: 20, top: 20),
              width: _size.getWidth - 70,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
                  onPressed: () => Get.toNamed(Authentication
                      .routeName), // offAndToNamed(HomeScreen.routeName),
                  child: Text("Registeration", style: TextStyle(fontSize: 18))))
        ],
      ),
    );
  }
}
