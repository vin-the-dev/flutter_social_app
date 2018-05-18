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
            child: new Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new IconButton(
                    icon: Icon(Icons.dashboard),
                    onPressed: () {},
                  ),
                  new Center(
                    child: new IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.red.shade600,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  new Center(
                    child: new DecoratedBox(
                      decoration: new BoxDecoration(boxShadow: [
                        new BoxShadow(
                            color: Colors.red.shade100,
                            blurRadius: 50.0,
                            spreadRadius: -1.0,
                            offset: new Offset(0.0, 10.0))
                      ]),
                      child: new IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.red,
                          size: 40.0,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  new IconButton(
                    icon: Icon(Icons.notifications_none),
                    onPressed: () {},
                  ),
                  new IconButton(
                    icon: Icon(Icons.chat_bubble_outline),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
