import 'package:flutter/material.dart';
// import 'profile_widget.dart';
import 'header_bottom_bar_widget.dart';
import 'main.dart';

class BottomDataWidget extends StatefulWidget {
  @override
  _BottomDataWidgetState createState() => new _BottomDataWidgetState();
}

class _BottomDataWidgetState extends State<BottomDataWidget> {
  void resetProfileData() {
    setState(() {});
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
                      color: new Color(0xF5F5F5FF)),
                  child: new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Column(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          color: Colors.green,
                          width: double.infinity,
                          child: Row(
                            children: <Widget>[
                              new Expanded(
                                  child: Container(
                                child: null, //Name and place
                              )),
                              Container(
                                width: 150.0,
                                // color: Colors.grey,
                                padding: new EdgeInsets.all(10.0),
                                child: Center(
                                  child: new FollowButtonWidget(),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 50.0,
                          color: Colors.lightBlue,
                        ),
                        new Expanded(
                            child: Container(
                          color: Colors.lightGreen,
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FollowButtonWidget extends StatefulWidget {
  @override
  _FollowButtonWidgetState createState() => new _FollowButtonWidgetState();
}

class _FollowButtonWidgetState extends State<FollowButtonWidget>
    with TickerProviderStateMixin {
  Animation buttonAnimation;
  AnimationController buttonAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonAnimationController = new AnimationController(
        duration: new Duration(milliseconds: 400), vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    buttonAnimation = new Tween(
      begin: 120.0,
      end: 40.0,
    ).animate(buttonAnimationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    var borderColor = const Color.fromRGBO(247, 64, 106, 1.0);
    return new Container(
      width: 120.0,
      alignment: Alignment.centerRight,
      child: new InkWell(
        onTap: () {
          print('Follow button tapped');
          buttonAnimationController.forward()
            ..whenComplete(() {
              // buttonAnimationController.reverse();
            });
        },
        child: new Container(
          width: buttonAnimation.value,
          height: 60.0,
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration(
            border: new Border.all(
              color: borderColor,
              width: 1.0,
            ),
            color: buttonAnimation.value == 120 ? Colors.white : borderColor,
            borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
          ),
          child: buttonAnimation.value > 75
              ? new Text(
                  "FOLLOW",
                  style: new TextStyle(
                    color: borderColor,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                )
              : new Icon(
                  Icons.person,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
