
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:robin_food_library/controller/favorite/favorite_controller.dart';
import 'package:robin_food_library/model/colors.dart';
import 'package:robin_food_library/model/favorite_model/favorite_model.dart';
import 'package:robin_food_library/ui/rfl_loading.dart';

class FavoritePage extends StatelessWidget{
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<FavoriteController>(
      init: FavoriteController(),
      builder: (context) {
        return Scaffold(
          body: Stack(
            children: [
              GetBuilder<FavoriteController>(
                id: 'ListaFavoritos',
                builder: (get) {
                  if (get.isError) {
                    return const Center(
                      child: Text('Error al procesar la busqueda.'),
                    );
                  } else if (get.loading) {
                    return Center(child: RFLCircularProgress());
                  } else if (get.dontData) {
                    return const Center(
                      child: Text('Sin ninguna busqueda'),
                    );
                  } else {
                    return ListView.builder(
                      padding: const EdgeInsets.only(
                        top: 220,
                        left: 20,
                        right: 20,
                        bottom: 30,
                      ),
                      itemCount: get.listaFavoritos.length,
                      itemBuilder: (context, index) {
                        return _getViewLibro(get.listaFavoritos[index]);
                      },
                    );
                  }
                },
              ),
              Container(
                height: 180,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: RFLColors.primaryColors,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 100,
                      child: SvgPicture.asset(
                        'assets/images/openlibrary_logo_tighter.svg',
                        allowDrawingOutsideViewBox: true,
                        width: 250,
                      ),
                    ),
                    const Text(
                      'Favoritos',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  Widget _getViewLibro(Favorite favorite){
    return Card(
      color: RFLColors.primaryColors,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text(favorite.titulo.toString().capitalize.toString(),style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 8,),
                  SizedBox(height: 1,child: Container(color: Colors.black26,),),
                  Container(height: 8,),
                  Text('Autores: ${favorite.autores.toString().replaceAll('[', '').replaceAll(']', '')}'),
                  Container(height: 8,),
                  Text('Descripción: ${favorite.contenido.toString().replaceAll('[', '').replaceAll(']', '')}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}