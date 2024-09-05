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
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
        height: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 25),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.person,
                    color: Theme.of(context).colorScheme.tertiary, size: 30),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            //driver details
            Column(
              children: [
                Text(
                  "Mitchy",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                Text(
                  "Driver",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.inversePrimary),
                )
              ],
            ),
            const Spacer(),
            Row(
              children: [
                //message button
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.message,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: 30),
                  ),
                ),
                //call button
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.call,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: 30),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
