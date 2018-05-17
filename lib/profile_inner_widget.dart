import 'package:flutter/material.dart';
import 'main.dart';
import 'photo_array_widget.dart';

class ProfileInnerWidget extends StatefulWidget {
  @override
  _ProfileInnerWidgetState createState() => new _ProfileInnerWidgetState();
}

class _ProfileInnerWidgetState extends State<ProfileInnerWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: homePageState.animPercentage == 0
            ? null
            : new Opacity(
                opacity: homePageState.animPercentage / 100.0,
                child: Container(
                  // color: Colors.lightGreen,
                  padding: new EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                          homePageState
                              .profileData[homePageState.selectedPageIndex]
                              .tagLine,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 15.0,
                              color: new Color.fromRGBO(124, 124, 124, 1.0))),
                      new SizedBox(
                        height: 10.0,
                      ),
                      new Text('Photos',
                          style: new TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15.0)),
                      new SizedBox(
                        height: 10.0,
                      ),
                      PhotoArrayWidget(),
                    ],
                  ),
                ),
              ));
  }
}
