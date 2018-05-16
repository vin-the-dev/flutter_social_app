import 'package:flutter/material.dart';
import 'main.dart';

_ProfileSectionWidgetState profileSectionState =
    new _ProfileSectionWidgetState();

class ProfileSectionWidget extends StatefulWidget {
  @override
  _ProfileSectionWidgetState createState() => profileSectionState;
}

class _ProfileSectionWidgetState extends State<ProfileSectionWidget> {
  void resetProfileData() {
    followButtonWidgetState.resetFollowButton();
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
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
    );
  }
}

_FollowButtonWidgetState followButtonWidgetState =
    new _FollowButtonWidgetState();

class FollowButtonWidget extends StatefulWidget {
  @override
  _FollowButtonWidgetState createState() => followButtonWidgetState;
}

class _FollowButtonWidgetState extends State<FollowButtonWidget>
    with TickerProviderStateMixin {
  Animation buttonAnimation;
  AnimationController buttonAnimationController;

  void resetFollowButton() {
    var profile = homePageState.profileData[homePageState.selectedPageIndex];

    if (profile.isFollowing) {
      // print('isFollowing');
      buttonAnimation = new Tween(
        begin: 40.0,
        end: 120.0,
      ).animate(buttonAnimationController)
        ..addListener(() {
          setState(() {});
        });
    } else {
      // print('notFollowing');
      buttonAnimation = new Tween(
        begin: 120.0,
        end: 40.0,
      ).animate(buttonAnimationController)
        ..addListener(() {
          setState(() {});
        });
    }
    buttonAnimationController.reset();
    // setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonAnimationController = new AnimationController(
        duration: new Duration(milliseconds: 500), vsync: this);
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
    // buttonAnimationController.reset();
    // print(profile.isFollowing);

    return new Opacity(
      opacity: homePageState.opacityAnimation.value,
      child: new Container(
        width: 120.0,
        alignment: Alignment.centerRight,
        child: new InkWell(
          onTap: () {
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
                width: 2.0,
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
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.3,
                    ),
                  )
                : new Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}
