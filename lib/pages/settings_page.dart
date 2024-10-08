import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(

        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              children: [
                Text("Dark Mode",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                CupertinoSwitch(value: Provider.of<ThemeProvider>(context,listen: false).isDarkMode, onChanged: (value) {
                  Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
