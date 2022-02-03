
import 'package:flutter/material.dart';
import 'package:robin_food_library/model/constants.dart';
import 'package:http/http.dart' as http;
import 'package:robin_food_library/model/detail_model/detail_from_json.dart';
import 'package:robin_food_library/model/home_model/home_from_json.dart';
import 'dart:async';
import 'dart:convert';

class Network{

  Future<dynamic> getListaLibros(String busqueda) async{
    HomeObj? objectResponse;
    try{
      var url = Uri.parse(WebService().baseUrlSearch + '?q=' + busqueda);
      debugPrint('Url -> ' + url.toString());
      await http.get(url).then((response){
        //debugPrint(response.statusCode.toString());
        //debugPrint(response.body.replaceAll('\'', ''));
        if (response.statusCode == 200 || response.statusCode == 201) {
          objectResponse = HomeObj.fromJson(jsonDecode(response.body.replaceAll('\'', '')));
        }else {
          objectResponse = null;
        }
      });
      return objectResponse;
    }catch(id){
      return null;
    }
  }

  Future<dynamic> getDetalle(String keyDetalle) async{
    DetalleObj? objectResponse;
    try{
      var url = Uri.parse(WebService().baseUrlDetail + keyDetalle + '.json');
      debugPrint('Url -> ' + url.toString());
      await http.get(url).then((response){
        //debugPrint(response.statusCode.toString());
        //debugPrint(response.body.replaceAll('\'', ''));
        if (response.statusCode == 200 || response.statusCode == 201) {
          objectResponse = DetalleObj.fromJson(jsonDecode(response.body.replaceAll('\'', '')));
        }else {
          objectResponse = null;
        }
      });
      return objectResponse;
    }catch(id){
      return null;
    }
  }
}