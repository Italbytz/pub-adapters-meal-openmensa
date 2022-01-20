import 'package:meal_ports/meal_ports.dart';

class OpenMensaPrice implements Price {
  @override
  double? employees;

  @override
  double? others;

  @override
  double? pupils;

  @override
  double? students;

  OpenMensaPrice({this.employees, this.others, this.pupils, this.students});
}
