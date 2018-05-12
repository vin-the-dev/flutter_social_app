import 'package:flutter/material.dart';
// import 'menu_widget.dart';
import 'package:flutter/animation.dart';

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => new _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: MaterialButton(
        height: animation.value,
        padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        onPressed: () {
          print('object');
          animationController.forward();
        },
        child: Container(
            width: double.infinity,
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: new Radius.circular(30.0)),
                color: Colors.grey[300]),
            child: new Center(
              child: new MaterialButton(
                color: Colors.lightBlue,
                onPressed: () {
                  print('innner object');
                },
              ),
            )),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
