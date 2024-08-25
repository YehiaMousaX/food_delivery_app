import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    var myPrimaryTextStyle = TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 12,
        fontWeight: FontWeight.bold);
    var mySecondaryTextStyle = TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary,
        fontSize: 12,
        fontWeight: FontWeight.bold);
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 1,
          )),
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          //delivery fee
          Column(
            children: [
              Text(
                "\$99.2",
                style: mySecondaryTextStyle,
              ),
              Text("Delivery Fee", style: myPrimaryTextStyle),
            ],
          ),
          Column(
            children: [
              Text("15-30 min", style: mySecondaryTextStyle),
              Text("Delivery Time", style: myPrimaryTextStyle),
            ],
          )
        ]),
      ),
    );
  }
}
