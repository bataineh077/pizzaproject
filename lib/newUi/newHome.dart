import 'dart:io';
import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pizza/component/addressUsers.dart';
import 'package:pizza/component/dataRes&Cus.dart';
import 'package:pizza/component/foodMenu.dart';
import 'package:pizza/newUi/addAdressUi.dart';
import 'package:pizza/newUi/running.dart';

import 'badReq.dart';


class NewHome extends StatefulWidget {

  String name;
  NewHome({this.name});
  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {

  TextStyle tileColorText = TextStyle(color: Colors.white,fontSize: 14);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


String RestName , Restaddress , user =". .",
  userAddress,orders = '';


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
                  title: Text('${widget.name}',
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
                  onLongPress: (){
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
                  onLongPress: (){

                    _showDialog();

                  },
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
                    leading: Image.asset('assets/shout.png',height: 25,width: 25,color: Colors.white,)
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
          RestName==null?Text(''):
          GestureDetector(
            onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Running(address: Restaddress,resturantName: RestName,user: user,
                      orders: orders,userAddress: userAddress,
                    );
                  },
                ),
              );

            },
            child: Container(
              //TODO changable
            //  height: MediaQuery.of(context).size.height/5.5,

                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.symmetric(vertical: BorderSide(color: Colors.grey.shade300))
                ),
              child: Wrap(
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
                                  TextSpan(text: '${RestName} \n',
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
                              return Running(address: Restaddress,resturantName: RestName,user: user,
                              orders: orders,userAddress: userAddress,
                              );
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
                    padding: const EdgeInsets.only( top: 16,right: 11,left: 11,bottom: 16),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween
                    ,children: [
                      Text('for ${user.split(' ').first} ${user.split(' ').last.substring(0,1)}.',
                        style: TextStyle(color: Colors.grey),),
                      Text('Assigned Just Now',
                        style: TextStyle(color: Colors.grey),),
                    ],),
                  )
                ],
              ),
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height/1.55,)
        ],
      ),
      bottomSheet: PhysicalModel(

        elevation: 15,shadowColor: Colors.grey,
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


  void _showDialog() {
Random random = Random();

    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (BuildContext context, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            height: 400,
            child: Material(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Container(color: Colors.blueAccent,
                    child: ListTile(
                      title: Text('Beecave'),
                      onTap: (){
                        Faker faker = Faker();
                        orders = '';
                      // print( DataResCus.beeCave[random.nextInt(DataResCus.beeCave.length)]['name']);
                       setState(() {
                         RestName = DataResCus.beeCave[random.nextInt(DataResCus.beeCave.length)]['name'];
                         Restaddress = DataResCus.beeCave[random.nextInt(DataResCus.beeCave.length)]['address'];
                         Future.delayed(Duration(milliseconds: 500));
                         print(RestName);

                         String order1;

                         for(int i = 0;i<random.nextInt(
                             FoodMenu.foodMenus[RestName].length)+1;i++){
                           order1 = FoodMenu.foodMenus[RestName][i];
                           orders = orders +'\n'+ order1;
                           print('$i ++');
                         }
                      userAddress = AddressUsers.beecave[random.nextInt(AddressUsers.beecave.length)];
                       //  orders = FoodMenu.foodMenus[RestName][1];
                         user = faker.person.firstName() +' '+ faker.person.lastName();

                         print(orders);

                         Fluttertoast.showToast(context,msg:
                         'Name User: ${user} \n Address User: ${userAddress}\n Restaurant: ${RestName}\n'
                             'Restaurant Address: ${Restaddress}\n Order:${orders}',
                             toastDuration: 5);
                       });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('LakeWay'),
                    onTap: (){
                      Faker faker = Faker();
                      orders = '';
                      // print( DataResCus.beeCave[random.nextInt(DataResCus.beeCave.length)]['name']);
                      setState(() {
                        RestName = DataResCus.lakeWay[random.nextInt(DataResCus.lakeWay.length)]['name'];
                        Restaddress = DataResCus.lakeWay[random.nextInt(DataResCus.lakeWay.length)]['address'];
                        Future.delayed(Duration(milliseconds: 500));
                        print(RestName);

                        String order1;
                        for(int i = 0;i<random.nextInt(
                            FoodMenu.foodMenus[RestName].length)+1;i++){
                          order1 = FoodMenu.foodMenus[RestName][i];
                          orders = orders +'\n'+ order1;
                          print('$i ++');
                        }
                        userAddress = AddressUsers.lakeway[random.nextInt(AddressUsers.lakeway.length)];
                        //  orders = FoodMenu.foodMenus[RestName][1];
                        user = faker.person.firstName() +' '+ faker.person.lastName();

                        print(orders);

                        Fluttertoast.showToast(context,msg:
                        'Name User: ${user} \n Address User: ${userAddress}\n Restaurant: ${RestName}\n'
                            'Restaurant Address: ${Restaddress}\n Order:${orders}',
                            toastDuration: 5);
                      });
                    },
                  ),
                  Container(color: Colors.blueAccent,
                    child: ListTile(
                      title: Text('Lost Creek'),

                      onTap: (){
                        Faker faker = Faker();
                        orders = '';
                        // print( DataResCus.beeCave[random.nextInt(DataResCus.beeCave.length)]['name']);
                        setState(() {
                          RestName = DataResCus.lostCreek[random.nextInt(DataResCus.lostCreek.length)]['name'];
                          Restaddress = DataResCus.lostCreek[random.nextInt(DataResCus.lostCreek.length)]['address'];
                          Future.delayed(Duration(milliseconds: 500));
                          print(RestName);

                          String order1;
                          for(int i = 0;i<random.nextInt(
                              FoodMenu.foodMenus[RestName].length)+1;i++){
                            order1 = FoodMenu.foodMenus[RestName][i];
                            orders = orders +'\n'+ order1;
                            print('$i ++');
                          }
                          userAddress = AddressUsers.lostcreek[random.nextInt(AddressUsers.lostcreek.length)];
                          //  orders = FoodMenu.foodMenus[RestName][1];
                          user = faker.person.firstName() +' '+ faker.person.lastName();

                          print(orders);

                          Fluttertoast.showToast(context,msg:
                          'Name User: ${user} \n Address User: ${userAddress}\n Restaurant: ${RestName}\n'
                              'Restaurant Address: ${Restaddress}\n Order:${orders}',
                              toastDuration: 5);
                        });
                      },

                    ),
                  ),
                  ListTile(
                    title: Text('Barton Creek'),
                    onTap: (){
                      Faker faker = Faker();
                      orders = '';
                      // print( DataResCus.beeCave[random.nextInt(DataResCus.beeCave.length)]['name']);
                      setState(() {
                        RestName = DataResCus.bartonCreek[random.nextInt(DataResCus.bartonCreek.length)]['name'];
                        Restaddress = DataResCus.bartonCreek[random.nextInt(DataResCus.bartonCreek.length)]['address'];
                        Future.delayed(Duration(milliseconds: 500));
                        print(RestName);

                        String order1;
                        for(int i = 0;i<random.nextInt(
                            FoodMenu.foodMenus[RestName].length)+1;i++){
                          order1 = FoodMenu.foodMenus[RestName][i];
                          orders = orders +'\n'+ order1;
                          print('$i ++');
                        }
                        userAddress = AddressUsers.bartoncreek[random.nextInt(AddressUsers.bartoncreek.length)];
                        //  orders = FoodMenu.foodMenus[RestName][1];
                        user = faker.person.firstName() +' '+ faker.person.lastName();

                        print(orders);

                        Fluttertoast.showToast(context,msg:
                        'Name User: ${user} \n Address User: ${userAddress}\n Restaurant: ${RestName}\n'
                            'Restaurant Address: ${Restaddress}\n Order:${orders}',
                            toastDuration: 5);
                      });
                    },

                  ),
                  Container(color: Colors.blueAccent,
                    child: ListTile(
                      title: Text('Sunset Valley'),

                      onTap: (){
                        Faker faker = Faker();
                        orders = '';
                        // print( DataResCus.beeCave[random.nextInt(DataResCus.beeCave.length)]['name']);
                        setState(() {
                          RestName = DataResCus.sunSetValley[random.nextInt(DataResCus.sunSetValley.length)]['name'];
                          Restaddress = DataResCus.sunSetValley[random.nextInt(DataResCus.sunSetValley.length)]['address'];
                          Future.delayed(Duration(milliseconds: 500));
                          print(RestName);

                          String order1;
                          for(int i = 0;i<random.nextInt(
                              FoodMenu.foodMenus[RestName].length)+1;i++){
                            order1 = FoodMenu.foodMenus[RestName][i];
                            orders = orders +'\n'+ order1;
                            print('$i ++');
                          }
                          userAddress = AddressUsers.sunsetvalley[random.nextInt(AddressUsers.sunsetvalley.length)];
                          //  orders = FoodMenu.foodMenus[RestName][1];
                          user = faker.person.firstName() +' '+ faker.person.lastName();

                          print(orders);

                          Fluttertoast.showToast(context,msg:
                          'Name User: ${user} \n Address User: ${userAddress}\n Restaurant: ${RestName}\n'
                              'Restaurant Address: ${Restaddress}\n Order:${orders}',
                              toastDuration: 5);
                        });
                      },

                    ),
                  ),

                  ListTile(
                    title: Text('Southeast Austin'),

                    onTap: (){
                      Faker faker = Faker();
                      orders = '';
                      // print( DataResCus.beeCave[random.nextInt(DataResCus.beeCave.length)]['name']);
                      setState(() {
                        RestName = DataResCus.southEastAustin[random.nextInt(DataResCus.southEastAustin.length)]['name'];
                        Restaddress = DataResCus.southEastAustin[random.nextInt(DataResCus.southEastAustin.length)]['address'];
                        Future.delayed(Duration(milliseconds: 500));
                        print(RestName);

                        String order1;
                        for(int i = 0;i<random.nextInt(
                            FoodMenu.foodMenus[RestName].length)+1;i++){
                          order1 = FoodMenu.foodMenus[RestName][i];
                          orders = orders +'\n'+ order1;
                          print('$i ++');
                        }
                        userAddress = AddressUsers.southeastAustin[random.nextInt(AddressUsers.southeastAustin.length)];
                        //  orders = FoodMenu.foodMenus[RestName][1];
                        user = faker.person.firstName() +' '+ faker.person.lastName();

                        print(orders);
                        Fluttertoast.showToast(context,msg:
                        'Name User: ${user} \n Address User: ${userAddress}\n Restaurant: ${RestName}\n'
                            'Restaurant Address: ${Restaddress}\n Order:${orders}',
                            toastDuration: 5);
                      });
                    },

                  ),


                  Container(color: Colors.blueAccent,
                    child: ListTile(
                      title: Text('Daffan'),

                      onTap: (){
                        Faker faker = Faker();
                        orders = '';
                        // print( DataResCus.beeCave[random.nextInt(DataResCus.beeCave.length)]['name']);
                        setState(() {
                          RestName = DataResCus.daffan[random.nextInt(DataResCus.daffan.length)]['name'];
                          Restaddress = DataResCus.daffan[random.nextInt(DataResCus.daffan.length)]['address'];
                          Future.delayed(Duration(milliseconds: 500));
                          print(RestName);

                          String order1;
                          for(int i = 0;i<random.nextInt(
                              FoodMenu.foodMenus[RestName].length)+1;i++){
                            order1 = FoodMenu.foodMenus[RestName][i];
                            orders = orders +'\n'+ order1;
                            print('$i ++');
                          }
                          userAddress = AddressUsers.daffan[random.nextInt(AddressUsers.daffan.length)];
                          //  orders = FoodMenu.foodMenus[RestName][1];
                          user = faker.person.firstName() +' '+ faker.person.lastName();

                          print(orders);

                          Fluttertoast.showToast(context,msg:
                          'Name User: ${user} \n Address User: ${userAddress}\n Restaurant: ${RestName}\n'
                              'Restaurant Address: ${Restaddress}\n Order:${orders}',
                              toastDuration: 5);
                        });
                      },

                    ),
                  ),

                  ListTile(
                    title: Text('North Lamar'),

                    onTap: (){
                      Faker faker = Faker();
                      orders = '';
                      // print( DataResCus.beeCave[random.nextInt(DataResCus.beeCave.length)]['name']);
                      setState(() {
                        RestName = DataResCus.northLamar[random.nextInt(DataResCus.northLamar.length)]['name'];
                        Restaddress = DataResCus.northLamar[random.nextInt(DataResCus.northLamar.length)]['address'];
                        Future.delayed(Duration(milliseconds: 500));
                        print(RestName);

                        String order1;
                        for(int i = 0;i<random.nextInt(
                            FoodMenu.foodMenus[RestName].length)+1;i++){
                          order1 = FoodMenu.foodMenus[RestName][i];
                          orders = orders +'\n'+ order1;
                          print('$i ++');
                        }
                        userAddress = AddressUsers.northLamar[random.nextInt(AddressUsers.northLamar.length)];
                        //  orders = FoodMenu.foodMenus[RestName][1];
                        user = faker.person.firstName() +' '+ faker.person.lastName();

                        print(orders);

                        Fluttertoast.showToast(context,msg:
                        'Name User: ${user} \n Address User: ${userAddress}\n Restaurant: ${RestName}\n'
                            'Restaurant Address: ${Restaddress}\n Order:${orders}',
                            toastDuration: 5);
                      });
                    },

                  ),

                  Container(color: Colors.blueAccent,
                    child: ListTile(
                      title: Text('Pflugerville'),

                      onTap: (){
                        Faker faker = Faker();
                        orders = '';
                        // print( DataResCus.beeCave[random.nextInt(DataResCus.beeCave.length)]['name']);
                        setState(() {
                          RestName = DataResCus.pflugerville[random.nextInt(DataResCus.pflugerville.length)]['name'];
                          Restaddress = DataResCus.pflugerville[random.nextInt(DataResCus.pflugerville.length)]['address'];
                          Future.delayed(Duration(milliseconds: 500));
                          print(RestName);

                          String order1;
                          for(int i = 0;i<random.nextInt(
                              FoodMenu.foodMenus[RestName].length)+1;i++){
                            order1 = FoodMenu.foodMenus[RestName][i];
                            orders = orders +'\n'+ order1;
                            print('$i ++');
                          }
                          userAddress = AddressUsers.pflugerville[random.nextInt(AddressUsers.pflugerville.length)];
                          //  orders = FoodMenu.foodMenus[RestName][1];
                          user = faker.person.firstName() +' '+ faker.person.lastName();

                          print(orders);

                          Fluttertoast.showToast(context,msg:
                          'Name User: ${user} \n Address User: ${userAddress}\n Restaurant: ${RestName}\n'
                              'Restaurant Address: ${Restaddress}\n Order:${orders}',
                              toastDuration: 5);
                        });
                      },

                    ),
                  ),

                  ListTile(
                    title: Text('Jolly Ville'),

                    onTap: (){
                      Faker faker = Faker();
                      orders = '';
                      // print( DataResCus.beeCave[random.nextInt(DataResCus.beeCave.length)]['name']);
                      setState(() {
                        RestName = DataResCus.johyVille[random.nextInt(DataResCus.johyVille.length)]['name'];
                        Restaddress = DataResCus.johyVille[random.nextInt(DataResCus.johyVille.length)]['address'];
                        Future.delayed(Duration(milliseconds: 500));
                        print(RestName);

                        String order1;
                        for(int i = 0;i<random.nextInt(
                            FoodMenu.foodMenus[RestName].length)+1;i++){
                          order1 = FoodMenu.foodMenus[RestName][i];
                          orders = orders +'\n'+ order1;
                          print('$i ++');
                        }
                        userAddress = AddressUsers.jollyVille[random.nextInt(AddressUsers.jollyVille.length)];
                        //  orders = FoodMenu.foodMenus[RestName][1];
                        user = faker.person.firstName() +' '+ faker.person.lastName();

                        print(orders);

                        Fluttertoast.showToast(context,msg:
                        'Name User: ${user} \n Address User: ${userAddress}\n Restaurant: ${RestName}\n'
                            'Restaurant Address: ${Restaddress}\n Order:${orders}',
                            toastDuration: 5);
                      });
                    },

                  ),

                  Container(color: Colors.blueAccent,
                    child: ListTile(
                      title: Text('NorthWest Hills'),

                      onTap: (){
                        Faker faker = Faker();
                        orders = '';
                        // print( DataResCus.beeCave[random.nextInt(DataResCus.beeCave.length)]['name']);
                        setState(() {
                          RestName = DataResCus.northWestHills[random.nextInt(DataResCus.northWestHills.length)]['name'];
                          Restaddress = DataResCus.northWestHills[random.nextInt(DataResCus.northWestHills.length)]['address'];
                          Future.delayed(Duration(milliseconds: 500));
                          print(RestName);

                          String order1;
                          for(int i = 0;i<random.nextInt(
                              FoodMenu.foodMenus[RestName].length)+1;i++){
                            order1 = FoodMenu.foodMenus[RestName][i];
                            orders = orders +'\n'+ order1;
                            print('$i ++');
                          }
                          userAddress = AddressUsers.northWestHills[random.nextInt(AddressUsers.northWestHills.length)];
                          //  orders = FoodMenu.foodMenus[RestName][1];
                          user = faker.person.firstName() +' '+ faker.person.lastName();

                          print(orders);

                          Fluttertoast.showToast(context,msg:
                          'Name User: ${user} \n Address User: ${userAddress}\n Restaurant: ${RestName}\n'
                              'Restaurant Address: ${Restaddress}\n Order:${orders}',
                              toastDuration: 5);
                        });
                      },

                    ),
                  ),

                  ListTile(
                    title: Text('Kyle'),

                    onTap: (){
                      Faker faker = Faker();
                      orders = '';
                      // print( DataResCus.beeCave[random.nextInt(DataResCus.beeCave.length)]['name']);
                      setState(() {
                        RestName = DataResCus.kyle[random.nextInt(DataResCus.kyle.length)]['name'];
                        Restaddress = DataResCus.kyle[random.nextInt(DataResCus.kyle.length)]['address'];
                        Future.delayed(Duration(milliseconds: 500));
                        print(RestName);

                        String order1;
                        for(int i = 0;i<random.nextInt(
                            FoodMenu.foodMenus[RestName].length)+1;i++){
                          order1 = FoodMenu.foodMenus[RestName][i];
                          orders = orders +'\n'+ order1;
                          print('$i ++');
                        }
                        userAddress = AddressUsers.kyle[random.nextInt(AddressUsers.kyle.length)];
                        //  orders = FoodMenu.foodMenus[RestName][1];
                        user = faker.person.firstName() +' '+ faker.person.lastName();

                        print(orders);

                        Fluttertoast.showToast(context,msg:
                        'Name User: ${user} \n Address User: ${userAddress}\n Restaurant: ${RestName}\n'
                            'Restaurant Address: ${Restaddress}\n Order:${orders}',
                            toastDuration: 5);
                      });
                    },

                  ),

                  Container(color: Colors.blueAccent,
                    child: ListTile(
                      title: Text('San Marcos'),

                      onTap: (){
                        Faker faker = Faker();
                        orders = '';
                        // print( DataResCus.beeCave[random.nextInt(DataResCus.beeCave.length)]['name']);
                        setState(() {
                          RestName = DataResCus.sanMarcos[random.nextInt(DataResCus.sanMarcos.length)]['name'];
                          Restaddress = DataResCus.sanMarcos[random.nextInt(DataResCus.sanMarcos.length)]['address'];
                          Future.delayed(Duration(milliseconds: 500));
                          print(RestName);

                          String order1;
                          for(int i = 0;i<random.nextInt(
                              FoodMenu.foodMenus[RestName].length)+1;i++){
                            order1 = FoodMenu.foodMenus[RestName][i];
                            orders = orders +'\n'+ order1;
                            print('$i ++');
                          }
                          userAddress = AddressUsers.sanMarcos[random.nextInt(AddressUsers.sanMarcos.length)];
                          //  orders = FoodMenu.foodMenus[RestName][1];
                          user = faker.person.firstName() +' '+ faker.person.lastName();

                          print(orders);

                          Fluttertoast.showToast(context,msg:
                          'Name User: ${user} \n Address User: ${userAddress}\n Restaurant: ${RestName}\n'
                              'Restaurant Address: ${Restaddress}\n Order:${orders}',
                              toastDuration: 5);
                        });
                      },

                    ),
                  ),



                ],
              ),
            )
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }



}
