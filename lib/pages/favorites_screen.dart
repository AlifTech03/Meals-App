import 'package:flutter/material.dart';
import '../model/meals.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;
  FavouritesScreen(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return Center(
        child: Text("You haven't added any favourites yet! Try add some."),
      );
    } else {
      return ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: favouriteMeal[index].id,
              title: favouriteMeal[index].title,
              duration: favouriteMeal[index].duration,
              imageUrl: favouriteMeal[index].imageUrl,
              affordability: favouriteMeal[index].affordability,
              complexity: favouriteMeal[index].complexity,
            );
          },
          itemCount: favouriteMeal.length,
        );
    }
  }
}
