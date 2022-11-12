import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/screens/authentication.dart';
import 'package:restorant/screens/home.dart';
import 'package:restorant/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = "/Authentication";

  @override
  Widget build(BuildContext context) {
    var _size = new SizeConfig(context);
    return Scaffold(
      body: Container(
          width: _size.getWidth,
          height: _size.getHeight,
          color: OnboardingBgColor,
          child: Column(
            children: [
              SizedBox(height: _size.getProportionateScreenHeight(56)),
              Row(children: [
                SizedBox(width: _size.getProportionateScreenWidth(49)),
                Container(
                  alignment: Alignment.center,
                  width: 73,
                  height: 73,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(70)),
                  child: Image.asset("assets/images/onboarding/cap.png"),
                ),
              ]),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Foode. Resturant",
                  style: TextStyle(
                      fontSize: 54,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Spacer(),
              Row(children: [
                Stack(
                  children: [
                    Stack(children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: _size.getWidth,
                        child: Image.asset(
                          "assets/images/onboarding/boy-ToyFaces.png",
                        ),
                      ),
                      Positioned(
                        right: 100,
                        child: Image.asset(
                          "assets/images/onboarding/girl-ToyFaces.png",
                          width: _size.getProportionateScreenWidth(358),
                          height: _size.getProportionateScreenHeight(435),
                        ),
                      ),
                    ]),
                    Positioned(
                      top: 270,
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Color.fromRGBO(255, 75, 58, 0.1),
                              Color.fromRGBO(255, 75, 58, 1)
                            ])),
                        width: _size.getWidth,
                        height: 100,
                      ),
                    )
                  ],
                ),
              ]),
              const Spacer(
                flex: 2,
              ),
              Container(
                width: _size.getProportionateScreenWidth(314),
                height: _size.getProportionateScreenHeight(70),
                margin: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)))),
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool("firstUse", false);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Authentication()));
                    },
                    child: const Text(
                      "Get started",
                      style: TextStyle(color: elevatedBtnText, fontSize: 20),
                    )),
              )
            ],
          )),
    );
  }
}
