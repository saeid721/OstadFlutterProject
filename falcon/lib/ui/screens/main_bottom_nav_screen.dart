import 'package:flutter/material.dart';
import 'falcon_home_screen.dart';
import 'service_items_list_screen.dart';
import 'product_name_list_details.dart';
import 'project_pictures_screen.dart';
import 'Customer_List_Screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    FalconHomeScreen(),
    ServiceItemsListScreen(),
    ProductNameScreen(),
    ProjectPicturesScreen(),
    CustomerListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _selectedIndex = index;
          setState(() {});
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.redeem), label: 'Services'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Products'),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections), label: 'Pictures'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add), label: 'Customer'),
        ],
      ),
    );
  }
}
