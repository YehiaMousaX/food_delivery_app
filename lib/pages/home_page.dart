import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_current_location.dart';
import 'package:food_delivery/components/my_description_box.dart';
import 'package:food_delivery/components/my_drawer.dart';
import 'package:food_delivery/components/my_silver_app_bar.dart';
import 'package:food_delivery/components/my_tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            MySilverAppBar(
                title: MyTabBar(tabController: _tabController),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //my current location

                    Divider(
                      color: Theme.of(context).colorScheme.secondary,
                      thickness: 5,
                    ),
                    const MyCurrentLocation(),
                 
                    const MyDescriptionBox(),
                    //description box
                  ],
                ))
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            //tab 1
            Container(
              color: Theme.of(context).colorScheme.background,
              child: Center(
                child: Text("Tab 1"),
              ),
            ),
            //tab 2
            Container(
              color: Theme.of(context).colorScheme.background,
              child: Center(
                child: Text("Tab 2"),
              ),
            ),
            //tab 3
            Container(
              color: Theme.of(context).colorScheme.background,
              child: Center(
                child: Text("Tab 3"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


