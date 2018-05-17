import 'package:flutter/material.dart';
import 'main.dart';

class ImagePageWidget extends StatefulWidget {
  @override
  _ImagePageWidgetState createState() => new _ImagePageWidgetState();
}

class _ImagePageWidgetState extends State<ImagePageWidget> {
  Widget imageWidget(String asset) {
    return new ClipRect(
      child: Transform(
        transform: new Matrix4.translationValues(0.0, 0.0, 0.0)
          ..scale(homePageState.getZoomFactor()),
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        alignment: Alignment.topCenter,
        child: Image.asset(
          asset,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
          // scale: homePageState.getZoomFactor(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: double.infinity,
        child: new PageView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: homePageState.profileData.length,
          itemBuilder: (BuildContext context, int index) {
            return imageWidget(homePageState.profileData[index].strImagePath);
            // return new Container(
            //     transform: new Matrix4.translationValues(0.0, 0.0, 0.0)
            //       ..scale(homePageState.getZoomFactor()),
            //     color: index % 2 == 0
            //         ? Colors.red.shade100
            //         : Colors.blue.shade100);
          },
          onPageChanged: (int pageIndex) {
            homePageState.animatePageChange(pageIndex);
          },
        )
        // child: PageView(
        //   physics: AlwaysScrollableScrollPhysics(),
        //   onPageChanged: (int pageIndex) {
        //     _homePageState.animatePageChange();
        //   },
        //   children: <Widget>[
        //     imageWidget('assets/image1.jpg'),
        //     imageWidget('assets/image2.jpg'),
        //   ],
        // ),
        );
  }
}
