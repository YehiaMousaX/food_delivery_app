import 'package:flutter/material.dart';
import 'package:food_delivery/model/food.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key, required this.food});
  final Food food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(widget.food.image),
        ],
      ),
    );
  }
}
