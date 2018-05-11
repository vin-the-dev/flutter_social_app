import 'package:flutter/material.dart';
// import 'bottom_data_widget.dart';
// import 'image_page_widget.dart';
import 'header_bottom_bar_widget.dart';

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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  bool profileEnlarged;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileEnlarged = false;
    animationController =
        AnimationController(duration: Duration(milliseconds: 250), vsync: this);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    animation = Tween(begin: 0, end: 1).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    double heightValue() {
      double h = MediaQuery.of(context).size.height;
      double curPer = (((0.75 - 0.30) / 100 * animation.value) + 0.30);
      double h2 = curPer * h;
      return h2;
    }

    return new Scaffold(
        body: new Container(
      child: new Stack(
        children: <Widget>[
          new ImagePageWidget(),
          new Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: heightValue(),
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
                  HeaderBottomBarWidget(),
                  new Expanded(
                    child: MaterialButton(
                      padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      onPressed: () {
                        if (profileEnlarged) {
                          animationController.reverse();
                          profileEnlarged = false;
                        } else {
                          animationController.forward();
                          profileEnlarged = true;
                        }
                      },
                      child: new Container(
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: new Radius.circular(30.0)),
                              color: Colors.grey[300])),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class ImagePageWidget extends StatelessWidget {
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
