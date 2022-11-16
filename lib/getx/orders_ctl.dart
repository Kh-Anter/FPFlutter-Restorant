import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    var listOfOrders = await orders
        .where('uid', isEqualTo: uid)
        // .where('isDeliverd', isEqualTo: isDeliverd ? true : false)
        .get();
    List<Map<String, dynamic>> result = [];
    print(listOfOrders.docs);
    for (int i = 0; i < listOfOrders.docs.length; i++) {
      result.add(
        {
          "address": listOfOrders.docs[i].get("address").toString(),
          "date": listOfOrders.docs[i].get("date").toString(),
          "items": listOfOrders.docs[i].get("items"),
          "total": listOfOrders.docs[i].get("total"),
          "orderId": listOfOrders.docs[i].id
        },
      );
    }
    // print(listOfOrders.docs[0]);
    print(uid);
    print(isDeliverd);
    print(result);
    return result;
  }

  cancelOrder(orderId) {
    orders.doc(orderId).delete();
  }

  orderSent(orderId) {}
}
