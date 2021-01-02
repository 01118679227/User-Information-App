import 'package:flutter/cupertino.dart';
import 'package:readfromjsonfile/model/MyData.dart';
import 'dart:convert';
class myHomePageProvider extends ChangeNotifier{
  MyData data;
  Future getData(context) async{
    var response = await DefaultAssetBundle.of(context).loadString('assets/raw/myJson.json');
    var mJson = json.decode(response);
    this.data = MyData.fromJson(mJson);
    this.notifyListeners();
  }
}