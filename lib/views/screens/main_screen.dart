import 'package:flutter/material.dart';
import 'package:mac_store_app_flutter/views/screens/nav_screens/account_screen.dart';
import 'package:mac_store_app_flutter/views/screens/nav_screens/cart_sceren.dart';
import 'package:mac_store_app_flutter/views/screens/nav_screens/favotite_screen.dart';
import 'package:mac_store_app_flutter/views/screens/nav_screens/home_screen.dart';
import 'package:mac_store_app_flutter/views/screens/nav_screens/store_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageInex = 2;

  final List<Widget> _pages = [
    FavotiteScreen(),
    StoreScreen(),
    HomeScreen(),
    CartSceren(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _pageInex,
        onTap: (value) {
          setState(() {
            _pageInex = value;
          });
        },
        
        items: [
          BottomNavigationBarItem(
            
              icon: Image.asset(
                "assets/icons/love.png",
                width: 25,
              ),
              label: "علاقه مندی"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/mart.png",
                width: 25,
              ),
              label: "فروشگاه"),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/home.png",
              width: 30,
            ),
            label: "خانه",
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/cart.png",
                width: 25,
              ),
              label: "سبد خرید"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/user.png",
                width: 25,
              ),
              label: "پروفایل"),
        ],
      ),
      body: _pages[_pageInex],
    );
  }
}
