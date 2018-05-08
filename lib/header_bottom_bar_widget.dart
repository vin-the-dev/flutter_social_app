import 'package:flutter/material.dart';

class HeaderBottomBarWidget extends StatelessWidget {
  Widget obj(String count, String option) {
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
    return new Container(
      padding: new EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          obj('123', 'Followers'),
          obj('265', 'Posts'),
          obj('50', 'Following')
        ],
      ),
    );
  }
}
