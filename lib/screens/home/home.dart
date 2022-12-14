import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/getx/auth.dart';
import 'package:restorant/getx/featchData.dart';
import 'package:restorant/getx/home_ctl.dart';
import 'package:restorant/controller/maincontroller.dart';
import 'package:restorant/screens/Favorite.dart';
import 'package:restorant/screens/aboutus.dart';
import 'package:restorant/screens/authentication.dart';
import 'package:restorant/screens/home/cart.dart';
import 'package:restorant/screens/offers.dart';
import 'package:restorant/screens/orders.dart';
import 'package:restorant/screens/profile.dart';
import 'package:restorant/screens/home/see_all.dart';
import 'package:restorant/size_config.dart';
import 'package:restorant/widgets/Home/home_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final ZoomDrawerController z = ZoomDrawerController();
  final Auth controller = Get.put(Auth());
  final Home = HomeScreen();

  @override
  Widget build(BuildContext context) {
    var _size = SizeConfig(context);

    return ZoomDrawer(
        controller: z,
        borderRadius: 24,
        style: DrawerStyle.defaultStyle,
        showShadow: true,
        openCurve: Curves.fastOutSlowIn,
        slideWidth: _size.getWidth * 0.7,
        duration: const Duration(milliseconds: 500),
        angle: 0.0,
        menuBackgroundColor: myPrimaryColor,
        mainScreen: MainHome(),
        menuScreen: Scaffold(
            backgroundColor: myPrimaryColor,
            body: Column(
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
                      onPressed: () => Get.toNamed(profile.routeName),
                      child: const Text('Profile',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    )
                  ],
                )),
                const Divider(
                    thickness: 0.2,
                    color: Colors.white,
                    indent: 50,
                    endIndent: 50),
                ListTile(
                    title: Row(
                  children: [
                    const Icon(Icons.timelapse, color: Colors.white, size: 20),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () => Get.toNamed(Orders.routeName),
                      child: const Text('Orders',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    )
                  ],
                )),
                const Divider(
                    thickness: 0.2,
                    color: Colors.white,
                    indent: 50,
                    endIndent: 50),
                ListTile(
                    title: Row(
                  children: [
                    const Icon(Icons.table_restaurant,
                        color: Colors.white, size: 20),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Book a table',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    )
                  ],
                )),
                const Divider(
                    thickness: 0.2,
                    color: Colors.white,
                    indent: 50,
                    endIndent: 50),
                ListTile(
                    // onTap: ,
                    title: Row(
                  children: [
                    const Icon(Icons.privacy_tip_outlined,
                        color: Colors.white, size: 20),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () => Get.to(() => Aboutus()),
                      child: const Text('About us',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    )
                  ],
                )),
                Spacer(),
                FirebaseAuth.instance.currentUser == null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                            title: Row(
                          children: [
                            const Icon(Icons.login,
                                color: Colors.white, size: 20),
                            const SizedBox(width: 10),
                            TextButton(
                              onPressed: () => Get.to(() => Authentication()),
                              child: const Text('Resgister',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                            )
                          ],
                        )),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () async {
                                  await controller.logout();
                                  setState(() {});
                                },
                                child: const Text('Sign-out',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18))),
                            const Icon(Icons.arrow_forward_sharp,
                                color: Colors.white, size: 20),
                          ],
                        ),
                      ) //),
              ],
            )));
  }
}

class MainHome extends StatefulWidget {
  MainHome({Key key}) : super(key: key);

  maincontroller favcontroller = Get.put(maincontroller());

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  final FeatchController controller = Get.put(FeatchController());
  final HomeController home_ctl = Get.put(HomeController());
  // final _drawerController = ZoomDrawerController();
  String appbar_title = "";
  String searchLabel = "Search";
  int currentIndex = 0;
  Widget body = HomeWidget();

  Widget build(BuildContext context) {
    var _size = SizeConfig(context);
    return Scaffold(
        backgroundColor: myBackgroundColor,
        appBar: AppBar(
            backgroundColor: myBackgroundColor, title: Text(appbar_title)),
        body: body, //_homeBody(),
        bottomNavigationBar: //Obx(() =>
            BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: myPrimaryColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex, //home_ctl.bottomNavIndex.value,
          onTap: (index) {
            setState(() {
              _setboodyAndTitle(index);
              currentIndex = index;
              //  home_ctl.changeIndex(index);
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: ""),
          ],
        ));
    //);
  }

  _setboodyAndTitle(bottomNavIndex) {
    switch (bottomNavIndex) {
      case 0:
        {
          appbar_title = "";
          body = HomeWidget();
        }
        break;
      case 1:
        {
          appbar_title = "Favorite";
          body = FavoritePage();
        }
        break;
      case 2:
        {
          appbar_title = "Cart";
          body = CartPage();
        }
        break;
      case 3:
        {
          appbar_title = "Offers";
          body = Offers();
        }
        break;
    }
  }
}
