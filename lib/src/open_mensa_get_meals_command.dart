import 'package:meal_ports/meal_ports.dart';
import 'package:open_mensa_meal_adapters/open_mensa_meal_adapters.dart';
import 'package:open_mensa_meal_adapters/src/open_mensa_meal.dart';
import 'package:open_mensa_meal_adapters/src/open_mensa_meal_collection.dart';

class OpenMensaGetMealsCommand implements GetMealsCommand {
  @override
  Future<List<MealCollection>> execute(MealQuery inDTO) async {
    var source = OpenMensaMealDataSource(inDTO.mensa, inDTO.date);
    return source.retrieveAll().then((meals) {
      var collections = <MealCategory, MealCollection>{};
      for (var meal in meals) {
        var category = meal.category;
        if (collections[category] == null) {
          collections[category] = OpenMensaMealCollection(
              category: category, meals: <OpenMensaMeal>[]);
        }
        collections[category]?.meals.add(meal);
      }
      return collections.values.toList();
    });
  }
}
