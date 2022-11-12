import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restorant/screens/authentication.dart';
import 'package:restorant/screens/cart.dart';
import 'package:restorant/screens/home.dart';
import 'package:restorant/screens/onboarding_Screen.dart';
import 'package:restorant/screens/profile.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: Authentication.routeName, page: () => Authentication()),
  GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),
  GetPage(name: OnboardingScreen.routeName, page: () => OnboardingScreen()),
  GetPage(name: CartPage.routeName, page: () => CartPage()),
  GetPage(name: profile.routeName, page: () => profile()),
];
