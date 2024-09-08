import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_drawer_tile.dart';
import 'package:food_delivery/pages/settings_page.dart';
import 'package:food_delivery/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() {
      final authService = AuthService();
      authService.signOut();
    }

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Divider(
                color: Theme.of(context).colorScheme.tertiary,
                thickness: 5,
              ),
            ),
            //home
            MyDrawerTile(
                title: 'H O M E',
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                }),
            MyDrawerTile(
                title: 'S E T T I N G S',
                icon: Icons.settings,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()));
                }),
            const Spacer(),
            MyDrawerTile(
                title: 'L O G O UT',
                icon: Icons.logout_rounded,
                onTap: () {
                  logout();
                }),

            //settings
            //logout
          ],
        ),
      ),
    );
  }
}
