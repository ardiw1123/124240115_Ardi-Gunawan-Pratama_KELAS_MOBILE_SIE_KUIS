import 'package:flutter/material.dart';

import 'home.dart';
import 'profile.dart';

class Root extends StatefulWidget {
  const Root({super.key});
  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [HomePage(), ProfilePage()];
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: Colors.blue,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            selectedIcon: Icon(Icons.shopping_cart, color: Colors.white),
            label: 'Barang',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            selectedIcon: Icon(Icons.person, color: Colors.white),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
