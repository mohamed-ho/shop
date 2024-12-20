import 'package:flutter/material.dart';

class AdminBottomNavigationBar extends StatelessWidget {
  const AdminBottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});
  final int currentIndex;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedIconTheme: const IconThemeData(size: 30),
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
        BottomNavigationBarItem(icon: Icon(Icons.widgets), label: 'products'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_2_sharp), label: 'profile'),
      ],
    );
  }
}
