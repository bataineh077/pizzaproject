import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

import 'newHome.dart';


class EnterName extends StatefulWidget {
  @override
  _EnterNameState createState() => _EnterNameState();
}

class _EnterNameState extends State<EnterName> {


  TextEditingController name = TextEditingController();


  static Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get localFile async {
    final path = await localPath;
    return File('$path/text.txt');
  }

  Future<File> writeFile(String text) async {
    final file = await localFile;
    return file.writeAsString('$text\r\n', mode: FileMode.append);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Enter Name'),
        ),
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                hintText: 'Enter Your Name \n You Can\'t Change',
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
              ),
            ),
            RaisedButton(
              onPressed: ()async{
                if(name.text==null || name.text.length<2){
                    // ignore: deprecated_member_use
                    Fluttertoast.showToast(context,msg: 'Enter Correct Name',toastDuration: 4,);
                }else{

                  writeFile(name.text).then((value) {
                    print(value.readAsStringSync());

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return NewHome(name: value.readAsStringSync().trim(),);
                        },
                      ),
                    );
                  });

                }


              },
              child: Text('Submit'),
            )
          ],
        )
    );
  }
}
