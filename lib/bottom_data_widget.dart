import 'package:flutter/material.dart';
// import 'profile_widget.dart';
import 'header_bottom_bar_widget.dart';
import 'main.dart';

class BottomDataWidget extends StatefulWidget {
  @override
  _BottomDataWidgetState createState() => new _BottomDataWidgetState();
}

class _BottomDataWidgetState extends State<BottomDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: new Container(
        height: homePageState.getHeightForBottomBar(),
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
            new GestureDetector(
              behavior: HitTestBehavior.opaque,
              onVerticalDragUpdate: homePageState.handleDragUpdate,
              child: new Opacity(
                  opacity: homePageState.opacityAnimation.value,
                  child: HeaderBottomBarWidget()),
            ),
            new Expanded(
              child: MaterialButton(
                padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                onPressed: () {},
                child: new Container(
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: new Radius.circular(30.0)),
                        color: new Color(0xF5F5F5FF))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
