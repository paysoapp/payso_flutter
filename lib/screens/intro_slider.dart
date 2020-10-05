import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:payso/constants.dart';
import 'package:payso/model/intro_slider_model.dart';
import 'package:payso/screens/register_screen.dart';
import 'package:payso/widgets/slide_tile.dart';

import '../model/shared_preference_operations.dart';
import 'register_screen.dart';

class IntroSlider extends StatefulWidget {
  static const String id = 'intro_slider';
  @override
  _IntroSliderState createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;
  SharedPreferenceOperations _prefs = SharedPreferenceOperations();

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
    super.initState();
    changeLocation();
    mySLides = getSlides();
    controller = new PageController();
  }

  changeLocation() async {
    SharedPreferenceOperations _prefs = SharedPreferenceOperations();
    if (await _prefs.getSeen('Intro') == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RegisterScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cIntroSliderBg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 4; i++)
                  i == slideIndex
                      ? _buildPageIndicator(true)
                      : _buildPageIndicator(false),
              ],
            ),
          ),
          // SizedBox(
          //   height: 30,
          // ),
          InkWell(
            onTap: () async {
              if (slideIndex != 3) {
                print("Get Started Now");
                controller.animateToPage(
                  slideIndex + 1,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.linear,
                );
              } else {
                await _prefs.hasSeen('Intro');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              }
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
                mySLides[slideIndex].getButtonTitle(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ).tr(),
            ),
          ),
          // SizedBox(
          //   height: 20.0,
          // ),
          InkWell(
            onTap: () async {
              await _prefs.hasSeen('Intro');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            },
            child: Text(
              "skipLogin",
              style: TextStyle(
                color: cPrimaryColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ).tr(),
          ),
        ],
      ),
    );
  }
}
