
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robin_food_library/model/database.dart';
import 'package:robin_food_library/model/detail_model/detail_from_json.dart';
import 'package:robin_food_library/model/favorite_model/favorite_model.dart';
import 'package:robin_food_library/model/home_model/home_from_json.dart';
import 'package:robin_food_library/model/network.dart';

class DetailController extends GetxController{

  String _titulo = '';
  bool _loading = false;
  bool _dontData = true;
  bool _isError = false;
  Doc? _libro;
  DetalleObj? _detalleLibro;
  late DatabaseHandler db;

  String get titulo => _titulo;
  bool get loading => _loading;
  bool get dontData => _dontData;
  bool get isError => _isError;
  Doc? get libro => _libro;
  DetalleObj? get detalleLibro => _detalleLibro;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _titulo = Get.arguments['titulo'];
    _libro = Get.arguments['doc'];
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getDetalles(_libro!.key.toString());
  }

  Future<void> getDetalles(String keyDetalle)async {
    _loading = true;
    _isError = false;
    _dontData = false;

    update(['Detalles']);
    final network = Network();
    _detalleLibro = await network.getDetalle(keyDetalle);

    if(_detalleLibro != null){

    }else{
      _isError = true;
    }
    _loading = false;
    update(['Detalles']);
  }

  void setFavorite(String titulo,String contenido,String autores) async{
    Favorite favorite = Favorite(titulo: titulo, contenido: contenido, autores: autores);
    db = DatabaseHandler();

    bool response = await db.insertUser(favorite);
    Get.snackbar(
      response ? "Agregado a favoritos." : "No agregado.",
      "",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(milliseconds: 5500),
      backgroundColor: Colors.black54,
      colorText: Colors.white
    );
  }
}