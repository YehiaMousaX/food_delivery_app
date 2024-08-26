import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_current_location.dart';
import 'package:food_delivery/components/my_description_box.dart';
import 'package:food_delivery/components/my_drawer.dart';
import 'package:food_delivery/components/my_food_tile.dart';
import 'package:food_delivery/components/my_silver_app_bar.dart';
import 'package:food_delivery/components/my_tab_bar.dart';
import 'package:food_delivery/model/food.dart';
import 'package:food_delivery/model/restaurant.dart';
import 'package:food_delivery/pages/food_page.dart';
import 'package:provider/provider.dart';

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
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> menu) {
    return menu.where((food) => food.category == category).toList();
  }

//return list of foods for given category
  Iterable<Widget> _getFoodInThisCategory(List<Food> menu) {
    return FoodCategory.values.map((category) {
      //get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, menu);
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categoryMenu.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          //get individual food
          final food = categoryMenu[index];
          return MyFoodTile(
            food: food,
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FoodPage(food: food);
            })),
          );
        },
      );
    });
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
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) {
              return TabBarView(
                controller: _tabController,
                children: _getFoodInThisCategory(restaurant.menu).toList(),
              );
            },
          ),
        ));
  }
}
