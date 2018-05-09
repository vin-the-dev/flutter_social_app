import 'package:flutter/material.dart';
import 'bottom_data_widget.dart';
import 'image_page_widget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      child: new Stack(
        children: <Widget>[
          ImagePageWidget(),
          new Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: BottomDataWidget(),
          )
        ],
      ),
    ));
  }
}
