import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeNmae = "/fliters-meals";
  final Map<String, bool> currrentFilters;
  final Function setfilters;
  FiltersScreen(this.currrentFilters, this.setfilters);
  
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  @override
    initState() {
    bool? _glutenFree = widget.currrentFilters['gluten'];
    bool? _lactoseFree = widget.currrentFilters['lactose'];
    bool? _vegan = widget.currrentFilters['vegan'];
    bool? _vegetarian = widget.currrentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildFilter(String title, String description, bool currentValue,
      void Function(bool) updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text("Filter"), actions: [
        IconButton(
            onPressed: () {
              final filters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget.setfilters(filters);
            },
            icon: Icon(Icons.save))
      ]),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(15),
              child: Text(
                "Adjut your meal selection",
                style: Theme.of(context).textTheme.titleSmall,
              )),
          Expanded(
              child: ListView(
            children: [
              _buildFilter("Gluton-free", "Only Gluton-free meals", _glutenFree,
                  (newval) {
                setState(() {
                  _glutenFree = newval;
                });
              }),
              _buildFilter("Lactose-free", "Only Lactose-free meals", _lactoseFree,
                  (newval) {
                setState(() {
                  _lactoseFree = newval;
                });
              }),
              _buildFilter("Vegan", "Only Vegan meals", _vegan, (newval) {
                setState(() {
                  _vegan = newval;
                });
              }),
              _buildFilter("Vegetarian", "Only Vegetarian meals", _vegetarian,
                  (newval) {
                setState(() {
                  _vegetarian = newval;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
