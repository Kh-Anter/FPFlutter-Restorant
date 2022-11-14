import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/controller/maincontroller.dart';
import 'package:restorant/model/user_model.dart';
import 'package:restorant/screens/home.dart';

class checkout extends StatelessWidget {
  static const routeName = "/checkout";
  maincontroller mcontroller = Get.put(maincontroller());
  bool value = true;
  double deleveryprice=50;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<maincontroller>(
        init: mcontroller,
        initState: (_) {},
        builder: (mcontroller) {
          mcontroller.getUserData();
          var user=mcontroller.userDataModel;
          return Scaffold(
            backgroundColor: myBackgroundColor,
            appBar: AppBar(
              backgroundColor: Colors.deepOrange,
              title: Text(
                'chekout',
                style: TextStyle(fontSize: 26,color: Colors.white),
              ),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () => Get.off(HomeScreen()),
                  icon: Icon(Icons.arrow_back_ios)),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Personal Details',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name : ${user.firstName} ${user.lastName}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                  'Email : ${user.email}',
                                  style:
                                  TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
                                ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                    'Phone Number : ${user.mobileNumber}',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
                                  ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: 350,
                                  child: Text(
                                    'Address : New valley-Elkharga-basatin - naser yassin',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Order Details',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Number Of Item : ${mcontroller.cardlist.length} Item',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Order Price : ${mcontroller.totalcardprice} \$',
                                style:
                                TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Delevry Fees : ${deleveryprice} \$',
                                style:
                                TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Total  : ${mcontroller.totalcardprice+deleveryprice} \$',
                                style:
                                TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Payment Method',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            'Pay on Cash When Deliver',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ), //Text
                          SizedBox(width: 10), //SizedBox
                          Checkbox(
                            value: this.value,
                            onChanged: (bool value) {
                                this.value = value;
                            },
                          ),//Checkbox
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
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
                ],
              ),
            ),
          );
        });
  }
}
