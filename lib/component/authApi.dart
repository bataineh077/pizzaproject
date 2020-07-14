import 'dart:convert';

import 'package:get_mac/get_mac.dart';
import 'package:http/http.dart' as http;

class AuthApi {

 static Future<bool> checkLimit()async{
    String platformVersion;
    String verNumber = '0';
    platformVersion = await GetMac.macAddress;

    Map <String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };

    http.Response response = await http.post(
        'https://talal-favor.herokuapp.com/api/favor/trihard7' ,

        headers: headers ,



        body: jsonEncode({
          "phoneId":'${platformVersion}',
          "versionId": '${verNumber}'
        }));
    var body  = jsonDecode(response.body);

    print(body);
    return body;
//       if(response.statusCode==201){
//
//         print(body);
//         return body;
//       }
//       else{
//         print(response.statusCode);
//
////         print('${
////             jsonEncode({
////               "phoneId":'${platformVersion}',
////               "versionId": '${verNumber}'
////             })
////         }');
//         return body;
//       }

  }


}