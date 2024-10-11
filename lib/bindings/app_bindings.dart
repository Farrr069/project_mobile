import 'package:get/get.dart';
import '../controllers/food_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Menginisialisasi FoodController secara lazy (hanya saat diperlukan)
    Get.lazyPut<FoodController>(() => FoodController());
  }
}
