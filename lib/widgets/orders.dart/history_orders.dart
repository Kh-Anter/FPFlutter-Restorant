import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/getx/orders_ctl.dart';
import 'package:restorant/screens/home/home.dart';
import 'package:restorant/size_config.dart';

class HistoryOrders extends StatefulWidget {
  HistoryOrders({Key key}) : super(key: key);

  @override
  State<HistoryOrders> createState() => _HistoryOrdersState();
}

class _HistoryOrdersState extends State<HistoryOrders> {
  final OrdersCtl controller = Get.put(OrdersCtl());

  @override
  Widget build(BuildContext context) {
    var _size = SizeConfig(context);
    return FutureBuilder(
        future: controller.getOrders(isDeliverd: true),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && (snapshot.data.length != 0)) {
            return buildBody(snapshot.data, _size, controller.role);
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data.length == 0) {
            return emptyOrders(_size);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  buildBody(result, _size, role) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 0.5, color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            Container(
                child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (r_ctx, r_i) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(3),
                      child: Row(
                        children: [
                          const Icon(Icons.info_outline_sharp,
                              color: myIconRedColor, size: 10),
                          const SizedBox(width: 10),
                          Text(
                            result[i]["items"][r_i]["itemID"],
                            style: const TextStyle(
                                fontSize: 18, color: mySecondTextColor),
                          ),
                        ],
                      ),
                    ),
                    Text("x${result[i]["items"][r_i]["count"]}",
                        style: const TextStyle(fontSize: 18))
                  ],
                );
              },
              itemCount: result[i]["items"].length,
            )),
            Divider(thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Date",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: mySecondTextColor)),
                Text(result[i]["date"].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: myIconRedColor)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: mySecondTextColor)),
                Text(result[i]["total"].toString() + " LE ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: myIconRedColor)),
              ],
            ),
            if (role == 0)
              Container(
                  margin: const EdgeInsets.only(bottom: 20, top: 20),
                  width: _size.getWidth - 70,
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)))),
                      onPressed: () => showDialog(
                          context: context, builder: (ctx) => myAlertDialog()),
                      child: Text("Re-Order", style: TextStyle(fontSize: 18))))
          ]),
        );
      },
      itemCount: result.length,
    );
  }

  // set up the AlertDialog
  Widget myAlertDialog() {
    return AlertDialog(
      //title: Text("AlertDialog"),
      content: Text("Would you like to continue Re-order ?"),
      actions: [
        TextButton(child: Text("Cancel"), onPressed: () => Get.back()),
        TextButton(
          child: Text("Continue"),
          onPressed: () {},
        )
      ],
    );
  }

  Widget emptyOrders(_size) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.bagShopping,
            size: 142,
          ),
          SizedBox(height: 20),
          Text(
            "No Orders",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("There are no orders to show. ",
              style: TextStyle(fontSize: 16, color: mySecondTextColor)),
          Container(
              margin: const EdgeInsets.only(bottom: 20, top: 20),
              width: _size.getWidth - 70,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
                  onPressed: () => Get.offAllNamed(HomeScreen
                      .routeName), // offAndToNamed(HomeScreen.routeName),
                  child: Text("Go shopping", style: TextStyle(fontSize: 18))))
        ],
      ),
    );
  }
}
