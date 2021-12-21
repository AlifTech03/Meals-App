import 'package:flutter/material.dart';

import 'catagories_screen.dart';
import 'favorites_screen.dart';
import '../widgets/main_drawer.dart';
import '../model/meals.dart';

class TabScreen extends StatefulWidget {
  List<Meal> favouriteMeals;
  TabScreen(this.favouriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;
  late List<Map<String, Object>> _pagesScreen;
  @override
  void initState() {
    _pagesScreen = [
      {"page": CatagoriesScreen(), "title": "Categories"},
      {"page": FavouritesScreen(widget.favouriteMeals), "title": "Favourites"}
    ];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pagesScreen[_selectedIndex]["title"] as String),
      ),
      drawer: MainDrawer(),
      body: _pagesScreen[_selectedIndex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.pink,
              icon: Icon(Icons.category),
              label: "Categories"),
          BottomNavigationBarItem(
              backgroundColor: Colors.pink,
              icon: Icon(Icons.star),
              label: "Favourites")
        ],
        onTap: _onItemTapped,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
