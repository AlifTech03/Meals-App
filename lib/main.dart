import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/pages/filters_screen.dart';

import 'pages/tab_screen.dart';
import 'pages/catagories_screen.dart';
import 'pages/catagories_meals_screen.dart';
import 'pages/meal_detail_item.dart';
import 'model/meals.dart';

void main() {
  debugPrintEndFrameBanner = false;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _favouriteMeals = [];
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isFavourite(String id) {
    return _favouriteMeals.any((element) => element.id == id);
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] == true && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !element.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: "RaleWay",
          primarySwatch: Colors.pink,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              titleSmall: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontFamily: "RaleWay",
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              bodySmall: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontFamily: "RobotoCondensed"))),
      initialRoute: '/',
      routes: {
        "/": (ctx) => TabScreen(_favouriteMeals),
        CatagoryMealsScreen.routeName: (ctx) =>
            CatagoryMealsScreen(_availableMeals),
        MealDetail.routeName: (ctx) =>
            MealDetail(_toggleFavourite, _isFavourite),
        FiltersScreen.routeNmae: (ctx) => FiltersScreen(_filters, _setFilters)
      },
    );
  }
}
