import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_quantity_selector.dart';
import 'package:food_delivery/model/cart_item.dart';

import 'package:food_delivery/model/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  const MyCartTile({super.key, required this.cartItem});
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, child) => Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(7),
                color: Theme.of(context).colorScheme.secondary,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //food image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Image.asset(cartItem.food.image,
                              width: 80, height: 80, fit: BoxFit.cover),
                        ),

                        //name and price
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cartItem.food.name,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontSize: 15)),
                            Text('\$${cartItem.totalPrice}',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 15)),
                          ],
                        ),

                        const Spacer(
                          flex: 2,
                        ),

                        // + / - quantity
                        MyQuantitySelector(
                          quantity: cartItem.quantity,
                          food: cartItem.food,
                          onIncrement: () => restaurant.addToCart(
                              cartItem.food, cartItem.selectedAddons),
                          onDecrement: () =>
                              restaurant.removeFromCart(cartItem),
                        ),
                      ],
                    ),
                  ),
                  //addons
                  SizedBox(
                    height: cartItem.selectedAddons.isNotEmpty ? 50 : 0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      children: cartItem.selectedAddons
                          .map(
                            (addons) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: FilterChip(
                                label: Row(
                                  children: [
                                    Text(addons.name,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        )),
                                    Text(' (+\$${addons.price})',
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary)),
                                  ],
                                ),
                                shape: StadiumBorder(
                                  side: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                                onSelected: (value) {},
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                labelStyle: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 15),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            ));
  }
}
