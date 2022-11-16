import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restorant/constants.dart';
import 'package:restorant/getx/orders_ctl.dart';
import 'package:restorant/size_config.dart';
import 'package:restorant/widgets/not_authentication.dart';
import 'package:restorant/widgets/orders.dart/history_orders.dart';
import 'package:restorant/widgets/orders.dart/upcomming_orders.dart';

class Orders extends StatefulWidget {
  Orders({Key key}) : super(key: key);
  static const routeName = "/Orders";

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  Widget selected_widget = UpcommingOrders();

  @override
  Widget build(BuildContext context) {
    var _size = SizeConfig(context);
    var currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: myBackgroundColor,
      appBar: AppBar(
        backgroundColor: myBackgroundColor,
        title: const Text("Orders"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: currentUser == null
          ? NotAuthentication()
          : Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: ToggleButton(
                    width: 300.0,
                    height: 60.0,
                    toggleBackgroundColor: Colors.white,
                    toggleBorderColor: (myBackgroundColor),
                    toggleColor: (myPrimaryColor),
                    activeTextColor: Colors.white,
                    inactiveTextColor: mySecondTextColor,
                    leftDescription: 'UPCOMMING',
                    rightDescription: 'HISTORY',
                    onLeftToggleActive: () {
                      print('left toggle activated');
                      setState(() {
                        selected_widget = UpcommingOrders();
                      });
                    },
                    onRightToggleActive: () {
                      print('right toggle activated');
                      setState(() {
                        selected_widget = HistoryOrders();
                      });
                    },
                  ),
                ),
              ]),
              Container(
                  child: selected_widget,
                  width: _size.getWidth,
                  height: _size.getHeight - 170)
            ]),
    );
  }
}

class ToggleButton extends StatefulWidget {
  final double width;
  final double height;

  final String leftDescription;
  final String rightDescription;

  final Color toggleColor;
  final Color toggleBackgroundColor;
  final Color toggleBorderColor;

  final Color inactiveTextColor;
  final Color activeTextColor;

  final double _leftToggleAlign = -1;
  final double _rightToggleAlign = 1;

  final VoidCallback onLeftToggleActive;
  final VoidCallback onRightToggleActive;

  const ToggleButton(
      {Key key,
      this.width,
      this.height,
      this.toggleBackgroundColor,
      this.toggleBorderColor,
      this.toggleColor,
      this.activeTextColor,
      this.inactiveTextColor,
      this.leftDescription,
      this.rightDescription,
      this.onLeftToggleActive,
      this.onRightToggleActive})
      : super(key: key);

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  double _toggleXAlign = -1;

  Color _leftDescriptionColor;
  Color _rightDescriptionColor;

  @override
  void initState() {
    super.initState();

    _leftDescriptionColor = widget.activeTextColor;
    _rightDescriptionColor = widget.inactiveTextColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.toggleBackgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
        border: Border.all(color: widget.toggleBorderColor),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(_toggleXAlign, 0),
            duration: Duration(milliseconds: 150),
            child: Container(
              width: widget.width * 0.5,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.toggleColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  _toggleXAlign = widget._leftToggleAlign;

                  _leftDescriptionColor = widget.activeTextColor;
                  _rightDescriptionColor = widget.inactiveTextColor;
                },
              );

              widget.onLeftToggleActive();
            },
            child: Align(
              alignment: Alignment(-1, 0),
              child: Container(
                width: widget.width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  widget.leftDescription,
                  style: TextStyle(
                      color: _leftDescriptionColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  _toggleXAlign = widget._rightToggleAlign;

                  _leftDescriptionColor = widget.inactiveTextColor;
                  _rightDescriptionColor = widget.activeTextColor;
                },
              );

              widget.onRightToggleActive();
            },
            child: Align(
              alignment: Alignment(1, 0),
              child: Container(
                width: widget.width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  widget.rightDescription,
                  style: TextStyle(
                      color: _rightDescriptionColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
