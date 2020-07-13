import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:pizza/component/runnerCard.dart';

class Running extends StatefulWidget {
  @override
  _RunningState createState() => _RunningState();
}

class _RunningState extends State<Running> {


  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Running',style: TextStyle(
            fontWeight: FontWeight.w300),
      ),
      leading: IconButton(
        icon: Icon(OMIcons.home),
        onPressed: (){
          Navigator.pop(context);
        },
      ),

        actions: [
      IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: (){},
    ),
        ],
      ),
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [

           RunnerCardFirst(hight: height/1.1,
             icon1: OMIcons.call,
             icon2: Icons.chat_bubble_outline,
             name: 'Zack Anderson',
             subName: '0-50 Favors',
             address: '1222 Belven Street , 7866',
             addressNote: 'Leave items at the door',
             note: 'Please place items at the end of the driveway'
                 '\n thank you',
             secound: false,
             image: 'assets/person.png',
           ),

            RunnerCardFirst(hight: height*1.2,
              icon1: OMIcons.call,
              icon2: OMIcons.search,
              name: 'Panda Express',
              //subName: '0-50 Favors',
              address: 'Interstate 35, 78666',
              addressNote: 'Leave items at the door',
              note: 'Please place items at the end of the driveway'
                  '\n thank you',
              secound: true,
              image: 'assets/pin.png',
            ),
SizedBox(height: MediaQuery.of(context).size.height/5,
child: Expanded(child: FlatButton(
  onPressed: (){

  },
  child: Text('c'),
),),
)
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
  width: MediaQuery.of(context).size.width,
   height: MediaQuery.of(context).size.height/14,
          child: RaisedButton(
            onPressed: (){},
          color: Color(0xFF0097DC),
            child: Text('ARRIVED AT STORE',style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}
