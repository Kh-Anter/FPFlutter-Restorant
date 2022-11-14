import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/getx/featchData.dart';
import 'package:restorant/screens/home/home.dart';
import 'package:restorant/size_config.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final FeatchController controller = Get.put(FeatchController());

  @override
  Widget build(BuildContext context) {
    var items = controller.searchResult;
    var _size = SizeConfig(context);
    return Scaffold(
      backgroundColor: myBackgroundColor,
      appBar: AppBar(
        backgroundColor: myBackgroundColor,
        title: _buildSearchField(),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: controller.search_ctl.text.toString() == ""
          ? _emptyWidget(_size)
          : Container(
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                padding: const EdgeInsets.only(left: 5, right: 5),
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                itemCount: items.length,
                itemBuilder: (c, i) {
                  return Container(
                      alignment:
                          i == 1 ? Alignment.bottomCenter : Alignment.center,
                      child: Container(
                        height: _size.getProportionateScreenHeight(310.0),
                        width: (_size.getWidth - 40) / 2,
                        child: Stack(
                          alignment: Alignment.center,
                          fit: StackFit.expand,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          children: <Widget>[
                            Positioned(
                              top: 75,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 30),
                                      Text(items[i]["name"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      SizedBox(height: 10),
                                      Text(
                                          items[i]["price"].toString() + " L.E",
                                          style: TextStyle(
                                              color: myPrimaryColor,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold))
                                    ]),
                                width: (_size.getWidth - 50) / 2,
                                height:
                                    _size.getProportionateScreenHeight(212.0),
                              ),
                            ),
                            Positioned(
                              left: 25,
                              top: 10,
                              child: Container(
                                child: CircleAvatar(
                                  radius:
                                      _size.getProportionateScreenWidth(65.0),
                                  backgroundImage:
                                      AssetImage('assets/images/home/meal.jpg'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                },
                staggeredTileBuilder: (index) {
                  return StaggeredTile.count(1, index == 1 ? 1.9 : 1.4);
                },
              ),
            ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: controller.search_ctl,
      autofocus: true,
      decoration: const InputDecoration(
          fillColor: myBackgroundColor, border: InputBorder.none),
      style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      onChanged: (key) {
        setState(() {
          controller.search(key);
        });
      },
    );
  }

  Widget _emptyWidget(size) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.search,
          size: 200,
          color: mySecondTextColor,
        ),
        Text(
          "Item not found",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          width: size.getWidth / 1.5,
          child: Text(
            "Try searching the item with a different keyword.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: mySecondTextColor),
          ),
        ),
      ],
    ));
  }
}
