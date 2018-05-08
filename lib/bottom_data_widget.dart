import 'package:flutter/material.dart';
import 'menu_widget.dart';

class BottomDataWidget extends StatefulWidget {
  @override
  _BottomDataWidgetState createState() => new _BottomDataWidgetState();
}

class _BottomDataWidgetState extends State<BottomDataWidget> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 350.0,
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [Colors.transparent, Colors.black])),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 100.0,
            width: double.infinity,
            color: Colors.transparent,
            child: HeaderBottomBar(),
          ),
          new Expanded(
            child: Container(
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: new Radius.circular(30.0)),
                  color: Colors.grey[300]),
              child: MenuWidget(),
            ),
          )
        ],
      ),
    );
  }
}

class HeaderBottomBar extends StatelessWidget {
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
