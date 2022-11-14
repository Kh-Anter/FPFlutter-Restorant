import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/controller/maincontroller.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key key}) : super(key: key);
  static const routeName = "/Favorite";

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  maincontroller favcontroller = Get.put(maincontroller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<maincontroller>(
        init: favcontroller,
        initState: (_) {},
        builder: (favcontroller) {
          favcontroller.getfavitem();
          return Scaffold(
            backgroundColor: myBackgroundColor,
            body: favcontroller.isload
                ? Center(child: CircularProgressIndicator())
                : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 2
                            )
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
                                          favcontroller.favoritelist[index].name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          favcontroller
                                              .favoritelist[index].price,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.orange),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          favcontroller.favoritelist[index].description,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    IconButton(onPressed: (){
                                      setState(() {
                                        favcontroller.deletefavitem(favcontroller.favoritelist[index].itemid,);
                                        favcontroller.getfavitem();
                                      });

                                    }, icon: Icon(Icons.delete)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(height: 10,),
                      itemCount: favcontroller.favoritelist.length,
                    ),
                  ),

                ],
              ),
            ),
          );
        });
  }
}
