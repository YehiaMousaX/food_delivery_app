import 'package:flutter/material.dart';
import 'package:food_delivery/model/food.dart';

class MyQuantitySelector extends StatelessWidget {
  const MyQuantitySelector(
      {super.key,
      required this.quantity,
      required this.food,
      required this.onIncrement,
      required this.onDecrement});

  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            //decrement
            onTap: onDecrement,
            child: const Icon(Icons.remove),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: 5 ,
              child: Text(  
                quantity.toString(),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
          GestureDetector(
            //increment
            onTap: onIncrement,
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
