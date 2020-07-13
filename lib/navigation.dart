//
//import 'dart:math';
//
//import 'package:faker/faker.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
//import 'package:giffy_dialog/giffy_dialog.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_place_picker/google_maps_place_picker.dart';
//
//import 'finalNavigation.dart';
//
//
//class Navigation extends StatefulWidget {
//double lat,lng;
//  Navigation({this.lat,this.lng});
//
//  @override
//  _NavigationState createState() => _NavigationState();
//}
//
//class _NavigationState extends State<Navigation> {
//  MapboxNavigation _directions;
//  var rng = new Random();
//  var meals = ['mansaf', 'batata', 'talal', 'maglobeh','tcha3atcheel','kabseh','oozy'];
//
//  @override
//  Widget build(BuildContext context) {
//
//    print('${widget.lng}');
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Pick Destination'),
//        centerTitle: true,
//        backgroundColor: Colors.orangeAccent.shade200,
//      ),
//        body: SafeArea(
//          child: PlacePicker(automaticallyImplyAppBarLeading: false,
//
//            apiKey: 'AIzaSyBkKBhUCxVA2uTJoIHu_Xm2qdpZh4BizE4',
//            initialPosition: LatLng(widget.lat,widget.lng),
//            useCurrentLocation: true,
//            //usePlaceDetailSearch: true,
//
//            onPlacePicked: (result) {
//
//              showDialog(
//                  context: context,builder: (_) => AssetGiffyDialog(
//                image: Image.asset('assets/del2.jpg'),
//                title: Text('Order #00${rng.nextInt(17556).toString()}',
//                  style: TextStyle(
//                      fontSize: 22.0, fontWeight: FontWeight.w600),
//                ),
//                description: Text.rich(
//                TextSpan(
//                  text: 'Name : ${faker.person.name()}\n'
//                      'Items : ${meals[rng.nextInt(meals.length-1)]}\n'
//                      '#Items : ${rng.nextInt(10).abs().toString()}'
//                )
//                ),
//
//                entryAnimation: EntryAnimation.BOTTOM,
//              buttonOkText: Text('Accept'),
//                onOkButtonPressed: () {
//                                      return Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) {
//                          return FinalNavigation(olat: widget.lat,olng: widget.lng,
//                          dlat: result.geometry.location.lat,
//                            dlng: result.geometry.location.lng,);
//                        },
//                      ),
//                    );
//
//                },
//              ) );
//
//
//            },
//
//          ),
//        ));
//  }
//
//}
