import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/model/food.dart';
import 'package:food_delivery/model/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({
    super.key,
    required this.food,
  }) {
    //intiallize all addons to false
    for (Addon addon in food.addons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {


  void addToCart(Food food, Map<Addon, bool> selectedAddons) {

    Navigator.pop(context);
    //
    //get selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.addons) {
      if (selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //food image
                Image.asset(
                  widget.food.image,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                //food name
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      //food description
                      Text(
                        widget.food.description,
                        style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.secondary),
                      ),

                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),

                      //addons
                      Text(
                        "Add-ons",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.food.addons.length,
                          itemBuilder: (context, index) {
                            //get individual addon
                            Addon addon = widget.food.addons[index];
                            return CheckboxListTile(
                                title: Text(
                                  addon.name,
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                subtitle: Text(
                                  "\$${addon.price}",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                value: widget.selectedAddons[addon],
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.selectedAddons[addon] = value!;
                                  });
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //button add to the cart
                MyButton(
                    text: "Add to Cart",
                    onPressed: () {
                      addToCart(widget.food, widget.selectedAddons);
                    }),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded)),
            ),
          ),
        )
      ],
    );
  }
}
