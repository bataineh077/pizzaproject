
import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pizza/component/dataRes&Cus.dart';
import 'package:pizza/component/foodMenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddAdressUi extends StatefulWidget {
  @override
  _AddAdressUiState createState() => _AddAdressUiState();
}

class _AddAdressUiState extends State<AddAdressUi> {

  TextEditingController _name = TextEditingController();
  TextEditingController _lat = TextEditingController();
  TextEditingController _long = TextEditingController();

  SharedPreferences sharedPrefs;


  String RestName , Restaddress , user =". .",
      userAddress,orders = '';

  TextStyle style = TextStyle(fontSize: 15,fontWeight: FontWeight.bold);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Secret Dashboard'),

      ),
      body: Container(
        child: ListView(
          children: [

            ListTile(
              title: TextFormField(
                controller: _name,
                 decoration: InputDecoration(
                   hintText: 'Name'
                 ),
              ),
              leading: Text('Name',style: TextStyle(fontSize: 18),),
            ),

            ListTile(
              title: TextFormField(
                controller: _lat,
                decoration: InputDecoration(
                    hintText: 'Address'
                ),
              ),
              leading: Text('Address',style: TextStyle(fontSize: 18),),
            ),

//            ListTile(
//              title: TextFormField(
//                controller: _long,
//                decoration: InputDecoration(
//                    hintText: 'Lng'
//                ),
//              ),
//              leading: Text('Lng',style: TextStyle(fontSize: 18),),
//            ),
            RaisedButton(onPressed: ()async{
             if(_name.text.length >1 || _lat.text.length >2){
            _getPrefs();


          setState(() {
           // sharedPrefs.setString('${_name.text}', '${_lat.text.trim()},${_long.text.trim()}'.trim());
            sharedPrefs.setString('${_name.text}', '${_lat.text}');

           // print(' ${sharedPrefs.getKeys()} : ${sharedPrefs.get('ta')}');

          });}
             else{
               Fluttertoast.showToast(context,msg: 'Please insert valid Name & Address');
             }

            },
            color: Colors.blueAccent,
            child: Text('Add'),),

            FutureBuilder(
              future: _getPrefs(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: sharedPrefs.getKeys().length,
                      itemBuilder: (BuildContext context, int index){
                        return
                          Column(
                            children: [
                              Wrap(crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text('${snapshot.data[index]} : ',
                                    style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold ),),
                                  Text('${sharedPrefs.get(snapshot.data[index])}',
                                      style: TextStyle(fontSize: 15,color: Colors.grey.shade700 )),
                                 IconButton(onPressed: (){
                                   setState(() {
                                     sharedPrefs.remove(snapshot.data[index]);

                                   });
                                 },
                                 icon: Icon(Icons.clear),)
                                 // Center(child: Text('${snapshot.data[index]} : ${sharedPrefs.get(snapshot.data[index])}')),
                                ],
                              ),
                            ],
                          );

                      }


                  );
                }
                return CircularProgressIndicator(); // or some other widget
              },
            )
          ],
        ),
      ),

      bottomSheet:  Row(
        children: [
          Expanded(
            child: RaisedButton(onPressed: (){
              setState(() {
                sharedPrefs.clear();
              });

            },
              color: Colors.redAccent,
              child: Text('CLEAR ALL'),),
          ),
        ],
      ),
    );
  }

  Future<List> _getPrefs() async{
    sharedPrefs = await SharedPreferences.getInstance();
   return sharedPrefs.getKeys().toList();
  }

}
