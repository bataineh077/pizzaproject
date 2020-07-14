import 'package:flutter/material.dart';

class BadReq extends StatefulWidget {
  @override
  _BadReqState createState() => _BadReqState();
}

class _BadReqState extends State<BadReq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: Colors.white,
    child: Center(child: Text('You are not authorized',
    style: TextStyle(fontSize: 25),),),
    ));
  }
}
