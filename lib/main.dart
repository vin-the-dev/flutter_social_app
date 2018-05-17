import 'package:flutter/material.dart';
// import 'bottom_data_widget.dart';
// import 'image_page_widget.dart';
import 'bottom_data_widget.dart';
import 'image_page_widget.dart';
import 'profile_section_widget.dart';
import 'menu_widget.dart';

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

_HomePageState homePageState = new _HomePageState();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => homePageState;
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  Animation opacityAnimation;
  AnimationController opacityAnimationController;
  bool profileEnlarged;

  double animPercentage = 0.0;
  var profileData = [];
  int selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    createMockData();
    profileEnlarged = false;
    animationController = AnimationController(
        duration: new Duration(milliseconds: 500), vsync: this);
    opacityAnimationController =
        AnimationController(duration: Duration(milliseconds: 150), vsync: this);
  }

  void createMockData() {
    profileData = [
      ProfileEntity(
          numberofFollowers: 300,
          numberofLikes: 200,
          numberofPosts: 100,
          strImagePath: 'assets/image1.jpg',
          name: 'Angelica Briggs',
          isFollowing: false,
          locationCity: 'Prais',
          locationCountry: 'France',
          tagLine:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
      ProfileEntity(
          numberofFollowers: 30,
          numberofLikes: 20,
          numberofPosts: 10,
          strImagePath: 'assets/image2.jpg',
          name: 'Lillian Bates',
          isFollowing: true,
          locationCity: 'New York',
          locationCountry: 'New York',
          tagLine: 'Tag Line'),
      ProfileEntity(
          numberofFollowers: 3,
          numberofLikes: 2,
          numberofPosts: 1,
          strImagePath: 'assets/image3.jpg',
          name: 'Mary Allison',
          isFollowing: false,
          locationCity: 'Hong Kong',
          locationCountry: 'China',
          tagLine: 'Tag Line'),
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animation = Tween(begin: 0.0, end: 100.0).animate(animationController)
      ..addListener(() {
        animPercentage = animation.value;
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
    double curPer = ((0.8 - 0.35) / 100 * animPercentage) + 0.35;
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

  void handleDragUpdate(DragUpdateDetails details) {
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

  void animatePageChange(int pageIndex) {
    // _bottomDataWidget.resetProfileData();
    opacityAnimationController.forward()
      ..whenCompleteOrCancel(() {
        this.selectedPageIndex = pageIndex;
        profileSectionState.resetProfileData();
        followButtonWidgetState.resetFollowButton();
        opacityAnimationController.reverse();
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      child: new Stack(
        children: <Widget>[
          new ImagePageWidget(),
          new BottomDataWidget(),
          new MenuWidget()
        ],
      ),
    ));
  }
}

class ProfileEntity {
  String strImagePath;
  int numberofFollowers;
  int numberofPosts;
  int numberofLikes;
  String name;
  String locationCountry;
  String locationCity;
  bool isFollowing;
  String tagLine;

  ProfileEntity(
      {this.strImagePath,
      this.numberofFollowers,
      this.numberofLikes,
      this.numberofPosts,
      this.locationCity,
      this.locationCountry,
      this.name,
      this.isFollowing,
      this.tagLine});
}
