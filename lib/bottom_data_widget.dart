import 'package:flutter/material.dart';
// import 'profile_widget.dart';
import 'header_bottom_bar_widget.dart';
import 'package:flutter/animation.dart';

class BottomDataWidget extends StatefulWidget {
  @override
  _BottomDataWidgetState createState() => new _BottomDataWidgetState();
}

class _BottomDataWidgetState extends State<BottomDataWidget>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  bool profileEnlarged;

  @override
  void initState() {
    super.initState();
    profileEnlarged = false;
    animationController =
        AnimationController(duration: Duration(milliseconds: 250), vsync: this);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    double h = MediaQuery.of(context).size.height;

    animation =
        Tween(begin: h * 0.30, end: h * 0.75).animate(animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: animation.value,
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [Colors.transparent, Colors.black])),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          HeaderBottomBarWidget(),
          new Expanded(
            child: MaterialButton(
              padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              onPressed: () {
                if (profileEnlarged) {
                  animationController.reverse();
                  profileEnlarged = false;
                } else {
                  animationController.forward();
                  profileEnlarged = true;
                }
              },
              child: new Container(
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: new Radius.circular(30.0)),
                      color: Colors.grey[300])),
            ),
          )
        ],
      ),
    );
  }
}
