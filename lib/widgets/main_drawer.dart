import 'package:flutter/material.dart';
import 'package:meals_app/pages/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      Container(
          height: 80,
          alignment: Alignment.center,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.amber,
          ),
          child: const Text("Cooking Map",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26))),
      const SizedBox(height: 20.0),
      buildListTile("Meals", Icons.restaurant, () {
        Navigator.of(context).pushNamed('/');
      }),
      buildListTile("Filters", Icons.settings, () {
        Navigator.of(context).pushNamed(FiltersScreen.routeNmae);
      }),
    ]));
  }
}
