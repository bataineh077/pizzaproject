import 'dart:io';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pizza/staticUi.dart';

import 'component/authApi.dart';
import 'home.dart';
import 'newUi/badReq.dart';
import 'newUi/newHome.dart';
import 'newUi/running.dart';


//Location location = new Location();

//bool _serviceEnabled;
//PermissionStatus _permissionGranted;
//LocationData _locationData;
//
//Future<void> permission1()async{
//  _serviceEnabled = await location.serviceEnabled();
//  if (!_serviceEnabled) {
//    _serviceEnabled = await location.requestService();
//    if (!_serviceEnabled) {
//      return;
//    }
//  }
//}
//
//Future<void> permission2()async{
//  _permissionGranted = await location.hasPermission();
//  if (_permissionGranted == PermissionStatus.denied) {
//    _permissionGranted = await location.requestPermission();
//    if (_permissionGranted != PermissionStatus.granted) {
//      return;
//    }
//  }
//}

String drawerName;

 Future<String> get localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

 Future<File> get localFile async {
  final path = await localPath;
  return File('$path/text.txt');
}

Future<String> readFile() async {
  try {
    final file = await localFile;

     String content = await file.readAsString();
     return content;
  } catch (e) {
  //  return '';
  }
}
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

//  permission1().then((value) {
//    permission2().then((value)async {
//
//    } );
//  });
//  _locationData = await location.getLocation();
//print(_locationData);



//  AuthApi.checkLimit().then((value) {
//    if(value){
//
//    }
//    else {
//
//      return runApp(MaterialApp(
//          debugShowCheckedModeBanner: false,
//      // HomeAlt2(lat: _locationData.latitude,lng: _locationData.longitude,),
//      // StaticUi(lat:_locationData.latitude ,lng:_locationData.longitude ,)
//          home:BadReq()
//      ));
//
//    }
//  });
  readFile().then((value) {
        print(value);
    return runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        // HomeAlt2(lat: _locationData.latitude,lng: _locationData.longitude,),
        // StaticUi(lat:_locationData.latitude ,lng:_locationData.longitude ,)
        home:value==null?EnterName():NewHome(name: value.trim(),)
    ));
  });

}

