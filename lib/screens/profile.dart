import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/controller/maincontroller.dart';
import 'package:restorant/model/user_model.dart';
import 'package:restorant/screens/home/home.dart';
import 'package:restorant/widgets/not_authentication.dart';

class profile extends StatelessWidget {
  static const routeName = "/Profile";
  maincontroller mcontroller = Get.put(maincontroller());
  var AdressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser == null
        ? notAuthenticated()
        : GetBuilder<maincontroller>(
            init: mcontroller,
            initState: (_) {},
            builder: (mcontroller) {
              mcontroller.getUserData();
              mcontroller.getAddress();
              AdressController.text = mcontroller.addressList.last.itemid;
              var user = mcontroller.userDataModel;
              return Scaffold(
                  backgroundColor: myBackgroundColor,
                  body: SingleChildScrollView(
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SafeArea(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Personal Details',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Change',
                                style: TextStyle(
                                    color: myPrimaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 10),
                              child: Row(
                                children: [
                                  Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: AssetImage(
                                          'assets/images/profile/av1.png',
                                        )),
                                      )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${user.firstName} ${user.lastName}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        width: 240,
                                        child: Text(
                                          '${user.email}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          width: 200,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                width: 2,
                                                color: Colors.grey,
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              '${user.mobileNumber}',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey[700]),
                                            ),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 200,
                                        child: TextFormField(
                                          controller: AdressController,
                                          decoration: const InputDecoration(
                                            border: UnderlineInputBorder(),
                                            labelText: 'Enter your Adress',
                                          ),
                                        ),
                                      ),
                                      // Container(
                                      //     width: 240,
                                      //     child: Text(
                                      //       'New valley-Elkharga-basatin - naser yassin',
                                      //       style: TextStyle(
                                      //           fontSize: 18, color: Colors.grey[700]),
                                      //     )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Orders',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 25,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Faq',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 25,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Help',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GestureDetector(
                              onTap: () {
                                mcontroller.setadress(AdressController.text);
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: myPrimaryColor,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                    child: Text(
                                  'Update',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2),
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )));
            });
  }

  Widget notAuthenticated() {
    return Scaffold(
        backgroundColor: myBackgroundColor,
        appBar: AppBar(
          title: const Text("Profile",
              style: const TextStyle(fontSize: 26, letterSpacing: 1)),
          backgroundColor: myBackgroundColor,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: NotAuthentication());
  }
}
