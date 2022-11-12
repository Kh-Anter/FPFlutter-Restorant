import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/screens/cart.dart';
import 'package:restorant/screens/profile.dart';
import 'package:restorant/size_config.dart';
import 'package:restorant/widgets/Auth/login.dart';
import 'package:restorant/widgets/Auth/signup.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchLabel = "Search";
  @override
  Widget build(BuildContext context) {
    var _size = SizeConfig(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myBackgroundColor,
        actions: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                  onPressed: () => Get.to(CartPage()),
                  icon: const Icon(Icons.shopping_cart),
                  color: mySecondTextColor))
        ],
      ),
      drawer: Drawer(
        backgroundColor: myPrimaryColor,
        child: SafeArea(
          child: Container(
              decoration: const BoxDecoration(color: myPrimaryColor),
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Foodie',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2)),
                          Text('.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: myPrimaryColor,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2)),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                      title: Row(
                    children: [
                      const Icon(Icons.person, color: Colors.white, size: 20),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () => Get.to(profile()),
                        child: const Text('Profile',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      )
                    ],
                  )),
                  ListTile(
                      title: Row(
                    children: [
                      const Icon(Icons.add_shopping_cart,
                          color: Colors.white, size: 20),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () => Get.to(CartPage()),
                        child: const Text('Orders',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      )
                    ],
                  )),
                  ListTile(
                      title: Row(
                    children: [
                      const Icon(Icons.local_offer_outlined,
                          color: Colors.white, size: 20),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Offer and promo',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      )
                    ],
                  )),
                  ListTile(
                      title: Row(
                    children: [
                      const Icon(Icons.privacy_tip_outlined,
                          color: Colors.white, size: 20),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Privacy Policy',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      )
                    ],
                  )),
                  ListTile(
                      title: Row(
                    children: [
                      const Icon(Icons.security, color: Colors.white, size: 20),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Security',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      )
                    ],
                  )),
                ],
              )),
        ),
      ),
      body: SingleChildScrollView(
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
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
                            // borderSide: BorderSide(color: Colors.black),
                          ),
                          prefixIcon: const Icon(Icons.search,
                              color: Colors.black, size: 25),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
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
                child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.b,
                    children: <Widget>[
                      const SizedBox(height: 20.0),
                      DefaultTabController(
                          length: 4, // length of tabs
                          initialIndex: 0,
                          child: Column(children: <Widget>[
                            Container(
                              child: const TabBar(
                                labelColor: myPrimaryColor,
                                unselectedLabelColor: Colors.black,
                                tabs: [
                                  Tab(text: 'Food'),
                                  Tab(text: 'Drink'),
                                  Tab(text: 'Snacks'),
                                  Tab(text: 'Sandwich'),
                                ],
                              ),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text("See all")),
                                ]),
                            Container(
                                height: _size.getProportionateScreenHeight(420),
                                color: myBackgroundColor,
                                child: TabBarView(children: <Widget>[
                                  category("food", _size),
                                  category("drink", _size),
                                  category("snacks", _size),
                                  category("sandwich", _size),
                                ]))
                          ])),
                    ]),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: myPrimaryColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xf737, fontFamily: 'MaterialIcons')),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: "",
          ),
        ],
      ),
    );
  }

  Widget category(catName, size) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Container(
        //  padding: EdgeInsets.all(50),

        margin: EdgeInsets.symmetric(horizontal: 15),
        clipBehavior: Clip.hardEdge,
        width: size.getWidth / 1.7,
        //   height: size.,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          // height: 400,
          //  color: Colors.pink,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.maxFinite,
                height: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage:
                          AssetImage('assets/images/home/meal.jpg'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Maxican Pizza',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('#1,900',
                          style: TextStyle(
                              color: myPrimaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      itemCount: 5,
    );
  }
}
