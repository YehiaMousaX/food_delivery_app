import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_receipt.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Progress'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: const Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }
}
