import 'package:flutter/material.dart';
import 'package:payso/costants.dart';
import 'package:payso/model/intro_slider_model.dart';
import 'package:payso/widgets/slide_tile.dart';

class IntroSlider extends StatefulWidget {
  static const String id = 'intro_slider';
  @override
  _IntroSliderState createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: isCurrentPage ? 16.0 : 10.0,
      width: isCurrentPage ? 16.0 : 10.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? cPrimaryColor : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cIntroSliderBg,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 180,
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  slideIndex = index;
                });
              },
              children: <Widget>[
                SlideTile(
                  imagePath: mySLides[0].getImageAssetPath(),
                  title: mySLides[0].getTitle(),
                  desc: mySLides[0].getDesc(),
                ),
                SlideTile(
                  imagePath: mySLides[1].getImageAssetPath(),
                  title: mySLides[1].getTitle(),
                  desc: mySLides[1].getDesc(),
                ),
                SlideTile(
                  imagePath: mySLides[2].getImageAssetPath(),
                  title: mySLides[2].getTitle(),
                  desc: mySLides[2].getDesc(),
                ),
                SlideTile(
                  imagePath: mySLides[3].getImageAssetPath(),
                  title: mySLides[3].getTitle(),
                  desc: mySLides[3].getDesc(),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                for (int i = 0; i < 4; i++)
                  i == slideIndex
                      ? _buildPageIndicator(true)
                      : _buildPageIndicator(false),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              print("Get Started Now");
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: cPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(14),
                ),
              ),
              width: MediaQuery.of(context).size.width - 80,
              alignment: Alignment.center,
              child: Text(
                "GET STARTED NOW",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
              onTap: () {
                print("Get Started Now");
              },
              child: Text(
                'Skip to Login',
                style: TextStyle(
                  color: cPrimaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              )),
        ],
      ),
//        bottomSheet: slideIndex != 2
//            ? Container(
//                margin: EdgeInsets.symmetric(vertical: 16),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    FlatButton(
//                      onPressed: () {
//                        controller.animateToPage(2,
//                            duration: Duration(milliseconds: 400),
//                            curve: Curves.linear);
//                      },
//                      splashColor: Colors.blue[50],
//                      child: Text(
//                        "SKIP",
//                        style: TextStyle(
//                            color: Color(0xFF0074E4),
//                            fontWeight: FontWeight.w600),
//                      ),
//                    ),
//                    Container(
//                      child: Row(
//                        children: [
//                          for (int i = 0; i < 3; i++)
//                            i == slideIndex
//                                ? _buildPageIndicator(true)
//                                : _buildPageIndicator(false),
//                        ],
//                      ),
//                    ),
//                    FlatButton(
//                      onPressed: () {
//                        print("this is slideIndex: $slideIndex");
//                        controller.animateToPage(slideIndex + 1,
//                            duration: Duration(milliseconds: 500),
//                            curve: Curves.linear);
//                      },
//                      splashColor: Colors.blue[50],
//                      child: Text(
//                        "NEXT",
//                        style: TextStyle(
//                            color: Color(0xFF0074E4),
//                            fontWeight: FontWeight.w600),
//                      ),
//                    ),
//                  ],
//                ),
//              )
//            : InkWell(
//                onTap: () {
//                  print("Get Started Now");
//                },
//                child: Container(
//                  height: 60,
//                  color: Colors.blue,
//                  alignment: Alignment.center,
//                  child: Text(
//                    "GET STARTED NOW",
//                    style: TextStyle(
//                        color: Colors.white, fontWeight: FontWeight.w600),
//                  ),
//                ),
//              ),
    );
  }
}
