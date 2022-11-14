import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/controller/maincontroller.dart';
import 'package:restorant/screens/home.dart';

class itemDetails extends StatelessWidget {
  maincontroller main = Get.put(maincontroller());
  String name;
  String price;
  String discription;
  String pic;
  itemDetails(this.name,this.price,this.discription,this.pic);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<maincontroller>(
        init: main,
        initState: (_) {},
    builder: (main) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      appBar: AppBar(
        backgroundColor: myBackgroundColor,
        title: Text('${name}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        leading: IconButton(
            onPressed: () => Get.off(HomeScreen()),
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Container(
                height: 260,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('assets/images/home/meal.jpg',),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('${name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                    Spacer(),
                    Text('${price} \$',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: myPrimaryColor),),

                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${discription}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.blue[700]),),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
                child: Row(
                  children: [
                    GestureDetector(
                    onTap:(){
                      main.setcarditem(name, price, discription, pic);
                    },

                      child: Container(
                        height: 50,width: 180,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Add To Card',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(width: 10,),
                            Icon(Icons.add_shopping_cart,color: Colors.white,)
                          ],
                        )),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        main.setfavitem(name, price, discription, pic);

                      },
                      child: Container(
                        height: 50,width: 180,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Add To Favorite',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(width: 10,),
                            Icon(Icons.favorite,color: Colors.white,)
                          ],
                        )),
                      ),
                    )

                  ],
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

