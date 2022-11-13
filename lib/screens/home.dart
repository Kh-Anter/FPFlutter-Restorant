import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/getx/featchData.dart';
import 'package:restorant/getx/home_ctl.dart';
import 'package:restorant/controller/maincontroller.dart';
import 'package:restorant/screens/cart.dart';
import 'package:restorant/screens/profile.dart';
import 'package:restorant/screens/see_all.dart';
import 'package:restorant/size_config.dart';
import 'package:restorant/widgets/Home/home_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/Home";
  maincontroller favcontroller = Get.put(maincontroller());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final FeatchController controller = Get.put(FeatchController());
  final HomeController home_ctl = Get.put(HomeController());
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
                        const Icon(Icons.security,
                            color: Colors.white, size: 20),
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
        body: Obx(() => _homeBody(home_ctl.bottomNavIndex.value)),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: myPrimaryColor,
              type: BottomNavigationBarType.fixed,
              currentIndex: home_ctl.bottomNavIndex.value,
              onTap: (index) {
                home_ctl.changeIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
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
            )));
  }

  _homeBody(bottomNavIndex) {
    switch (bottomNavIndex) {
      case 0:
        {
          return HomeWidget();
        }
        break;
      case 1:
        {
          return Center(child: Text("Favorite"));
        }
        break;
      case 2:
        {
          return Center(child: Text("Profile"));
        }
        break;
      case 3:
        {
          return Center(child: Text("lll"));
        }
        break;
    }
  }
}
