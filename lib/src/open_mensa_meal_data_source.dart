import 'package:common_ports/common_ports.dart';
import 'package:meal_ports/meal_ports.dart';
import 'package:open_mensa_infrastructure/open_mensa_infrastructure.dart';
import 'package:open_mensa_meal_adapters/src/open_mensa_meal.dart';
import 'package:open_mensa_meal_adapters/src/open_mensa_price.dart';

class OpenMensaMealDataSource implements DataSource<int, Meal> {
  int mensa;
  DateTime date;
  var api = OpenMensaAPI();

  OpenMensaMealDataSource(this.mensa, this.date);

  @override
  Future<Meal> retrieve(int id) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Meal>> retrieveAll() async =>
      api.getMeals(mensa, date).then((meals) => meals.map((meal) {
            var category = MealCategory.dish;
            switch (meal.category) {
              case "Desserts":
                category = MealCategory.dessert;
                break;
              case "Beilagen":
                category = MealCategory.sidedish;
                break;
            }
            return OpenMensaMeal(
                name: meal.name,
                price: OpenMensaPrice(
                    employees: meal.prices.employees,
                    others: meal.prices.others,
                    pupils: meal.prices.pupils,
                    students: meal.prices.students),
                allergens: Allergens.none,
                additives: Additives.none,
                category: category);
          }).toList());
}
