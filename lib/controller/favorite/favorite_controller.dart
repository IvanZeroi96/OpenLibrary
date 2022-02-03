
import 'package:get/get.dart';
import 'package:robin_food_library/model/database.dart';
import 'package:robin_food_library/model/favorite_model/favorite_model.dart';

class FavoriteController extends GetxController{

  late DatabaseHandler db;
  late List<Favorite> _listaFavoritos;
  bool _isError = false;
  bool _loading = true;
  bool _dontData = false;

  List<Favorite> get listaFavoritos =>  _listaFavoritos;
  bool get isError => _isError;
  bool get loading => _loading;
  bool get dontData => _dontData;

  @override
  void onReady() {
    getListaFavoritos();
    super.onReady();

  }

  void getListaFavoritos() async{
    db = DatabaseHandler();
    _isError = false;
    _loading = true;
    _dontData = false;
    update(['ListaFavoritos']);

     _listaFavoritos = await db.getListaFavoritos();

     if(_listaFavoritos == null){
       _isError = true;
     }else if(_listaFavoritos.isEmpty){
       _dontData = true;
     }
     _loading = false;
     update(['ListaFavoritos']);
  }
}