import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Positioned(
          height: 60.0,
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
                Icon(
                  Icons.search,
                  color: Colors.red.shade600,
                ),
                new DecoratedBox(
                  decoration: new BoxDecoration(boxShadow: [
                    new BoxShadow(
                        color: Colors.red.shade100,
                        blurRadius: 50.0,
                        spreadRadius: -1.0,
                        offset: new Offset(0.0, 10.0))
                  ]),
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.red,
                    size: 50.0,
                  ),
                ),
                Icon(Icons.notifications_none),
                Icon(Icons.chat_bubble_outline)
              ],
            ),
          ),
        )
      ],
    );
  }
}
