import 'package:flutter/material.dart';
import 'profile_widget.dart';
import 'header_bottom_bar_widget.dart';

class BottomDataWidget extends StatefulWidget {
  @override
  _BottomDataWidgetState createState() => new _BottomDataWidgetState();
}

class _BottomDataWidgetState extends State<BottomDataWidget> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 350.0,
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
          ProfileWidget()
        ],
      ),
    );
  }
}
