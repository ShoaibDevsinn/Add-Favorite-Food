import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Perfrences{
  static sveitem(item)async{
    var pref = await SharedPreferences.getInstance();
    var data = await getitem();
    if(data!=null){
      data.add(item);
    }else{
      data =[item];
    }
    pref.setString("list", jsonEncode(data));
    print(item);
  }
  static getitem()async{
    var pref = await SharedPreferences.getInstance();
    var data = pref.getString("list");
    if (data!=null){
      return jsonDecode(data);
    }
  }
}