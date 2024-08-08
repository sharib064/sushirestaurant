import 'package:flutter/material.dart';
import 'package:sushirestaurant/models/food.dart';

class Shop extends ChangeNotifier {
  List foodItem = [
    Food(
        imagePath: 'lib/images/salmon_sushi.png',
        name: 'SALMON SUSHI',
        price: '20.99',
        rating: '4.8'),
    Food(
        imagePath: 'lib/images/many_sushi.png',
        name: 'SUSHI',
        price: '10.99',
        rating: '4.9'),
    Food(
        imagePath: 'lib/images/salmon_eggs.png',
        name: 'SALMON EGGS',
        price: '20.99',
        rating: '4.6'),
    Food(
        imagePath: 'lib/images/tuna.png',
        name: 'TUNA',
        price: '25.99',
        rating: '4.5'),
  ];
  double userTotal = 0;
  List<Food> userCart = [];
  List getFoodItem() => foodItem;
  List getUserCart() => userCart;
  void addUserCart(Food food, int quantities) {
    for (int i = 0; i < quantities; i++) {
      userCart.add(food);
      userTotal += double.parse(food.price);
    }
    notifyListeners();
  }

  double getTotal() {
    return userTotal;
  }

  void remove(Food item) {
    userCart.remove(item);
    userTotal = userTotal - double.parse(item.price);
    notifyListeners();
  }
}
