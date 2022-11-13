import 'package:get/get.dart';

class HomeController extends GetxController {
  var bottomNavIndex = 0.obs;

  changeIndex(index) {
    bottomNavIndex.value = index;
  }
}
