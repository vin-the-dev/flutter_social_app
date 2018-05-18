import 'package:flutter/material.dart';
import 'main.dart';

class PhotoArrayWidget extends StatefulWidget {
  @override
  _PhotoArrayWidgetState createState() => new _PhotoArrayWidgetState();
}

class _PhotoArrayWidgetState extends State<PhotoArrayWidget> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 120.0,
      // color: Colors.red.shade100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return new Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
            child: new Image.asset(
              homePageState.profileData[homePageState.selectedPageIndex].strImagePath,
              height: 150.0,
              width: 150.0,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
