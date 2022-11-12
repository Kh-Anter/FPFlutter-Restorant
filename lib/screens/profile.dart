import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/screens/home.dart';

class profile extends StatelessWidget {
  static const routeName = "/Profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text(
          'My Profile',
          style: TextStyle(fontSize: 26),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ahmed Khalaf',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'AhmedKhalaf@gmail.com',
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[700]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.grey,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '01141980547',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey[700]),
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: 240,
                            child: Text(
                              'New valley-Elkharga-basatin - naser yassin',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[700]),
                            )),
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
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text(
                      'Orders',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
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
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text(
                      'Pending reviews',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
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
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text(
                      'Faq',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
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
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text(
                      'Help',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
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
            )
          ],
        ),
      ),
    );
  }
}
