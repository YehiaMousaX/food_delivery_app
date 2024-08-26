import 'package:flutter/material.dart';
import 'package:food_delivery/model/food.dart';

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

// ** Operations
  //add to cart
  //remove from cart
  //get total price
  //get total items
  //clear cart

// ** Helpers
  //generate receipt
  //format double value to currency
   // format list of addons to string
}
