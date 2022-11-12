import 'package:flutter/material.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/size_config.dart';
import 'package:restorant/widgets/Auth/login.dart';
import 'package:restorant/widgets/Auth/signup.dart';

class Authentication extends StatefulWidget {
  static const routeName = "/Authentication";
  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    var _size = SizeConfig(context);

    var tapbar_height = _size.getProportionateScreenHeight(382);
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: myBackgroundColor,
        appBar: AppBar(
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40))),
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/auth/cap.png",
              ),
            )),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(tapbar_height - 34),
                child: Builder(builder: (context) {
                  return Container(
                      width: _size.getWidth - 80,
                      child: const TabBar(tabs: [
                        Padding(
                            padding: EdgeInsets.all(7),
                            child: Text("Login",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20))),
                        Padding(
                            padding: EdgeInsets.all(7),
                            child: Text("Sign-up",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20))),
                      ]));
                }))),
        body: Container(
          margin: const EdgeInsets.only(top: 20),
          height: _size.getHeight,
          width: _size.getWidth,
          alignment: Alignment.center,
          child: TabBarView(children: [
            Login(
                width: _size.getWidth, height: _size.getHeight - tapbar_height),
            Signup(
                width: _size.getWidth, height: _size.getHeight - tapbar_height)
          ]),
        ),
      ),
    );
  }
}
