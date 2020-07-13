//
//
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
//import 'package:pizza/staticUi.dart';
//
//class FinalNavigation extends StatefulWidget {
//  double olat , olng, dlat,dlng;
//
//  FinalNavigation({this.olat,this.olng,this.dlat,this.dlng});
//
//  @override
//  _FinalNavigationState createState() => _FinalNavigationState();
//}
//
//class _FinalNavigationState extends State<FinalNavigation> {
//
//  MapboxNavigation _directions;
//
//  bool _arrived = false;
//
//
//  @override
//  void initState() {
//    super.initState();
//
//    _directions = MapboxNavigation(onRouteProgress: (arrived) async{
//
//
//
//      setState(() {
//        _arrived = arrived;
//      });
//      if(arrived) {
//        await _directions.finishNavigation();
//        Navigator.pushReplacement(
//          context,
//          MaterialPageRoute(
//            builder: (context) {
//              return StaticUi();
//            },
//          ),
//        );
//      }
//    });
//
//  }
//
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    _directions.startNavigation(
//        origin:   Location( name:'start',latitude: widget.olat, longitude: widget.olng)
//        ,
//        destination: Location(name: 'end',
//            latitude: widget.dlat, longitude: widget.dlng),
//
//        simulateRoute: true, units: VoiceUnits.metric
//
//    );
//
//  return Container();
//
//  }
//}