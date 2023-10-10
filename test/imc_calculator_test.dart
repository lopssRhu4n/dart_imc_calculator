import 'package:imc_calculator/models/person.dart';
import 'package:test/test.dart';

void main() {
  group("Person Inputs", () {
    var P = Person();
    test("Person set name validation", () {
      Map<String, String> validations = {
        "Aj": "Name must be bigger than 2 letters",
        "": "Name can't be empty!"
      };
      validations.forEach((entry, message) {
        expect(
            () => P.setName(entry),
            throwsA(
                predicate((e) => e is ArgumentError && e.message == message)));
      });
    });

    test("Person set height validation", () {
      Map<double, String> validations = {
        0.99: "Height can't be lower than 1m!",
        2.5: "Height can't be bigger than 2.4m!"
      };
      validations.forEach((entry, message) {
        expect(
            () => P.setHeight(entry),
            throwsA(
                predicate((e) => e is ArgumentError && e.message == message)));
      });
    });

    test("Person set weight validation", () {
      Map<double, String> validations = {
        34: "Weight can't be lower than 35kg!",
        180.1: "Weight can't be bigger than 180kg!"
      };
      validations.forEach((entry, message) {
        expect(
            () => P.setWeight(entry),
            throwsA(
                predicate((e) => e is ArgumentError && e.message == message)));
      });
    });
  });

  group("IMC related tests", () {
    test("Testing IMC formula", () {
      var P = Person();
      P.setHeight(2);
      P.setWeight(80);
      P.calculateImc();
      expect(P.getImc(), 20);
    });

    test("IMC classification", () {
      Map<String, Map<String, double>> vals = {
        "Healthy": {'h': 2.0, 'w': 80},
        "Serious Thinness": {'h': 2.0, 'w': 63},
        "Moderated Thinness": {'h': 2.0, 'w': 67},
      };
      var P = Person();
      vals.forEach((classification, entries) {
        P.setHeight(entries['h'] as double);
        P.setWeight(entries['w'] as double);
        P.calculateImc();
        expect(P.getClassification(), classification);
      });
    });
  });
}
