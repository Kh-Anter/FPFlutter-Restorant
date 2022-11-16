import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/getx/featchData.dart';
import 'package:restorant/screens/home/home.dart';
import 'package:restorant/size_config.dart';

class Offers extends StatelessWidget {
  Offers({Key key}) : super(key: key);
  static const routeName = "/Offers";
  final FeatchController controller = Get.put(FeatchController());

  @override
  Widget build(BuildContext context) {
    var _size = SizeConfig(context);
    return Scaffold(
      backgroundColor: myBackgroundColor,
      body: FutureBuilder(
        future: controller.getOffers(),
        initialData: _emptyWidget(_size),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done &&
              controller.offers == []) {
            return _emptyWidget(_size);
          } else {
            return _offers(controller.offers, _size);
          }
        },
      ),
    );
  }

  Widget _offers(items, size) {
    return Container(
      color: myBackgroundColor,
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        padding: EdgeInsets.only(left: 5, right: 5),
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        itemCount: items.length,
        itemBuilder: (c, i) {
          return Container(
              alignment: i == 1 ? Alignment.bottomCenter : Alignment.center,
              child: Container(
                height: size.getProportionateScreenHeight(310.0),
                width: (size.getWidth - 40) / 2,
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: <Widget>[
                    Positioned(
                      top: 75,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 30),
                              Text(items[i]["name"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22)),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(items[i]["price"].toString() + " L.E",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough)),
                                  SizedBox(width: 5),
                                  Text(
                                      items[i]["priceAffterSale"].toString() +
                                          " L.E",
                                      style: TextStyle(
                                          color: myPrimaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "sale " +
                                      items[i]["discount"].toString() +
                                      "%",
                                  style: TextStyle(
                                      color: Colors.white,
                                      backgroundColor: myPrimaryColor,
                                      fontWeight: FontWeight.bold)),
                            ]),
                        width: (size.getWidth - 50) / 2,
                        height: size.getProportionateScreenHeight(212.0),
                      ),
                    ),
                    Positioned(
                      left: 25,
                      top: 10,
                      child: Container(
                        child: CircleAvatar(
                          radius: size.getProportionateScreenWidth(65.0),
                          backgroundImage:
                              AssetImage('assets/images/home/meal.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        },
        staggeredTileBuilder: (index) {
          return StaggeredTile.count(1, index == 1 ? 1.9 : 1.4);
        },
      ),
    );
  }

  Widget _emptyWidget(size) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "ohh snap! No offers yet",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          width: size.getWidth / 1.5,
          child: const Text(
            "Foode dose’t have any offers yet please check again.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: mySecondTextColor),
          ),
        ),
      ],
    ));
  }
}
