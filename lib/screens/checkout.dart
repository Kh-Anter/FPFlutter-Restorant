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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Details',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.blue),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Name : ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey),
                        ),
                        Text(
                          '${user.firstName} ${user.lastName}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Email : ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey),
                        ),
                        Text(
                          '${user.email}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Mobile Number : ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey),
                        ),
                        Text(
                          '${user.mobileNumber}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Address : ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey),
                        ),
                        Container(
                          width: 250,
                          child: Text(
                            'New valley-Elkharga-basatin - naser yassin',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            maxLines: 1,overflow: TextOverflow.ellipsis,softWrap: false,

                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Order Details',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.blue),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Number Of Item : ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey),
                        ),
                        Text(
                          '${mcontroller.cardlist.length}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Order Price:  ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey),
                        ),
                        Text(
                          '${mcontroller.totalcardprice} \$',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Delevry Fees : ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey),
                        ),
                        Text(
                          '${deleveryprice} \$',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Total : ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey),
                        ),
                        Text(
                          '${mcontroller.totalcardprice+deleveryprice} \$',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Method',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: myPrimaryColor,
                          width: 2
                        ),
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
