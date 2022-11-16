import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:restorant/model/favorite_model.dart';
import 'package:restorant/model/user_model.dart';

class maincontroller extends GetxController {
  var isload = false;
  var favoritelist = <favoritemodel>[];
  var cardlist = <favoritemodel>[];

  UserDataModel userDataModel;
  double totalcardprice = 0;

  Future<void> getfavitem() async {
    final UID = FirebaseAuth.instance.currentUser.uid;
    try {
      QuerySnapshot items = await FirebaseFirestore.instance
          .collection('users')
          .doc(UID)
          .collection('favorite')
          .get();
      favoritelist.clear();
      for (var item in items.docs) {
        favoritelist.add(favoritemodel(item['name'], item['price'], item['uid'],
            item['description'], item['pic']));
      }
      isload = false;
    } catch (e) {
      Get.snackbar('Error', '${e.toString()}');
    }
  }

  void setfavitem(String name, String price, String description, String pic) {
    final UID = FirebaseAuth.instance.currentUser.uid;
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(UID)
        .collection('favorite')
        .doc();
    documentReference.set({
      'name': name,
      'price': price,
      'description': description,
      'pic': pic,
      'uid': documentReference.id
    }).then((value) {
      getfavitem();
      print('Add from fav');
    }).catchError((error) {});
  }

  void deletefavitem(String itemId) {
    final UID = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(UID)
        .collection('favorite')
        .doc(itemId)
        .delete()
        .then((value) {
      getfavitem();
      print('delete From fav');
    }).catchError((error) {});
  }

  Future<void> getcarditem() async {
    final UID = FirebaseAuth.instance.currentUser.uid;
    try {
      QuerySnapshot items = await FirebaseFirestore.instance
          .collection('users')
          .doc(UID)
          .collection('card')
          .get();
      cardlist.clear();
      totalcardprice = 0;
      for (var item in items.docs) {
        cardlist.add(favoritemodel(item['name'], item['price'], item['uid'],
            item['description'], item['pic']));
        totalcardprice = totalcardprice + double.parse(item['price']);
      }
      isload = false;
    } catch (e) {
      Get.snackbar('Error', '${e.toString()}');
    }
  }

  void setcarditem(String name, String price, String description, String pic) {
    final UID = FirebaseAuth.instance.currentUser.uid;
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users')
        .doc(UID)
        .collection('card')
        .doc();
    documentReference.set({
      'name': name,
      'price': price,
      'description': description,
      'pic': pic,
      'uid': documentReference.id
    }).then((value) {
      getcarditem();
      print('Add from card');
    }).catchError((error) {});
  }

  void deletecarditem(String itemId) {
    final UID = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(UID)
        .collection('card')
        .doc(itemId)
        .delete()
        .then((value) {
      getcarditem();
      totalcardprice = totalcardprice;
      print('delete From card');
    }).catchError((error) {});
  }

  void increase(String price) {
    totalcardprice = totalcardprice + double.parse(price);
    print(totalcardprice);
  }

  void getUserData() {
    final UID = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance.collection('users').doc(UID).get().then((value) {
      userDataModel = UserDataModel.fromJson(value.data());
      //emit(GetUserLoadDataSuccessState());
    }).catchError((error) {
      print(error.toString());
    });
  }
}
