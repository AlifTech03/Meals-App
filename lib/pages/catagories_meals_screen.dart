import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

import '../model/meals.dart';
import '../widgets/meal_item.dart';

class CatagoryMealsScreen extends StatefulWidget {
  static const routeName = "/catagories-meals";
  final List<Meal> availableMeals;
  CatagoryMealsScreen(this.availableMeals);

  @override
  State<CatagoryMealsScreen> createState() => _CatagoryMealsScreenState();
}

class _CatagoryMealsScreenState extends State<CatagoryMealsScreen> {
  // final String id;
  @override
  Widget build(BuildContext context) {
    final routeArgs = 
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final catagoryId = routeArgs["id"];
    final catagoryTitle = routeArgs["title"];
    final catagoryMeals = widget.availableMeals.where((element) {
      return element.categories.contains(catagoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(catagoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: catagoryMeals[index].id,
              title: catagoryMeals[index].title,
              duration: catagoryMeals[index].duration,
              imageUrl: catagoryMeals[index].imageUrl,
              affordability: catagoryMeals[index].affordability,
              complexity: catagoryMeals[index].complexity,
            );
          },
          itemCount: catagoryMeals.length,
        ));
  }
}
