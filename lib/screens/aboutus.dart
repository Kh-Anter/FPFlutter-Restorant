import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/screens/home/home.dart';
import 'package:restorant/size_config.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({Key key}) : super(key: key);
  static const routeName = "/Aboutus";

  @override
  Widget build(BuildContext context) {
    var _size = SizeConfig(context);
    return Scaffold(
      appBar: myApp(),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 38.0, right: 18, top: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: _size.getWidth / 1.4,
              child: Image.asset("assets/images/aboutus/aboutus.png"),
            ),
            RichText(
                text: const TextSpan(
                    text: "Caferio, Burgers, and \nBest Pizzas ",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "SF-Pro-Rounded"),
                    children: [
                  TextSpan(
                      text: "in Town!",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: "SF-Pro-Rounded",
                          color: myPrimaryColor)),
                ])),
            SizedBox(height: 10),
            Text(
              "The restaurants in Hangzhou also catered to many northern Chinese who had fled south from Kaifeng during the Jurchen invasion of the 1120s, while it is also known that many restaurants were run by families.",
              style: TextStyle(fontSize: 16, color: mySecondTextColor),
            ),
            SizedBox(height: 10),
            myRow("Delicious & Healthy Foods"),
            SizedBox(height: 5),
            myRow("Spacific Family And Kids Zone"),
            SizedBox(height: 5),
            myRow("Music & Other Facilities"),
            SizedBox(height: 5),
            myRow("Fastest Food Home Delivery"),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
                  onPressed: () => Get.offAllNamed(HomeScreen.routeName),
                  child:
                      const Text("Order now", style: TextStyle(fontSize: 18))),
            ),
          ],
        ),
      )),
    );
  }

  Widget myApp() {
    return AppBar(
      title: const Text(
        "About us",
        style: const TextStyle(fontSize: 26, letterSpacing: 1),
      ),
      backgroundColor: myBackgroundColor,
      leading: IconButton(
          onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios)),
    );
  }

  Widget myRow(text) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: myIconRedColor),
        SizedBox(width: 5),
        Text(text)
      ],
    );
  }
}
