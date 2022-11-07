import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/size_config.dart';
import 'package:restorant/widgets/Auth/login.dart';
import 'package:restorant/widgets/Auth/signup.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.grey[500],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Foodie',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2),
                          ),
                          Text(
                            '.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                      title: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )),
                  ListTile(
                      title: Row(
                    children: [
                      Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Orders',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )),
                  ListTile(
                      title: Row(
                    children: [
                      Icon(
                        Icons.local_offer_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Offer and promo',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )),
                  ListTile(
                      title: Row(
                    children: [
                      Icon(
                        Icons.privacy_tip_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Privacy Policy',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )),
                  ListTile(
                      title: Row(
                    children: [
                      Icon(
                        Icons.security,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Security',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )),
                ],
              )),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Delicious Food For you',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  prefixIcon: Icon(Icons.search,size: 25,),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1, color: Colors.black))),

            ),
          ),
          Container(
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
              SizedBox(height: 20.0),
              DefaultTabController(
                  length: 4, // length of tabs
                  initialIndex: 0,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                    Container(
                      child: TabBar(
                        labelColor: Colors.deepOrange,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(text: 'Food'),
                          Tab(text: 'Drink'),
                          Tab(text: 'Snacks'),
                          Tab(text: 'Sandwich'),
                        ],
                      ),
                    ),
                    Container(
                        height: 450, //height of TabBarView
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.1),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TabBarView(children: <Widget>[
                            Container(
                              height: 450,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 250,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.maxFinite,
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  radius: 80,
                                                  backgroundImage: AssetImage('assets/images/home/meal.jpg'),
                                                ),
                                                SizedBox(height: 10,),
                                                Text('Maxican Pizza',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                                SizedBox(height: 10,),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                                  child: Text('#1,900', style: TextStyle(color: Colors.deepOrange,fontSize: 24),),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                separatorBuilder: (context, index)=>SizedBox(width: 10,),
                                itemCount: 5,
                              ),
                            ),
                            Container(
                              height: 450,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.maxFinite,
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  radius: 80,
                                                  backgroundImage: AssetImage('assets/images/home/pep.jpeg'),
                                                ),
                                                SizedBox(height: 10,),
                                                Text('Maxican Pizza',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                                SizedBox(height: 10,),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                                  child: Text('#1,900', style: TextStyle(color: Colors.deepOrange,fontSize: 24),),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                separatorBuilder: (context, index)=>SizedBox(width: 10,),
                                itemCount: 5,
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text('Display Tab 3', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text('Display Tab 4', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ]),
                        )
                    )
                  ])
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:Colors.white,
        selectedItemColor: Colors.orange,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap:(index){
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(IconData(0xf737, fontFamily: 'MaterialIcons')),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.timelapse),
            label: "",
          ),
        ],

      ),
    );
  }
}
