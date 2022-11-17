import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:restorant/controller/maincontroller.dart';

class controlbinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    // final UID = FirebaseAuth.instance.currentUser.uid;
    Get.put<maincontroller>(maincontroller())
      ..getfavitem()
      ..getUserData()
      ..getcarditem()
      ..getAddress();
  }
}
