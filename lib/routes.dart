import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restorant/screens/aboutus.dart';
import 'package:restorant/screens/authentication.dart';

import 'package:restorant/screens/checkout.dart';
import 'package:restorant/screens/home/cart.dart';
import 'package:restorant/screens/home/home.dart';
import 'package:restorant/screens/offers.dart';
import 'package:restorant/screens/onboarding_Screen.dart';
import 'package:restorant/screens/profile.dart';
import 'package:restorant/screens/home/see_all.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: Authentication.routeName, page: () => Authentication()),
  GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),
  GetPage(name: OnboardingScreen.routeName, page: () => OnboardingScreen()),
  GetPage(name: CartPage.routeName, page: () => CartPage()),
  GetPage(name: profile.routeName, page: () => profile()),
  GetPage(name: SeeAll.routeName, page: () => SeeAll()),
  GetPage(name: Offers.routeName, page: () => Offers()),
  GetPage(name: Aboutus.routeName, page: () => Aboutus()),
  GetPage(name: checkout.routeName, page: () => checkout()),
];
