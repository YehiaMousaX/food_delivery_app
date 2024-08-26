import 'package:flutter/material.dart';
import 'package:food_delivery/model/food.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key, required this.tabController});

  final TabController tabController;
  List<Tab> _buildCategoriesTabs() {
    return FoodCategory.values
        .map((category) => Tab(text: category.toString().split('.').last))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(controller: tabController, tabs: _buildCategoriesTabs());
  }
}
