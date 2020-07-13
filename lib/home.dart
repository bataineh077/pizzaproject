//import 'package:bottom_navy_bar/bottom_navy_bar.dart';
//import 'package:flutter/material.dart';
//import 'package:location/location.dart';
//import 'package:pizza/history.dart';
//import 'package:pizza/navigation.dart';
//
//
//
//class HomeAlt2 extends StatefulWidget {
//  double lat,lng;
//
//  HomeAlt2({this.lat,this.lng});
//  @override
//  _HomeAlt2State createState() =>
//      _HomeAlt2State();
//}
//
//
//class _HomeAlt2State extends State<HomeAlt2> {
//
//  int _currentIndex = 0;
//  PageController _pageController;
//
//
//  @override
//  void initState() {
//
//
//    // TODO: implement initState
//    super.initState();
//    _pageController = PageController();
//
//  }
//
//  @override
//  void dispose() {
//    _pageController.dispose();
//    super.dispose();
//  }
//
//
//
//
//
//
//  @override
//  Widget build(BuildContext context) {
//
//
//    // ds();
//
//    return Scaffold(
//      body: SizedBox.expand(
//        child: PageView(
//          physics: NeverScrollableScrollPhysics(),
//          controller: _pageController,
//          onPageChanged: (index) {
//            setState(() => _currentIndex = index);
//          },
//          children: <Widget>[
//          //  Navigation(lat: widget.lat,lng: widget.lng,),
//            History()
//            // BioRelativeList()
//          ],
//        ),
//      ),
//      bottomNavigationBar: BottomNavyBar(
//        backgroundColor: Colors.white10,
//
//        selectedIndex: _currentIndex,
//        onItemSelected: (index) {
//          setState(() => _currentIndex = index);
//          _pageController.jumpToPage(index);
//        },
//        items: <BottomNavyBarItem>[
//
//          BottomNavyBarItem(
//              inactiveColor: Colors.black87,
//              activeColor: Color(0xFFff5043),
//              title: Text('Navigation'),
//              icon: Icon(Icons.navigation)
//          ),
//          BottomNavyBarItem(
//              inactiveColor: Colors.black87,
//              activeColor: Color(0xFFff5043),
//              title: Text('History',style: TextStyle(fontSize: 12),),
//              icon: Icon(Icons.history)
//          ),
//
//
//
//        ],
//      ),
//    );
//  }
//
//}
//
////class _HomeAlt2State extends State<HomeAlt2> {
////  int pageIndex = 0;
////
////  List<Widget> pageList = <Widget>[
////    Home(),
////    Bio(),
////    BioList(),
////    BioRelativeList()
////  ];
////
////  @override
////  Widget build(BuildContext context) {
////    return Scaffold(
////      body: PageTransitionSwitcher(
////        transitionBuilder: (
////            Widget child,
////            Animation<double> animation,
////            Animation<double> secondaryAnimation,
////            ) {
////          return FadeThroughTransition(
////            animation: animation,
////            secondaryAnimation: secondaryAnimation,
////            child: child,
////          );
////        },
////        child: pageList[pageIndex],
////      ),
////      bottomNavigationBar: BottomNavigationBar(
////        currentIndex: pageIndex,
////        onTap: (int newValue) {
////          setState(() {
////            pageIndex = newValue;
////          });
////        },
////        items: const <BottomNavigationBarItem>[
////          BottomNavigationBarItem(
////            icon: Icon(Icons.computer),
////            title: Text('الرئيسية'),
////          ),
////          BottomNavigationBarItem(
////            icon: Icon(Icons.add),
////            title: Text('فحص جديد'),
////          ),
////          BottomNavigationBarItem(
////            icon: Icon(Icons.view_list),
////            title: Text('الفحوصات'),
////          ),
////          BottomNavigationBarItem(
////            icon: Icon(Icons.people),
////            title: Text('المرافقين'),
////          ),
////
////        ],
////      ),
////    );
////  }
////}