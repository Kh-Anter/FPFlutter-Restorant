import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/controller/maincontroller.dart';
import 'package:restorant/model/user_model.dart';
import 'package:restorant/screens/home/home.dart';
import 'package:restorant/size_config.dart';

class checkout extends StatefulWidget {
  static const routeName = "/checkout";

  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  maincontroller mcontroller = Get.put(maincontroller());

  bool value = true;
  double deleveryprice = 50;
  bool pickup =true;
  @override
  Widget build(BuildContext context) {
    var _size = SizeConfig(context);
    return GetBuilder<maincontroller>(
        init: mcontroller,
        initState: (_) {},
        builder: (mcontroller) {
          mcontroller.getUserData();
          var user = mcontroller.userDataModel;
          return Scaffold(
            backgroundColor: myBackgroundColor,
            appBar: AppBar(
              backgroundColor: myBackgroundColor,
              title: Text(
                'chekout',
                style: TextStyle(fontSize: 24,),
              ),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () => Get.off(HomeScreen()),
                  icon: Icon(Icons.arrow_back_ios)),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Address Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: _size.getWidth-20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${user.firstName} ${user.lastName}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(color: Colors.grey[700],thickness: 2),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${mcontroller.addressList.last.itemid}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(color: Colors.grey[700],thickness: 2),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${user.mobileNumber}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Method.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: _size.getWidth-20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: const Text('Door Delivery',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            leading: Radio<bool>(
                              value: false,
                              groupValue: pickup,
                              onChanged: (bool value) {
                                setState(() {
                                  pickup = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('Pick Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            leading: Radio<bool>(
                              value: true,
                              groupValue: pickup,
                              onChanged: (bool value) {
                                setState(() {
                                  pickup = value;
                                });
                              },
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Method.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: myPrimaryColor, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10),
                        child: Row(
                          children: [
                            Text(
                              'Pay on Cash When Deliver',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ), //Text
                            SizedBox(width: 10), //SizedBox
                            Checkbox(
                              value: this.value,
                              onChanged: (bool value) {
                                this.value = value;
                              },
                            ), //Checkbox
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Spacer(),
                        Text(
                          '${pickup?mcontroller.totalcardprice:mcontroller.totalcardprice + deleveryprice} \$',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      mcontroller.setorder(mcontroller.addressList.last.itemid, mcontroller.totalcardprice.toString(),'first','123');
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: myPrimaryColor,
                      ),
                      child: Center(
                          child: Text(
                            'Confirm Order',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
