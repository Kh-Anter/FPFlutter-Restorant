import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/controller/maincontroller.dart';
import 'package:restorant/screens/item_details.dart';

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
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Dismissible(
                          onDismissed: (ind){
                            favcontroller.deletefavitem(favcontroller.favoritelist[index].itemid,);
                          },
                          key: Key('item ${index}'),
                          background: Container(child: Icon(Icons.delete)),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  itemDetails(favcontroller.favoritelist[index].name,
                                favcontroller.favoritelist[index].price,favcontroller.favoritelist[index].description,favcontroller.favoritelist[index].pic,
                              ),)
                              );

                            },
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
                                            Container(
                                              width: 200,
                                              child: Text(
                                                favcontroller.favoritelist[index].description,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
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
