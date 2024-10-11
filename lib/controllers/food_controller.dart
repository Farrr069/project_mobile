import 'package:get/get.dart';
import '../models/food_item_model.dart';

class FoodController extends GetxController {
  var foodItems = <FoodItem>[
    FoodItem(
      name: 'Ayam Bakar',
      description: 'Ayam bakar yang lezat dengan bumbu rempah.',
      price: '35.000',
      rating: 5.0,
      imageUrl: 'assets/ayam_bakar.png',
    ),
    FoodItem(
      name: 'Sate Ayam',
      description: 'Sate ayam yang gurih dengan bumbu kacang.',
      price: '20.000',
      rating: 4.0,
      imageUrl: 'assets/sate_ayam.png',
    ),
  ].obs;
}
