import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:restorant/model/favorite_model.dart';
import 'package:restorant/model/user_model.dart';

class maincontroller extends GetxController{
  var isload=false;
  var favoritelist=<favoritemodel>[];
  final UID=FirebaseAuth.instance.currentUser.uid;
  UserDataModel userDataModel;


  Future<void> getfavitem() async{
    try{
      QuerySnapshot items= await FirebaseFirestore.instance.collection('users').doc(UID).collection('favorite').get();
      favoritelist.clear();
      for(var item in items.docs){
        favoritelist.add(favoritemodel(item['name'], item['price'], item.id));
      }
      isload=false;
    } catch(e){
      Get.snackbar('Error', '${e.toString()}');
    }
  }

  void setfavitem(String itemId){
    FirebaseFirestore.instance.collection('users').doc(UID).collection('favorite').doc(itemId)
        .set({
      'name':'chease',
      'price':'500',
    }).then((value){
      print('finish 1');
    }).catchError((error){
    });
  }

  void deletefavitem(String itemId){
    FirebaseFirestore.instance.collection('users').doc(UID).collection('favorite').doc(itemId)
        .delete().then((value){
      print('delete 1');
    }).catchError((error){
    });
  }

  void getUserData(){
    FirebaseFirestore.instance.collection('users').doc(UID).get().then((value){
      userDataModel=UserDataModel.fromJson(value.data());
      //emit(GetUserLoadDataSuccessState());
    }).catchError((error){
      print(error.toString());
    });
  }

}