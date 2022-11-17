import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class OrdersCtl extends GetxController {
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');
  static const routeName = "/Orders";
  int role;

  getUserRole() async {
    var uid = FirebaseAuth.instance.currentUser.uid;
    var users =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    role = (users.data()["role"]);
  }

  getOrders({bool isDeliverd}) async {
    await getUserRole();

    var uid = FirebaseAuth.instance.currentUser.uid;
    var listOfOrders = role == 0
        ? await orders
            .where('uid', isEqualTo: uid)
            .where('isDeliverd', isEqualTo: isDeliverd)
            .get()
        : await orders
            .where('did', isEqualTo: uid)
            .where('isDeliverd', isEqualTo: isDeliverd)
            .get();

    List<Map<String, dynamic>> result = [];

    for (int i = 0; i < listOfOrders.docs.length; i++) {
      DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(
          listOfOrders.docs[i].get("date").seconds * 1000);
      var date = DateFormat('yyyy-MM-dd').format(tsdate);
      result.add(
        {
          "address": listOfOrders.docs[i].get("address").toString(),
          "date": date,
          "items": listOfOrders.docs[i].get("item"),
          "total": listOfOrders.docs[i].get("total"),
          "orderId": listOfOrders.docs[i].id
        },
      );
    }
    print(result);
    return result;
  }

  cancelOrder(orderId) {
    orders.doc(orderId).delete();
    print("here cancel order");
    print(orderId);
  }

  orderSent(orderId) async {
    print("heeere order send");
    print(orderId);
    var uid = FirebaseAuth.instance.currentUser.uid;
    await orders.doc(orderId).update({"isDeliverd": true});
    //.where('orderid', isEqualTo: uid);
  }
}
