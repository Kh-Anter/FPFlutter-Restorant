import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/getx/auth.dart';
import 'package:restorant/getx/featchData.dart';
import 'package:restorant/screens/home/home.dart';
import 'package:restorant/size_config.dart';

class SeeAll extends StatelessWidget {
  var _size;
  static const routeName = "/SeeAll";
  var items = [];
  final FeatchController controller = Get.find();
  var paramData = Get.parameters["index"];
  var title = "";
  @override
  Widget build(BuildContext context) {
    _size = SizeConfig(context);
    switch (paramData) {
      case "0":
        items = controller.all;
        title = "All";
        break;
      case "1":
        items = controller.pizza;
        title = "Pizza";
        break;
      case "2":
        items = controller.burger;
        title = "Burger";
        break;
      case "3":
        items = controller.drink;
        title = "Drink";
        break;
      case "4":
        items = controller.sandwich;
        title = "Snadwich";
        break;
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: myBackgroundColor,
          title: Text(
            title,
            style: const TextStyle(fontSize: 26, letterSpacing: 1),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Container(
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
                    height: _size.getProportionateScreenHeight(310.0),
                    width: (_size.getWidth - 40) / 2,
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
                                          fontSize: 20)),
                                  SizedBox(height: 10),
                                  Text(items[i]["price"].toString() + " L.E",
                                      style: TextStyle(
                                          color: myPrimaryColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold))
                                ]),
                            width: (_size.getWidth - 50) / 2,
                            height: _size.getProportionateScreenHeight(212.0),
                          ),
                        ),
                        Positioned(
                          left: 25,
                          top: 10,
                          child: Container(
                            child: CircleAvatar(
                              radius: _size.getProportionateScreenWidth(65.0),
                              backgroundImage: NetworkImage(items[i]["pic"]),
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
        ));
  }
}
