import 'package:flutter/material.dart';

import '../widgets/meal_widget.dart';
import '../models/meal_model.dart';

class CategoryScreen extends StatefulWidget {
  final List<MealModel> availableMeals;

  CategoryScreen(this.availableMeals);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late String title;
  late List<MealModel> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final route =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final id = route['id'];
      title = route['title'] as String;
      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(id))
          .toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  // void _removeMeal(String id) {
  //   setState(() {
  //     displayedMeals.removeWhere((meal) => meal.id == id);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Meal(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
