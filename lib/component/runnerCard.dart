
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';


class RunnerCardFirst extends StatefulWidget {

  double hight;
  IconData icon1 , icon2;
  String name ,subName , address, addressNote, note , image;
  bool secound;
  RunnerCardFirst({this.hight,this.icon1,this.icon2,this.name,
    this.note,this.address,this.addressNote,this.subName,this.secound,this.image});

  @override
  _RunnerCardFirstState createState() => _RunnerCardFirstState();
}

class _RunnerCardFirstState extends State<RunnerCardFirst> {

  Widget Secound(){
    if(widget.secound==true){
      return
        IconButton(icon: Icon(Icons.arrow_forward_ios,size: 18,
          color: Color(0xFF00A1DF),),
          onPressed: (){

          },);
    }
    else {
      return SizedBox(width: 1,height: 1,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: this.widget.hight/3,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all( color: Colors.grey,width: 0.3)
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      //color: Color(0xFF00A1DF),
                      image: DecorationImage(
                        image: AssetImage('${widget.image}')
                      )
                    ),
                  ),

                  Divider(),

                  RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(text: '${widget.name} \n',
                            style: TextStyle(color: Colors.black.withOpacity(0.75),fontSize: 16),
                          ),

                          TextSpan(text: '${widget.subName==null?'':widget.subName}',
                            style: TextStyle(color: Colors.grey,height: 1.7,fontSize: 10),
                          ),
                        ]
                    ),
                  ),

                  SizedBox(width: 25,),

                  IconButton(onPressed: (){},
                    icon: Icon(widget.icon1 , color: Color(0xFFAED7E9),),),

                  Container(height: this.widget.hight/21, child: VerticalDivider(color: Colors.grey)),

                  IconButton(onPressed: (){},
                    icon: Icon(widget.icon2 , color: Color(0xFFAED7E9),),)
                ],
              ),
            ),

            Divider(color: Colors.grey,height: 0.3,),


            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.asset('assets/location.png',height: 23,width: 23,color: Color(0xFF00A1DF),),
                //  Icon(OMIcons.map,color: Color(0xFF00A1DF),),
                  Text('  ${widget.address}',
                    style: TextStyle(color: Color(0xFF00A1DF)),)

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                // vertical: 1
              ),

              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 // Icon(Icons.domain,color: Colors.brown,size: 17,),
                //  Image.asset('assets/door.png',height: 23,width: 23,color: Colors.brown,),
                  Text('${widget.addressNote}',
                    style: TextStyle(color: Colors.grey,fontSize: 12),),
                  Secound()

                ],
              ),
            ),
                 widget.secound==true?Divider(color: Colors.grey,height: 0.8,
                   indent: 12,endIndent: 12,):SizedBox(height: 1,),

            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 11
              ),

              child: Row(
                children: [
                  // Icon(Icons.domain,color: Colors.brown,),
                  Text('${widget.note}',
                    style: TextStyle(color: Colors.grey.shade700,fontSize: 13),)

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}



