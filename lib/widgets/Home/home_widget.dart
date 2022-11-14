import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/getx/featchData.dart';
import 'package:restorant/getx/home_ctl.dart';
import 'package:restorant/screens/search.dart';
import 'package:restorant/screens/home/see_all.dart';
import 'package:restorant/size_config.dart';

class HomeWidget extends StatelessWidget {
  final FeatchController controller = Get.put(FeatchController());
  final HomeController home_ctl = Get.put(HomeController());
  String searchLabel = "Search";

  var currentCategory = 0;

  @override
  Widget build(BuildContext context) {
    var _size = SizeConfig(context);
    return SingleChildScrollView(
      child: Container(
        color: myBackgroundColor,
        height: _size.getHeight - 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Delicious \nFood For you',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: "SF-Pro-Rounded"),
              ),
            ),
            StatefulBuilder(
              builder: (BuildContext context, setState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[250],
                        labelText: searchLabel,
                        border: InputBorder.none,
                        labelStyle: const TextStyle(
                            color: mySecondTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.search,
                            color: Colors.black, size: 25),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                width: 1, color: myBackgroundColor))),
                    onTap: () {
                      Get.to(() => Search());
                    },
                    onEditingComplete: () {
                      setState(() => searchLabel = "Search");
                      FocusScope.of(context).unfocus();
                    },
                  ),
                );
              },
            ),
            Container(
              child: Column(children: <Widget>[
                const SizedBox(height: 20.0),
                DefaultTabController(
                    length: 5, // length of tabs
                    initialIndex: currentCategory,
                    child: Column(children: <Widget>[
                      Container(
                        child: TabBar(
                          isScrollable: true,
                          labelColor: myPrimaryColor,
                          unselectedLabelColor: Colors.black,
                          onTap: (index) {
                            currentCategory = index;
                          },
                          tabs: const [
                            Tab(text: "All"),
                            Tab(text: 'Pizza'),
                            Tab(text: 'Burger'),
                            Tab(text: 'Drink'),
                            Tab(text: 'Sandwich'),
                          ],
                        ),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        TextButton(
                            onPressed: () {
                              print(currentCategory);
                              Get.toNamed(SeeAll.routeName, parameters: {
                                "index": currentCategory.toString()
                              });
                            },
                            child: const Text("See all")),
                      ]),
                      Container(
                          height: _size.getProportionateScreenHeight(420),
                          color: myBackgroundColor,
                          child: TabBarView(children: <Widget>[
                            category("all", _size),
                            category("pizza", _size),
                            category("burger", _size),
                            category("drinks", _size),
                            category("sandwich", _size),
                          ]))
                    ])),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget category(catName, size) {
    return FutureBuilder(
        future: controller.fetch_items(catName),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            switch (catName) {
              case "all":
                return buildCatList(controller.all);
                break;
              case "pizza":
                return buildCatList(controller.pizza);
                break;
              case "burger":
                return buildCatList(controller.burger);
                break;
              case "drinks":
                return buildCatList(controller.drink);
                break;
              case "sandwich":
                return buildCatList(controller.sandwich);
                break;
              default:
                return Center(child: CircularProgressIndicator());
            }
          }
        });
  }

  Widget buildCatList(List items) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Container(
          width: 200,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
              child: SizedBox(
                  child: Center(
                      child: Stack(
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
                        Text(
                          items[index]["name"],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(items[index]["price"].toString() + " L.E",
                              style: TextStyle(
                                  color: myPrimaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        )
                      ]),
                  width: 200,
                  height: 250,
                ),
              ),
              Positioned(
                left: 25,
                top: 10,
                child: Container(
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('assets/images/home/meal.jpg'),
                  ),
                ),
              ),
            ],
          ))))),
      itemCount: items.length,
    );
  }
}
