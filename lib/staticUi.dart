//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_place_picker/google_maps_place_picker.dart';
//
//import 'finalNavigation.dart';
//import 'navigation.dart';
//
//class StaticUi extends StatefulWidget {
//double lat,lng;
//StaticUi({this.lat,this.lng});
//  @override
//  _StaticUiState createState() => _StaticUiState();
//}
//
//class _StaticUiState extends State<StaticUi> {
//
//  TextStyle _style = TextStyle(fontSize: 18,fontWeight: FontWeight.w700);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Container(
//        child: Column(
//          children: <Widget>[
//            Container(height: MediaQuery.of(context).size.height/2,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/delev.jpg'),
//                 fit: BoxFit.cover
//               )
//             ),
//            ),
//            SizedBox(height: MediaQuery.of(context).size.height/10,),
//           Column(children: [
//             Text('Click on \'Request Orders\' Button \n',style: _style,),
//             Text('and choosing destination location \n',style: _style,),
//             Text('and start work',style: _style,)
//           ],)
//
//          ],
//
//
//        ),
//      ),
//      bottomSheet:  Padding(
//        padding: const EdgeInsets.all(8.0),
//        child: InkWell(hoverColor: Colors.orange,
//          highlightColor:   Colors.black87,
//
//          splashColor: Colors.black87,
//          splashFactory: InkSplash.splashFactory,
//          borderRadius:BorderRadius.all(Radius.circular(25)) ,
//          onTap: ()async{
//    Navigator.push(
//    context,
//    MaterialPageRoute(
//    builder: (context) {
//    return Navigation(lat: widget.lat,lng: widget.lng,);
//    },
//    ),
//    );
//          },
//          child: PhysicalModel(
//
//            color: Colors.orangeAccent.shade700.withOpacity(0.7),
//            borderRadius:  BorderRadius.all(Radius.circular(25)),
//
//            child: Container(
//              height: MediaQuery.of(context).size.height/6,
//
//              child: Center(
//                child: Text('Request Orders',
//                  style: TextStyle(color: Colors.white,fontSize: 30
//                      ,fontWeight: FontWeight.bold),),),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
