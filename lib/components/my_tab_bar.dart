import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key , required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: TabBar(
        controller: tabController,
        tabs: const [
         Tab(
          icon: Icon(Icons.home),
         ),

         Tab(
          icon: Icon(Icons.settings),
         ),
         
         Tab(
          icon: Icon(Icons.person),
         )
        ],
       ),
    );
  }
}