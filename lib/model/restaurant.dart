import 'package:flutter/material.dart';
import 'package:food_delivery/model/cart_item.dart';
import 'package:food_delivery/model/food.dart';
import 'package:collection/collection.dart';

class Restaurant extends ChangeNotifier {
//list of food menu
  final List<Food> _menu = [
//burgers
    const Food(
        name: 'Cheese Burger',
        description: 'Cheese Burger with beef patty and cheese slice',
        image: 'lib/images/burgers/burgers (1).jpeg',
        price: 8,
        category: FoodCategory.burgers,
        addons: [
          Addon(name: 'Extra Cheese', price: 2),
          Addon(name: 'Bacon', price: 2.5),
          Addon(name: 'Mushroom', price: 3)
        ]),
    const Food(
        name: 'Mushroom Burger',
        description: 'Mushroom Burger with beef patty and swiss cheese slice',
        image: 'lib/images/burgers/burgers (2).jpeg',
        price: 8,
        category: FoodCategory.burgers,
        addons: [
          Addon(name: 'Extra Cheese', price: 2),
          Addon(name: 'Bacon', price: 2.5),
          Addon(name: 'Mushroom', price: 3)
        ]),
    const Food(
        name: 'Bacon Burger',
        description: 'Bacons Burger with beef patty and cheese slice',
        image: 'lib/images/burgers/burgers (3).jpeg',
        price: 8,
        category: FoodCategory.burgers,
        addons: [
          Addon(name: 'Extra Cheese', price: 2),
          Addon(name: 'Bacon', price: 2.5),
          Addon(name: 'Mushroom', price: 3)
        ]),
    const Food(
        name: 'Blue Cheese Burger',
        description: 'blue Cheese Burger with beef patty and mastard sauce',
        image: 'lib/images/burgers/burgers (4).jpeg',
        price: 8,
        category: FoodCategory.burgers,
        addons: [
          Addon(name: 'Extra Cheese', price: 2),
          Addon(name: 'Bacon', price: 2.5),
          Addon(name: 'Mushroom', price: 3)
        ]),
    const Food(
        name: 'Fried Onion Burger',
        description: 'Burger with beef patty and Fried Onion',
        image: 'lib/images/burgers/burgers (5).jpeg',
        price: 8,
        category: FoodCategory.burgers,
        addons: [
          Addon(name: 'Extra Cheese', price: 2),
          Addon(name: 'Bacon', price: 2.5),
          Addon(name: 'Mushroom', price: 3)
        ])

//salads

//sides

//desserts

//drinks
  ];
  //**getters
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

// ** O p e r a t i o ns
// create user cart
  final List<CartItem> _cart = [];

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //see if there is a cart item with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food and addons are the same
      bool isSameFood = item.food == food;
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });
    //if cart item exists, increment quantity
    if (cartItem != null) {
      cartItem.quantity++;
      //otherwise , add new cart item to the cart
      //add food to cart
    } else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }

    //notify listeners
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != 1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price
  double gettotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //get total items count

  int gettotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }
  //clear cart

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

// ** Helpers
  //generate receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln('Here is your receipt');
    //format the date
    final formattedDate = DateTime.now().toString().split('.')[0];
    receipt.writeln('$formattedDate');
    receipt.writeln();
    receipt.writeln('-----------------------');

    //display each cart item
    for (CartItem cartItem in _cart) {
      receipt.writeln(
          '${cartItem.food.name} x ${cartItem.quantity} (${_formatPrice(cartItem.food.price)})');
      //display addons
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln('Addons: ${_formatAddons(cartItem.selectedAddons)}');
      }
      //display price
      receipt.writeln();
      receipt.writeln('-----------------------');

      receipt.writeln('Total items : ${gettotalItemCount()}');
      receipt.writeln('Total: ${_formatPrice(gettotalPrice())}');
    }
    return receipt.toString(); // Add return statement here
  }
}

//format double value to currency
String _formatPrice(double price) {
  return '\$${price.toStringAsFixed(2)}';
}

// format list of addons to string
String _formatAddons(List<Addon> addons) {
  return addons
      .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
      .join(', ');
}
