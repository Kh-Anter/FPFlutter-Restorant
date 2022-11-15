import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/controller/maincontroller.dart';
import 'package:restorant/screens/home/home.dart';
import 'package:restorant/size_config.dart';

class itemDetails extends StatelessWidget {
  maincontroller main = Get.put(maincontroller());
  String name;
  String price;
  String discription;
  String pic;
  itemDetails(this.name, this.price, this.discription, this.pic);

  @override
  Widget build(BuildContext context) {
    var _size = SizeConfig(context);
    return GetBuilder<maincontroller>(
        init: main,
        initState: (_) {},
        builder: (main) {
          return Scaffold(
            backgroundColor: myBackgroundColor,
            appBar: AppBar(
              backgroundColor: myBackgroundColor,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        main.setfavitem(name, price, discription, pic);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.grey,
                      )),
                )
              ],
              leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back_ios)),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: CircleAvatar(
                        radius: 120,
                        backgroundImage:
                            AssetImage('assets/images/home/meal.jpg'),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 25,
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${name}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${price} \$',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: myPrimaryColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Delivery info',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Deliver in two works Day from 8am to 8pm',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.grey[700]),
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
                          'Discription',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              '${discription}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.grey[700]),
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 1,
                            ),
                            width: _size.getWidth - 50,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20),
                      child: GestureDetector(
                        onTap: () {
                          main.setcarditem(name, price, discription, pic);
                        },
                        child: Container(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                              color: myPrimaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add To Card',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                              )
                            ],
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
