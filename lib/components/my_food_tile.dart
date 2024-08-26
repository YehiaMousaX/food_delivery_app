import 'package:flutter/material.dart';
import 'package:food_delivery/model/food.dart';

class MyFoodTile extends StatelessWidget {
  const MyFoodTile({super.key, required this.food, this.onTap});
  final Food food;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                //Food text deatils
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        '\$${food.price}',
                        style: TextStyle(
                            fontSize: 15,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        food.description,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15)
,                //Food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.asset(
                    food.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          thickness: 2,
          endIndent: 25,
          indent: 25,
        )
      ],
    );
  }
}
