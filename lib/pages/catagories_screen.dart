import "package:flutter/material.dart";
import '../dummy_data.dart';
import '../widgets/catagory_item.dart';

class CatagoriesScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return 
      GridView(
          padding:const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map((catData) => CatagoryItem(catData.id,catData.title, catData.color))
              .toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20)
    );
  }
}
