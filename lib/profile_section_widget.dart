import 'package:flutter/material.dart';
import 'main.dart';
import 'profile_inner_widget.dart';

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
    var profile = homePageState.profileData[homePageState.selectedPageIndex];
    return new Expanded(
      child: InkWell(
        // padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        // onPressed: () {},
        onTap: () {
          if (homePageState.animPercentage == 100) {
            homePageState.animationController.reverse()
              ..whenComplete(() {
                homePageState.profileEnlarged = true;
              });
          } else {
            homePageState.animationController.forward()
              ..whenComplete(() {
                homePageState.profileEnlarged = true;
              });
          }
        },
        child: new Container(
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: new Radius.circular(30.0)),
              color: new Color(0xF5F5F5FF)),
          child: new Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
            child: new Column(
              children: <Widget>[
                Container(
                  height: 80.0,
                  width: double.infinity,
                  // color: Colors.red.shade100,
                  padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: new ClipRect(
                    // padding: new EdgeInsets.all(0.0),
                    // height: 10.0,
                    // color: Colors.red.shade100,
                    child: new Transform(
                      transform: new Matrix4.translationValues(
                          0.0,
                          50.0 * (1 - homePageState.opacityAnimation.value),
                          0.0),
                      // ..scale(1.0, homePageState.opacityAnimation.value),
                      alignment: Alignment.topCenter,
                      child: new Opacity(
                        opacity: homePageState.opacityAnimation.value,
                        child: Row(
                          children: <Widget>[
                            new Expanded(
                                child: new Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 10.0, 0.0, 10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                    profile.name,
                                    style: new TextStyle(
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1.2),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  new Text(
                                    '${profile.locationCountry}, ${profile.locationCity}',
                                    style: new TextStyle(
                                        color:
                                            Color.fromRGBO(124, 124, 124, 1.0)),
                                  )
                                ],
                              ),
                            )),
                            Container(
                              width: 130.0,
                              padding: new EdgeInsets.all(10.0),
                              child: Center(
                                child: new FollowButtonWidget(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                new ProfileInnerWidget(),
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

  final buttonMaxWidth = 130.0;
  final buttonMinWidth = 40.0;

  void resetFollowButton() {
    var profile = homePageState.profileData[homePageState.selectedPageIndex];

    if (profile.isFollowing) {
      // print('isFollowing');
      buttonAnimation = new Tween(
        begin: buttonMinWidth,
        end: buttonMaxWidth,
      ).animate(buttonAnimationController)
        ..addListener(() {
          setState(() {});
        });
    } else {
      // print('notFollowing');
      buttonAnimation = new Tween(
        begin: buttonMaxWidth,
        end: buttonMinWidth,
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
      begin: buttonMaxWidth,
      end: buttonMinWidth,
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

    return new Center(
      child: new Container(
        width: buttonMaxWidth,
        height: 30.0,
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
            height: 50.0,
            alignment: FractionalOffset.center,
            decoration: new BoxDecoration(
              border: new Border.all(
                color: borderColor,
                width: 2.0,
              ),
              color: buttonAnimation.value == buttonMaxWidth
                  ? Colors.transparent
                  : borderColor,
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
