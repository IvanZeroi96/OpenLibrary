import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:robin_food_library/controller/detail/detail_controller.dart';
import 'package:robin_food_library/model/colors.dart';
import 'package:robin_food_library/ui/rfl_loading.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
        init: DetailController(),
        builder: (get) {
          return Scaffold(
            body: Stack(
              children: [
                GetBuilder<DetailController>(
                    id: 'Detalles',
                    builder: (get) {
                      if (get.isError) {
                        return const Center(
                          child: Text('Sin datos.'),
                        );
                      } else if (get.loading) {
                        return Center(child: RFLCircularProgress());
                      } else if (get.dontData) {
                        return const Center(
                          child: Text('Sin detalles del libro.'),
                        );
                      } else {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 200, left: 20, right: 20),
                            child: Card(
                              elevation: 5,
                              color: RFLColors.primaryColors,
                              child: ListTile(
                                trailing: IconButton(onPressed: (){
                                  get.setFavorite(get.titulo, get.detalleLibro!.description.toString(), get.libro!.authorName!.toList().toString().replaceAll('[', '').replaceAll(']', ''));
                                }, icon: const Icon(Icons.star_border)),
                                title: const Text(
                                  'Detalles del libro',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(height: 8,),
                                    SizedBox(height: 1,child: Container(color: Colors.black26,),),
                                    Container(height: 8,),
                                    Text('Autores: ${get.libro?.authorName!.toList().toString().replaceAll('[', '').replaceAll(']', '')}'),
                                    Container(height: 8,),
                                    Text('Año de publicacion: ${get.libro?.firstPublishYear}'),
                                    Container(height: 8,),
                                    Text('Valoraciones: ${get.detalleLibro?.latestRevision!.toString().replaceAll('[', '').replaceAll(']', '')}'),
                                    Container(height: 8,),
                                    Text('Descripción: ${get.detalleLibro?.description!.toString().replaceAll('[', '').replaceAll(']', '')}'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    }),
                Container(
                  width: double.infinity,
                  height: 190,
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
                      Text(
                        get.titulo,
                        style: const TextStyle(
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
        });
  }

  void _mensajeSnackBar(BuildContext context,String? titulo){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        key: Key(titulo.toString()),
        content: Text(titulo.toString()),
        duration: const Duration(milliseconds: 5500),
        padding: const EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
