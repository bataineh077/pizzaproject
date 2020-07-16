import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:pizza/component/runnerCard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Running extends StatefulWidget {

  String resturantName , address , user , userAddress,orders;

  Running({this.resturantName,this.user,this.address,this.userAddress,this.orders});
  @override
  _RunningState createState() => _RunningState();
}

class _RunningState extends State<Running> {

  SharedPreferences sharedPrefs;

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
             name: '${widget.user}',
             subName: '0-50 Favors',
             address: '${widget.userAddress}',
             addressNote: 'Leave items at the door',
             note: 'Please place items at the end of the driveway'
                 '\n thank you ',
             secound: false,
             image: 'assets/person.png',
           ),

            RunnerCardFirst(hight: height*1.2,
              icon1: OMIcons.call,
              icon2: OMIcons.search,
              name: '${widget.resturantName}',
              //subName: '0-50 Favors',
              address: '${widget.address}',
              addressNote: 'Leave items at the door',
              note: '${widget.orders}',
              secound: true,
              image: 'assets/pin.png',
            ),
SizedBox(height: MediaQuery.of(context).size.height/5,
child: FlatButton(
  onPressed: (){
    _showDialog();
  },
  child: Text('' ,style: TextStyle(fontSize: 22),),
),
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


  Future<List> getPrefs() async{
    sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getKeys().toList();
  }

  void _showDialog() {


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
            height: 300,
            child: FutureBuilder(
              future: getPrefs(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Material(
                    child: ListView.builder(
                       // shrinkWrap: true,
                        itemCount: sharedPrefs.getKeys().length,
                        itemBuilder: (BuildContext context, int index){
                          return
                            Wrap(
                              children: [
                                Wrap(
                                  children: [
                                    Text('${snapshot.data[index]} : ',
                                      style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold ),),
                                    Text('${sharedPrefs.get(snapshot.data[index])}',
                                        style: TextStyle(fontSize: 15,color: Colors.grey.shade700 )),
                                  IconButton(onPressed: (){
                                 //   print(double.parse(sharedPrefs.get(snapshot.data[index]).toString().split(',').first));
                                  //  print(double.parse(sharedPrefs.get(snapshot.data[index]).toString().split(',').last));
                                    MapsLauncher.launchQuery(
                                      //  double.parse(sharedPrefs.get(snapshot.data[index]).toString().split(',').first) ,
                                     //   double.parse(sharedPrefs.get(snapshot.data[index]).toString().split(',').last) ,
                                        '${sharedPrefs.get(snapshot.data[index])}'
                                    );
                                  },
                                    icon: Icon(Icons.navigation),)

                                  ],
                                ),
                              ],
                            );

                        }


                    ),
                  );
                }
                return CircularProgressIndicator(); // or some other widget
              },
            ),
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
