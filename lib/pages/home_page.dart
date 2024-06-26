import 'package:flutter/material.dart';
import 'package:uizard_study_app/components/bottom_nav_bar.dart';
import 'package:uizard_study_app/const.dart';

import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// navigate Bottom Bar

  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// pages
  final List<Widget> _pages = [
    // Shop Page
    ShopPage(),

    // Cart Page
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          backgroundColor, //have to specify to the ontabchange in bottom_nav_bar
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
