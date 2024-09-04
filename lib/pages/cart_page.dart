import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_cart_tile.dart';
import 'package:food_delivery/model/cart_item.dart';
import 'package:food_delivery/model/restaurant.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final userCart = restaurant.cart;
      return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              'Are you sure you want to clear the cart?'),
                          actions: [
                            //cancel button
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            //yes
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                restaurant.clearCart();
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        );
                      });
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              )
            ],
            title: const Text('Cart'),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          body: Column(
            children: [
              userCart.isEmpty
                  ? const Expanded(
                      child: Center(
                        child: Text(
                          'Cart is empty .. ',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          //get the cart item
                          final CartItem cartItem = userCart[index];

                          //return a cart list tile
                          return MyCartTile(cartItem: cartItem);
                        },
                      ),
                    ),


                    //checkout button
           MyButton(text: "Go To Checkout", onPressed: (){}),
           const SizedBox(height: 10),
            ],
          ));
    });
  }
}
