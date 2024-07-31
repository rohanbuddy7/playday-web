import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'mixpanel/mixpanel_import_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  PageController? _pageController = null;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobileView = MediaQuery.of(context).size.width < 600;

    return MaterialApp(
      color: Color(0xFFFFFFFF),
      theme: ThemeData.light().copyWith(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'poppins',
            ),
      ),
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Color(0xFFFFFFFF),
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: isMobileView ? MainAxisAlignment.center : MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/app-icon.png',
                                  // Replace with your app icon path
                                  width: 200,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ))
                          ],
                        ),
                      )),
                  SizedBox(height: 20),
                  Visibility(
                    visible: isMobileView?false:true,
                      child: downloadContainers(isMobileView) ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              color: Color(0xFFFFFFFF),
              child:
                  SingleChildScrollView(
                child: Column(
                  children: [
                    Visibility(
                        visible: isMobileView?true:false,
                        child: downloadContainers(isMobileView) ),
                    Container(
                      height: 4,
                    ),
                    buildPage(0, isMobileView),
                    Container(
                      height: 4,
                    ),
                    buildPage(1, isMobileView),
                    Container(
                      height: 4,
                    ),
                    buildPage(2, isMobileView),
                    Container(
                      height: 4,
                    ),
                    Visibility(
                      visible: isMobileView ? true : false,
                        child: Container(
                          padding: EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              contacts(),
                              Padding(padding: EdgeInsets.all(10),
                              child: copyright(),)
                            ],
                          ),
                        )
                    )
                  ],
                ),),
            )),
            Visibility(
              visible: isMobileView ? false : true,
              child: Container(
                color: Color(0xFFFFFFFF),
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    contacts(),
                    copyright()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  contacts(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            launchPrivacy();
          },
          child: Text(
            'Privacy',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            MixpanelController.trackHelpClick();
            launchEmail();
          },
          child: Text(
            'Help & Support',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            MixpanelController.trackContactClick();
            launchEmail();
          },
          child: Text(
            'Contact',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  copyright(){
    return const Text(
      '© 2024 Tribe7 Prod',
      style: TextStyle(
        color: Colors.black,
      ),
    );
  }

  Widget header(bool isMobileView){
    if(isMobileView){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset(
                'assets/images/app-icon.png',
                // Replace with your app icon path
                width: 200,
                height: 50,
                fit: BoxFit.cover,
              ),
            )
          ], );
    } else {
      return Expanded(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/app-icon.png',
                      // Replace with your app icon path
                      width: 200,
                      height: 50,
                      fit: BoxFit.cover,
                    ))
              ],
            ),
          ));
    }
  }

  Widget downloadContainers(bool isMobileView){
    return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Row(
            mainAxisAlignment: isMobileView ? MainAxisAlignment.center : MainAxisAlignment.end,
            children: [
              InkWell(
                child: Column(
                  children: [
                    Container(
                      height: 5,
                    ),
                    Image.asset(
                        'assets/images/ic_download_android.jpg',
                        fit: BoxFit.fitWidth, width: isMobileView ? 150 : 200
                    )
                  ],
                ),
                onTap: () {
                  launchAndroid();
                },
              ),
              InkWell(
                child: Image.asset(
                    'assets/images/ic_download_ios.jpg',
                    fit: BoxFit.fitWidth,  width: isMobileView ? 150 : 200
                ),
                onTap: () {
                  launchiOS();
                },
              )
            ],
          ),
        ));
  }

  Widget buildPage(int pageIndex, bool isMobileView) {
    var img = isMobileView ? "assets/images/img_1_mob.png" : "assets/images/img_1.png";
    if (pageIndex == 0) {
      img = isMobileView ? "assets/images/img_1_mob.png" : "assets/images/img_1.png";
    } else if (pageIndex == 1) {
      img = isMobileView ? "assets/images/img_2_mob.png" : "assets/images/img_2.png";
    } else if (pageIndex == 2) {
      img = isMobileView ? "assets/images/img_3_mob.png" : "assets/images/img_3.png";
    }
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset(
            img,
            fit: BoxFit.fitWidth,
            width: 1000,
          )
        ],
      ),
    );
  }

  void launchAndroid() async {
    MixpanelController.trackAndroidClick();
    const url =
        "https://play.google.com/store/apps/details?id=com.rohans.playday&hl=en";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchiOS() async {
    MixpanelController.trackIosClick();
    const url = "https://apps.apple.com/app/id6499083992";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchPrivacy() async {
    MixpanelController.trackPrivacyClick();
    const url = "https://sites.google.com/view/playdate-privacy-policy/home";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'dev@playday.club'
    );

    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch $emailUri';
    }
  }


}
