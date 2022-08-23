import 'package:apphud/apphud.dart';
import 'package:clipboard/clipboard.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioFunction{
  final Dio _dio = Dio();

  setAdplexity() async{
    Response response
    = await _dio.get('https://block.stopscamapp.com/adplexity.txt');
    SharedFunction().setBlockedUrl(response.data);
  }

  dioValidation(){
    FlutterClipboard.paste().then((value) async{
      Response response
      = await _dio.get('https://check.stopscamapp.com/validation?cid=$value');
    });
  }

  dioInstall(){
    FlutterClipboard.paste().then((value) async{
      var apphud = await Apphud.userID();
      Response response
      = await _dio.get('https://api.stopscamapp.com/post/install?cid=$value&ud=$apphud');
    });
  }

  dioSubs(){
    FlutterClipboard.paste().then((value) async{
      Response response
      = await _dio.get('https://api.stopscamapp.com/post/subs?cid=$value');
      print(response);
    });
  }

}

class SharedFunction{

  setBlockedUrl(String file) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString('blockedUrl', file);
  }

}