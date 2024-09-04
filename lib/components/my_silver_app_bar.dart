import 'package:flutter/material.dart';
import 'package:food_delivery/pages/cart_page.dart';

class MySilverAppBar extends StatelessWidget {
  const MySilverAppBar({
    super.key,
    required this.child,
    required this.title,
  });
  final Widget child;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      expandedHeight: 320,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const CartPage();
            }));
          },
          icon: Icon(
            Icons.shopping_cart,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ],
      title: const Text("Sunset Diner"),
      flexibleSpace: FlexibleSpaceBar(
        title: title,
        background: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: child,
        ),
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
      ),
    );
  }
}
