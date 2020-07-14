import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_mac/get_mac.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:pizza/newUi/addAdressUi.dart';
import 'package:pizza/newUi/running.dart';


class NewHome extends StatefulWidget {
  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {

  TextStyle tileColorText = TextStyle(color: Colors.white,fontSize: 14);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();





@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Current Favors',style: TextStyle(
          fontWeight: FontWeight.w300
        ),),
        leading: IconButton(
          onPressed: (){
           _scaffoldKey.currentState.openDrawer();

          },
          icon: Icon(Icons.sort,size: 28,),),

        actions: [
          IconButton(
            onPressed: (){
            },
            icon: Icon(OMIcons.settings),),
        ],
      ),

      drawer: Drawer(
        child: Container(
          color: Color(0xFF00A1DF),
          child: SafeArea(
            child: ListView(
              children: [
                ListTile(onTap: (){},hoverColor: Colors.white,focusColor: Colors.white,onLongPress: (){},
                  title: Text('Omar Terawi',
                    style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),),
                  leading: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      border: Border.all(color: Colors.white70,width: 2 ),
                     // color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage('assets/person.png')
                      )
                    ),
                  ),

                  subtitle: Text('View Profile',style: TextStyle(color: Colors.white54),),
                ),

                Divider(height: 5),
//TODO : ADD Address
                FlatButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AddAdressUi();
                        },
                      ),
                    );

                    },
                  splashColor: Colors.white70,
                  padding: EdgeInsets.all(0),
                  color: Color(0x00000000),
                 child: Row(
                   children: [
                     Expanded(
                       child: ListTile(
                         title: Text('Run',style: TextStyle(color: Colors.white , fontSize: 15),),
                         leading: Image.asset('assets/shield.png',height: 25,width: 25,color: Colors.white,)
                       ),
                     ),

                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 17),
                       child: Text('1 FAVOR',style: TextStyle(color: Color(0xFFd7c644),
                       fontWeight: FontWeight.w700),),
                     )
                   ],
                 ),
               ),


                FlatButton(
                  onPressed: (){print('good');},
                  splashColor: Colors.white70,
                  padding: EdgeInsets.all(0),
                  color: Color(0x00000000),
                  child: ListTile(
                    title: Text('Earning',style: TextStyle(color: Colors.white , fontSize: 15),),
                    leading: Image.asset('assets/money.png',height: 25,width: 25,color: Colors.white,)
                  ),
                ),

                FlatButton(
                  onPressed: (){print('good');},
                  splashColor: Colors.white70,
                  padding: EdgeInsets.all(0),
                  color: Color(0x00000000),
                  child: ListTile(
                    title: Text('Schedule',style: TextStyle(color: Colors.white , fontSize: 15),),
                    leading: Image.asset('assets/calendar.png',height: 25,width: 25,color: Colors.white,)
                  ),
                ),

                FlatButton(
                  onPressed: (){print('good');},
                  splashColor: Colors.white70,
                  padding: EdgeInsets.all(0),
                  color: Color(0x00000000),
                  child: ListTile(
                    title: Text('Help',style: TextStyle(color: Colors.white , fontSize: 15),),
                    leading: Image.asset('assets/help.png',height: 25,width: 25,color: Colors.white,)
                  ),
                ),

                FlatButton(
                  onPressed: (){print('good');},
                  splashColor: Colors.white70,
                  padding: EdgeInsets.all(0),
                  color: Color(0x00000000),
                  child: ListTile(
                    title: Text('Announcements',style: TextStyle(color: Colors.white , fontSize: 15),),
                    leading: Icon(OMIcons.announcement,color: Colors.white,),
                  ),
                ),

                FlatButton(
                  onPressed: (){print('good');},
                  splashColor: Colors.white70,
padding: EdgeInsets.all(0),
                  color: Color(0x00000000),
                  child: ListTile(
                    title: Text('Settings',style: TextStyle(color: Colors.white , fontSize: 15),),
                    leading: Icon(OMIcons.settings,color: Colors.white,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: ListView(
        physics: BouncingScrollPhysics(),

        children: [
          Container(
            //TODO changable
            height: MediaQuery.of(context).size.height/5.5,

              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.symmetric(vertical: BorderSide(color: Colors.grey.shade300))
              ),
            child: Column(
              children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween
                ,children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color: Color(0xFF00A1DF),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/food.jpg')
                            )
                          ),
                        ),
                      ) ,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(text: 'Panda Express \n',
                                  style: TextStyle(color: Colors.black87,fontSize: 17),
                                ),

                                TextSpan(text: 'Running',
                                  style: TextStyle(color: Color(0xFF00A1DF),height: 1.7,
                                      fontSize: 14),
                                ),
                              ]
                          ),
                        ),
                      ),
                    ],
                  ),


                  IconButton(
                    onPressed: (){

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Running();
                          },
                        ),
                      );


                    },
                    icon: Icon(Icons.arrow_forward_ios,size: 20,),
                    color: Color(0xFF00A1DF),
                  )

                ],),
                Divider(color: Colors.grey,endIndent: 16,indent: 16,height: 3,),

                Padding(
                  padding: const EdgeInsets.only( top: 16,right: 11,left: 11),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                  ,children: [
                    Text('for Zack A.',
                      style: TextStyle(color: Colors.grey),),
                    Text('Assigned Just Now',
                      style: TextStyle(color: Colors.grey),),
                  ],),
                )
              ],
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height/1.55,)
        ],
      ),
      bottomSheet: PhysicalModel(elevation: 15,shadowColor: Colors.grey,
        color: Colors.white,
        child: Container(
          height: MediaQuery.of(context).size.height/8.2,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Image.asset('assets/chat.png',height: 55,width: 55,fit: BoxFit.cover,),
               Padding(
                 padding: const EdgeInsets.only(right: 63),
                 child: RichText(
                   text: TextSpan(
                       children: [
                         TextSpan(text: 'Runner Support \n',
                           style: TextStyle(color: Color(0xFF0097DC).withOpacity(0.75),fontSize: 16),
                         ),

                         TextSpan(text: 'Here to help!',
                           style: TextStyle(color: Colors.grey,height: 1.7,fontSize: 10,
                           ),
                         ),
                       ]
                   ),
                 ),
               ),

               Image.asset('assets/phone.png',height: 45,width: 45,fit: BoxFit.cover,),
             ],
           ),
        ),
      ),
    );
  }
}
