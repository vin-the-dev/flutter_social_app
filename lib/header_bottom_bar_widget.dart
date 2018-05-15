import 'package:flutter/material.dart';
import 'main.dart';

class HeaderBottomBarWidget extends StatelessWidget {
  Widget textObjectList(String count, String option) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            count,
            style:
                new TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          new Text(option, style: new TextStyle(color: Colors.white))
        ]);
  }

  @override
  Widget build(BuildContext context) {
    var profile = homePageState.profileData[homePageState.pageIndex];
    return new Container(
      padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          textObjectList(profile.numberofFollowers.toString(), 'Followers'),
          textObjectList(profile.numberofPosts.toString(), 'Posts'),
          textObjectList(profile.numberofLikes.toString(), 'Likes')
        ],
      ),
    );
  }
}
