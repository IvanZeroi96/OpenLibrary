import 'package:get/get.dart';
import 'package:robin_food_library/model/home_model/home_from_json.dart';
import 'package:robin_food_library/model/network.dart';

class HomeController extends GetxController{

  HomeObj? _homeSearch;
  bool _loading = false;
  bool _dontData = true;
  bool _isError = false;
  bool _bloqueoCampoBusqueda = true;

  HomeObj? get homeSearch => _homeSearch;
  bool get loading => _loading;
  bool get dontData => _dontData;
  bool get isError => _isError;
  bool get bloqueoCampoBusqueda => _bloqueoCampoBusqueda;


  Future<void> getBusqueda(String palabraBusqueda)async {
    _loading = true;
    _isError = false;
    _dontData = false;
    _bloqueoCampoBusqueda = false;

    update(['SearchResults','FormBusqueda']);
    final network = Network();
    _homeSearch = await network.getListaLibros(palabraBusqueda.replaceAll(' ','+'));

    if(_homeSearch != null){
      if(_homeSearch!.docs!.isEmpty){
        _dontData = true;
      }
    }else{
      _isError = true;
    }
    _loading = false;
    _bloqueoCampoBusqueda = true;
    update(['SearchResults','FormBusqueda']);
  }
  
  void setDetail(String titulo,Doc doc){
    Get.toNamed('/detail',arguments: {"titulo": titulo,"doc": doc,});
  }

  void setFavorite(){
    Get.toNamed('/favorite');
  }
}