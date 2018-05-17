import 'package:flutter/material.dart';
// import 'profile_widget.dart';
import 'header_bottom_bar_widget.dart';
import 'main.dart';
import 'profile_section_widget.dart';

class BottomDataWidget extends StatefulWidget {
  @override
  _BottomDataWidgetState createState() => new _BottomDataWidgetState();
}

class _BottomDataWidgetState extends State<BottomDataWidget> {
  void resetProfileData() {
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('dichangedependices');
  }

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
              // onVerticalDragUpdate: homePageState.handleDragUpdate,
              child: new Opacity(
                  opacity: homePageState.opacityAnimation.value,
                  child: HeaderBottomBarWidget()),
            ),
            new ProfileSectionWidget()
          ],
        ),
      ),
    );
  }
}
