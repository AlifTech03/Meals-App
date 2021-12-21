import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import '../model/meals.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavourite;
  final Function isFavourite;
  MealDetail(this.toggleFavourite, this.isFavourite);

  Widget ContainerText(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 100,
      width: 300,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2.0, color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(10),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal_id = ModalRoute.of(context)?.settings.arguments as String;
    final selectMeals = DUMMY_MEALS.firstWhere((item) => item.id == meal_id);
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectMeals.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectMeals.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            ContainerText(context, "Ingrediets"),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Colors.orangeAccent,
                  child: Text(selectMeals.ingredients[index]),
                ),
                itemCount: selectMeals.ingredients.length,
              ),
            ),
            ContainerText(context, "Steps"),
            buildContainer(ListView.builder(
              itemBuilder: (cts, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("# ${index + 1}"),
                    ),
                    title: Text(selectMeals.steps[index]),
                  ),
                  Divider(),
                ],
              ),
              itemCount: selectMeals.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavourite(meal_id) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavourite(meal_id),
      ),
    );
  }
}
