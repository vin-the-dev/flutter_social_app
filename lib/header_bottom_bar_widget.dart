import 'package:flutter/material.dart';
import 'main.dart';

class HeaderBottomBarWidget extends StatelessWidget {
  Widget textObjectList(
      String count, String option, CrossAxisAlignment aligment) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: aligment,
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
    var profile = homePageState.profileData[homePageState.selectedPageIndex];
    return new Container(
      padding: new EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          textObjectList(profile.numberofFollowers.toString(), 'followers',
              CrossAxisAlignment.start),
          textObjectList(profile.numberofPosts.toString(), 'posts',
              CrossAxisAlignment.center),
          textObjectList(
              profile.numberofLikes.toString(), 'likes', CrossAxisAlignment.end)
        ],
      ),
    );
  }
}
