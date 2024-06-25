import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
  int _totalPages = 5;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
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
                                )
                            )
                          ],
                        ),
                      )),
                  SizedBox(height: 20),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Row(
                    children: [
                      InkWell(
                        child: Column(
                          children: [
                            Container(height: 5,),
                            Image.asset(
                              'assets/images/ic_download_android.jpg',
                              // Replace with your app icon path
                              width: 200,
                              fit: BoxFit.fitWidth,
                            )
                          ],
                        ),
                        onTap: (){
                          launchAndroid();
                        },
                      ),
                      InkWell(
                        child: Image.asset(
                          'assets/images/ic_download_ios.jpg',
                          // Replace with your app icon path
                          width: 200,
                          fit: BoxFit.fitWidth,),
                        onTap: (){},
                      )
                    ],
                  ),),
                ],
              ),
            ),
            Expanded(
                child: Container(
                  color: Color(0xFFFFFFFF),
                  child:
                  /*GestureDetector(
                    onVerticalDragUpdate: (details) {
                      if (details.delta.dy > 10 && _currentPage < _totalPages - 1) {
                        // User swiped up, load the next page
                        setState(() {
                          _currentPage++;
                        });
                        // Animate to the next page
                        _pageController?.animateToPage(
                          _currentPage,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _totalPages,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return buildPage(index);
                      },
                    ),
                  )*/
                  SingleChildScrollView(
                    child: Column(
                  children: [
                    buildPage(0),
                    Container(height: 5,),
                    buildPage(1),
                    Container(height: 5,),
                    buildPage(2),
                    Container(height: 5,),
                  ],
                ),
                  ),
            )),
            Container(
              color: Color(0xFFFFFFFF),
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          launchPrivacy();
                        },
                        child: Text('Privacy',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '© 2024 Tribe7 Prod',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage(int pageIndex) {
    var img = "assets/images/img_1.png";
    if(pageIndex==0){
      img = "assets/images/img_1.png";
    } else if(pageIndex==1){
      img = "assets/images/img_2.png";
    } else if(pageIndex==2){
      img = "assets/images/img_3.png";
    }
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset(img,
            fit: BoxFit.fitWidth,
            width: 1000,)
        ],
      ),
    );
  }

  void launchAndroid() async {
    const url = "https://play.google.com/store/apps/details?id=com.rohans.playday&hl=en";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchiOS() async {
    const url = "";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchPrivacy() async {
    const url = "https://sites.google.com/view/playdate-privacy-policy/home";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
