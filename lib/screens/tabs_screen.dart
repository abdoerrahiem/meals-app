import 'package:flutter/material.dart';

import '../widgets/main_drawer_widget.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/meal_model.dart';

class TabsScreen extends StatefulWidget {
  final List<MealModel> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _screens;
  int _screenIndex = 0;

  @override
  void initState() {
    _screens = [
      {
        'title': 'Categories',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Your Favorite',
        'screen': FavoritesScreen(widget.favoriteMeals),
      },
    ];

    super.initState();
  }

  void _handleTap(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_screenIndex]['title'] as String),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _screens[_screenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _handleTap,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _screenIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
