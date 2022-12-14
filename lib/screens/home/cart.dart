import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/controller/maincontroller.dart';
import 'package:restorant/screens/checkout.dart';
import 'package:restorant/screens/home/home.dart';
import 'package:restorant/screens/item_details.dart';

class CartPage extends StatefulWidget {
  static const routeName = "/Cart";

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  maincontroller cardcontroller = Get.put(maincontroller());

  int num = 1;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<maincontroller>(
        init: cardcontroller,
        initState: (_) {},
        builder: (cardcontroller) {
          cardcontroller.getcarditem();
          return Scaffold(
            backgroundColor: myBackgroundColor,
            body: cardcontroller.isload
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          'Swipe on an Item To delete',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => Dismissible(
                              onDismissed: (ind) {
                                cardcontroller.deletecarditem(
                                    cardcontroller.cardlist[index].itemid);
                              },
                              key: Key('item ${index}'),
                              background: Container(child: Icon(Icons.delete)),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => itemDetails(
                                          cardcontroller.cardlist[index].name,
                                          cardcontroller.cardlist[index].price,
                                          cardcontroller
                                              .cardlist[index].description,
                                          cardcontroller.cardlist[index].pic,
                                        ),
                                      ));
                                },
                                child: Container(
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              radius: 40,
                                              backgroundImage: AssetImage(
                                                  'assets/images/home/meal.jpg'),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  cardcontroller
                                                      .cardlist[index].name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  cardcontroller
                                                      .cardlist[index].price,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                      color: Colors.orange),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.orange[700],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          num++;
                                                          cardcontroller
                                                              .increase(
                                                                  cardcontroller
                                                                      .cardlist[
                                                                          index]
                                                                      .price);
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.remove,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      '1',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          num++;
                                                          cardcontroller
                                                              .increase(
                                                                  cardcontroller
                                                                      .cardlist[
                                                                          index]
                                                                      .price);
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.remove,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20,
                            ),
                            itemCount: cardcontroller.cardlist.length,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${cardcontroller.totalcardprice}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(checkout.routeName);
                          },
                          child: Container(
                              height: 50,
                              width: double.maxFinite,
                              decoration:
                                  BoxDecoration(color: Colors.deepOrange),
                              child: Center(
                                  child: Text(
                                'Press To Complete',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ))),
                        ),
                      ],
                    ),
                  ),
          );
        });
  }
}
