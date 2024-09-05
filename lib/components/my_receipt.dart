

import 'package:flutter/material.dart';
import 'package:food_delivery/model/restaurant.dart';
import 'package:provider/provider.dart';


class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Center(
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Thank you for your order!",
              style: TextStyle(fontSize: 15),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20),
              child: Consumer<Restaurant>(
                builder: (context , restaurant , child)
                =>
                Text(restaurant.displayCartReceipt()),
              )
            ),
            const SizedBox(height: 20),
            const Text(
              "Estimated delivery time: 30 minutes",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
