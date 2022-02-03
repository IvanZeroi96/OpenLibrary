import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:robin_food_library/controller/home/home_controller.dart';
import 'package:robin_food_library/model/colors.dart';
import 'package:robin_food_library/model/home_model/home_from_json.dart';
import 'package:robin_food_library/ui/rfl_loading.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (get) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              body: Stack(
                children: [
                  GetBuilder<HomeController>(
                    id: 'SearchResults',
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
                          itemCount: get.homeSearch?.docs?.length,
                          itemBuilder: (context, index) {
                            var collectionDataList = get.homeSearch?.docs?.toList();
                            var collec = collectionDataList![index];
                            return _createCardBook(collec,get);
                          },
                        );
                      }
                    },
                  ),
                  Container(
                    height: 210,
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
                        GetBuilder<HomeController>(
                          id: 'FormBusqueda',
                          builder: (get){
                            return Container(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              width: double.infinity,
                              child: TextFormField(
                                enabled: get.bloqueoCampoBusqueda,
                                onFieldSubmitted: (v){
                                  if(v.isEmpty){
                                    _mensajeSnackBar(context,'Campo de busqueda vacio.');
                                  }else{
                                    get.getBusqueda(v.trim());
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'Buscar por título o autor',
                                  filled: true,
                                  suffixIcon: const Icon(
                                    Icons.search_outlined,
                                    color: Colors.black,
                                  ),
                                  fillColor: Colors.grey,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  disabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.grey,
                child: const Icon(Icons.star,color: Colors.amberAccent,),
                onPressed: () {
                  get.setFavorite();
                },
              ),
            ),
          );
        });
  }

  Widget _createCardBook(Doc book,HomeController get){
    return Padding(
      padding: const EdgeInsets.only(top:3.0),
      child: InkWell(
        onTap: (){
          get.setDetail(book.title.toString(),book);
        },
        child: Card(
          elevation: 5,
          color: RFLColors.primaryColors,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(book.title.toString().capitalize.toString(),style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 8,),
                      SizedBox(height: 1,child: Container(color: Colors.black26,),),
                      Container(height: 8,),
                      Text('Autores: ${book.authorName!.toList().toString().replaceAll('[', '').replaceAll(']', '')}'),
                      Text('Primera publicacion: ${book.firstPublishYear}'),
                      Text('Edición: ${book.editionCount}'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
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

