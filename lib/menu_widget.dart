import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Positioned(
          height: 100.0,
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: new Container(
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: new Radius.circular(30.0)),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.note),
                Icon(Icons.search),
                Icon(Icons.add_box),
                Icon(Icons.notifications),
                Icon(Icons.chat)
              ],
            ),
          ),
        )
      ],
    );
  }
}
