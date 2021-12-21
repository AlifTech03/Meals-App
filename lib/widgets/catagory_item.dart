import 'package:flutter/material.dart';
import '../pages/catagories_meals_screen.dart';

class CatagoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CatagoryItem(this.id, this.title, this.color);
  void screenCatagory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("/catagories-meals", arguments: {
      "id":id,
      "title":title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => screenCatagory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: EdgeInsets.only(top: 10, right: 5, left: 10, bottom: 10),
        padding: EdgeInsets.all(25),
        child: Text(title, style: Theme.of(context).textTheme.titleSmall),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      ),
    );
  }
}
