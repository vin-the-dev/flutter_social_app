import 'package:flutter/material.dart';
import 'menu_widget.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: Container(
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: new Radius.circular(30.0)),
            color: Colors.grey[300]),
        child: MenuWidget(),
      ),
    );
  }
}
