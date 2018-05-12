import 'package:flutter/material.dart';
// import 'bottom_data_widget.dart';
import 'image_page_widget.dart';
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

  double animPercentage = 0.0;

  @override
  void initState() {
    super.initState();
    profileEnlarged = false;
    animationController =
        AnimationController(duration: Duration(milliseconds: 250), vsync: this);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    animation = Tween(begin: 0.0, end: 100.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });

    animPercentage = 0.0;
  }

  double getHeightForBottomBar() {
    double curPer = ((0.8 - 0.3) / 100 * animPercentage) + 0.3;
    double h = MediaQuery.of(context).size.height;
    return h * curPer;
  }

  double getZoomFactor() {
    double curPer = ((1.1 - 1) / 100 * (100 - animPercentage)) + 1;

    return curPer;
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    print(details.delta);
    print(details.globalPosition.dy);
    double h = MediaQuery.of(context).size.height;
    double startH = h * 0.3;
    double endH = h * 0.8;
    double curHeight = h - details.globalPosition.dy;
    if (curHeight > endH) {
      animPercentage = 100.0;
    } else if (curHeight < startH) {
      animPercentage = 0.0;
    } else {
      animPercentage = ((curHeight / h) - 0.3) * (100 / (0.8 - 0.3));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      child: new Stack(
        children: <Widget>[
          new Transform(
              transform: new Matrix4.translationValues(0.0, 0.0, 0.0)
                ..scale(getZoomFactor()),
              alignment: Alignment.topCenter,
              child: ImagePageWidget()),
          new Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: new GestureDetector(
              behavior: HitTestBehavior.opaque,
              onVerticalDragUpdate: _handleDragUpdate,
              child: new Container(
                height: getHeightForBottomBar(),
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
                          // if (profileEnlarged) {
                          //   animationController.reverse();
                          //   profileEnlarged = false;
                          // } else {
                          //   animationController.forward();
                          //   profileEnlarged = true;
                          // }
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
            ),
          )
        ],
      ),
    ));
  }
}
