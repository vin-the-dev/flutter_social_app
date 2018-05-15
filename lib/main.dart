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

_HomePageState _homePageState = new _HomePageState();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _homePageState;
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  Animation opacityAnimation;
  AnimationController opacityAnimationController;
  bool _pageChanged;
  bool profileEnlarged;

  double animPercentage = 0.0;

  @override
  void initState() {
    _pageChanged = true;
    super.initState();
    profileEnlarged = false;
    animationController =
        AnimationController(duration: Duration(milliseconds: 250), vsync: this);
    opacityAnimationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    animation = Tween(begin: 0.0, end: 100.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    opacityAnimation =
        Tween(begin: 1.0, end: 0.0).animate(opacityAnimationController)
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

  double getHeightForBottomHeader() {
    return 0.0;
  }

  double getZoomFactor() {
    double curPer = ((1.3 - 1) / 100 * (100 - animPercentage)) + 1;

    return curPer;
  }

  void _handleDragUpdate(DragUpdateDetails details) {
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

  // void getVisibility() {
  //   print("getVisibility: $_pageChanged");
  //   // if (_pageChanged) {
  //   // opacityAnimationController.reverse();
  //   opacityAnimationController.repeat();
  //   // opacityAnimationController.forward();
  //   // } else {
  //   // }
  //   _pageChanged = !_pageChanged;
  //   setState(() {});
  // }

  void animatePageChange() {
    // print("getVisibility: $_pageChanged");
    // if (_pageChanged) {
    // opacityAnimationController.forward();
    // opacityAnimationController.reverse();
    opacityAnimationController.forward();
    // } else {
    // }
    // _pageChanged = !_pageChanged;
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // double heightValue() {
    //   double h = MediaQuery.of(context).size.height;
    //   double curPer = (((0.75 - 0.30) / 100 * animation.value) + 0.30);
    //   double h2 = curPer * h;
    //   return h2;
    // }

    return new Scaffold(
        body: new Container(
      child: new Stack(
        children: <Widget>[
          ImagePageWidget(),
          new Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
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
                  new GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onVerticalDragUpdate: _handleDragUpdate,
                    child: new Opacity(
                        opacity: opacityAnimation.value,
                        child: HeaderBottomBarWidget()),
                  ),
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
          )
        ],
      ),
    ));
  }
}

class ImagePageWidget extends StatefulWidget {
  @override
  _ImagePageWidgetState createState() => new _ImagePageWidgetState();
}

class _ImagePageWidgetState extends State<ImagePageWidget> {
  Widget imageWidget(String asset) {
    return Transform(
      transform: new Matrix4.translationValues(0.0, 0.0, 0.0)
        ..scale(_homePageState.getZoomFactor()),
      alignment: Alignment.topCenter,
      child: Image.asset(
        asset,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      child: PageView(
        physics: AlwaysScrollableScrollPhysics(),
        onPageChanged: (int pageIndex) {
          _homePageState.animatePageChange();
        },
        children: <Widget>[
          imageWidget('assets/image1.jpg'),
          imageWidget('assets/image2.jpg'),
        ],
      ),
    );
  }
}
