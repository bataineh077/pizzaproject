
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Address'),
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

            _getPrefs();



          setState(() {
           // sharedPrefs.setString('${_name.text}', '${_lat.text.trim()},${_long.text.trim()}'.trim());
            sharedPrefs.setString('${_name.text}', '${_lat.text}');

           // print(' ${sharedPrefs.getKeys()} : ${sharedPrefs.get('ta')}');

          });

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
