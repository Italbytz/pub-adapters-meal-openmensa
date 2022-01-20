import 'package:meal_ports/meal_ports.dart';

class OpenMensaMealCollection implements MealCollection {
  @override
  MealCategory category;

  @override
  List<Meal> meals;

  OpenMensaMealCollection({required this.category, required this.meals});
}
