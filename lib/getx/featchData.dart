import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restorant/screens/search.dart';

class FeatchController extends GetxController {
  CollectionReference items = FirebaseFirestore.instance.collection('items');
  TextEditingController search_ctl = TextEditingController();
  List<Map<String, dynamic>> pizza = [];
  List<Map<String, dynamic>> burger = [];
  List<Map<String, dynamic>> drink = [];
  List<Map<String, dynamic>> sandwich = [];
  List<Map<String, dynamic>> all = [];
  List<Map<String, dynamic>> searchResult = [];
  List<Map<String, dynamic>> offers = [];
  var state = false;

  Future fetch_items(String cat) async {
    state = true;
    switch (cat) {
      case "pizza":
        pizza = await getbyCat("pizza");
        break;
      case "burger":
        burger = await getbyCat("burger");
        break;
      case "drinks":
        drink = await getbyCat("drinks");
        break;
      case "sandwich":
        sandwich = await getbyCat("sandwich");
        break;
      case "all":
        all = await getbyCat("all");
        break;
    }
  }

  Future<List<Map<String, dynamic>>> getbyCat(String cat) async {
    var listOfItem;
    if (cat == "all") {
      listOfItem = await items.get();
    } else {
      listOfItem = await items.where('category', isEqualTo: cat).get();
    }
    List<Map<String, dynamic>> result = [];

    for (int i = 0; i < listOfItem.docs.length; i++) {
      var name = listOfItem.docs[i].get("iName").toString();
      var pic = listOfItem.docs[i].get("iPic").toString();
      var price = listOfItem.docs[i].get("iPrice");
      var rate = listOfItem.docs[i].get("rate");
      var discount = listOfItem.docs[i].get("discount");
      var description = listOfItem.docs[i].get("description").toString();

      result.add({
        "name": name,
        "pic": pic,
        "price": price,
        "rate": rate,
        "discount": discount,
        "description": description
      });
    }

    return result;
  }

  search(String key) {
    searchResult = [];
    if (key.trim() != "") {
      all.map((e) {
        if ((e["name"].toString().contains(key) ||
            e["description"].toString().contains(key))) {
          searchResult.add(e);
        }
      }).toList();
    }
    print("------------------- the result-------");
    print(searchResult);
  }

  Future getOffers() async {
    var listOfItem = await items.where('category', isEqualTo: null).get();
    offers = [];
    for (int i = 0; i < listOfItem.docs.length; i++) {
      var name = listOfItem.docs[i].get("iName").toString();
      var pic = listOfItem.docs[i].get("iPic").toString();
      var price = listOfItem.docs[i].get("iPrice");
      var rate = listOfItem.docs[i].get("rate");
      var discount = listOfItem.docs[i].get("discount");
      var description = listOfItem.docs[i].get("description").toString();
      var priceAffterSale = (price - (price * (discount / 100))).round();

      offers.add({
        "name": name,
        "pic": pic,
        "price": price,
        "priceAffterSale": priceAffterSale,
        "rate": rate,
        "discount": discount,
        "description": description
      });
    }
  }
}
