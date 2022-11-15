import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/controller/maincontroller.dart';
import 'package:restorant/getx/featchData.dart';
import 'package:restorant/getx/home_ctl.dart';
import 'package:restorant/screens/item_details.dart';
import 'package:restorant/screens/see_all.dart';
import 'package:restorant/size_config.dart';

class HomeWidget extends StatelessWidget {
  final FeatchController controller = Get.put(FeatchController());
  final HomeController home_ctl = Get.put(HomeController());
  final maincontroller main = Get.put(maincontroller());

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
                      setState(() {
                        searchLabel = "";
                      });
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
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 4,
                offset: Offset(4, 8),              )
            ]
          ),
          child: Center(
              child: SizedBox(
                  child: Center(
                      child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: <Widget>[
              Positioned(
                top: 90,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50),
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
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  itemDetails(items[index]['name'],items[index]['price'].toString(),
                                  items[index]['description'],items[index]['pic'])),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                color: myPrimaryColor,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(child: Text('View Details',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(onPressed: (){
                              main.setfavitem(items[index]['name'],items[index]['price'].toString(),
                                items[index]['description'],items[index]['pic'],
                              );
                            }, icon: Icon(Icons.favorite,color: Colors.grey,)),

                            IconButton(onPressed: (){
                              main.setcarditem(items[index]['name'],items[index]['price'].toString(),
                                items[index]['description'],items[index]['pic'],
                              );
                            }, icon: Icon(Icons.add_shopping_cart))
                          ],
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
