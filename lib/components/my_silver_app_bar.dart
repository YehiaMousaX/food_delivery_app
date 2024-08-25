import 'package:flutter/material.dart';

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
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ],
      title: Text("Sunset Diner"),
      flexibleSpace: FlexibleSpaceBar(
        title: title,
        background: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: child,
        ),
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
      ),
    );
  }
}
