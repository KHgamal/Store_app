import 'package:flutter/material.dart';
class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key, this.onItemTapped, this.selectedIndex}) : super(key: key);
  final onItemTapped;
  final selectedIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex:selectedIndex, //New
      onTap: onItemTapped,
      unselectedItemColor: Colors.black87 ,
      unselectedIconTheme:const IconThemeData(color: Colors.black87) ,
      selectedIconTheme: const IconThemeData(color: Color(0xff8890bc)),
      selectedItemColor:const Color(0xff8890bc),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_rounded),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_identity_rounded),
          label: 'Profile',
        ),
      ],
    );
  }
}
