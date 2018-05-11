import 'package:flutter/material.dart';

class ImagePageWidget extends StatefulWidget {
  @override
  _ImagePageWidgetState createState() => new _ImagePageWidgetState();
}

class _ImagePageWidgetState extends State<ImagePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: new Matrix4.translationValues(0.0, 0.0, 0.0)..scale(1.2, 1.2),
      child: PageView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Image.asset(
                'assets/image1.jpg',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitHeight,
              ),
              Image.asset(
                'assets/image2.jpg',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitHeight,
              )
            ],
          ),
        ],
      ),
    );
  }
}
