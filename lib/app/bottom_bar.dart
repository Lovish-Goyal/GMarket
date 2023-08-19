import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_appwrite/app/modules/wishlist/wishlist.dart';
import 'package:learn_appwrite/app/modules/home/home_view.dart';
import 'package:learn_appwrite/app/router.dart';

import 'modules/myorder/my_order.dart';
import 'modules/profile/profile.dart';

class BottomNavBar extends StatefulWidget {
  final String index;
  const BottomNavBar({super.key, required this.index});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    Wishlist(),
    MyOrder(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    final currentIndex = int.tryParse(widget.index) ?? 0;
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(currentIndex),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        height: 70,
        color: const Color(0xFF4C53A5),
        backgroundColor: Colors.white,
        onTap: (index) => context.go("${RouteKey.home}?index=$index"),
        letIndexChange: (index) => true,
        items: const [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            CupertinoIcons.heart,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

List<String> tabs = [
  "home",
  "fav",
  "order",
  "profile",
];
