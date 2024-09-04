import 'package:food_delivery/model/food.dart';

class CartItem {
  Food food;
  int quantity;
  List<Addon> selectedAddons = [];

  CartItem({required this.food, this.quantity = 1, required this.selectedAddons});

  double get totalPrice {
    double addonsPrice = selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonsPrice) * quantity;
  }
}
 