
import 'package:get/get.dart';
import 'package:robin_food_library/model/database.dart';

class SplashController extends GetxController{

  late DatabaseHandler handler;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    handler = DatabaseHandler();
    handler.initializeDB();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed('/home');
    });
  }
}