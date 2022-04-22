import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mountain_trips/models/data_model.dart';

class DataServices {
  String baseUrl = 'http://mark.bslmeiyu.com/api';
  getInfo() async {
    var apiUrl = '/getplaces';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    try{
      if(res.statusCode == 200){
        List<dynamic> list = json.decode(res.body);
        return list.map((element) => DataModel.fromJson(element)).toList();
      }
      else{
        return <DataModel>[];
      }
    }catch(e){
      print(e);
      Container(child: Text('$e'),);
    }
  }
}