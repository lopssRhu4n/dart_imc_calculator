import 'dart:io';

import 'package:imc_calculator/models/person.dart';
import 'package:imc_calculator/utils/console.dart';

class MenuController {
  List<Person> people = [];

  void basicMenu() {
    clearScreen();
    print("Welcome to the IMC calculator!");
    String selection;
    do {
      selection = readConsoleStringWithText(
          "1 - Add a new person to calculate IMC | 2 - See the registereds IMC | 3 - Exit");

      switch (selection) {
        case "1":
          addNewPerson();
          stdin.readByteSync();
          clearScreen();
          break;
        case "2":
          showRegisteredIMCs();
          stdin.readByteSync();
          clearScreen();
          break;
        case "3":
          print("Selected to exit");
          break;
        default:
          clearScreen();
          print("Invalid selection $selection");
          stdin.readByteSync();
          clearScreen();
          break;
      }
    } while (selection != "3");
  }

  void addNewPerson() {
    var P = Person();
    try {
      P.setName(getConsoleName());
      P.setHeight(getConsoleHeight());
      P.setWeight(getConsoleWeight());

      P.calculateImc();
      print(
          "${P.getName()}'s IMC is ${P.getImc()} and the classification is ${P.getClassification()}.");
      people.add(P);
    } catch (e) {
      print(e);
      print("Try again to register!");
      return;
    }
  }

  void showRegisteredIMCs() {
    if (people.isEmpty) {
      print("No one registerd Yet!");
      return;
    }

    for (var person in people) {
      print(
          "Name: ${person.getName()} - IMC: ${person.getImc()} - Classification: ${person.getClassification()}");
    }
  }

  String getConsoleName() {
    String? name;
    while (name == null) {
      name = readConsoleStringWithText("Enter with person name: ");
    }
    return name;
  }

  double getConsoleWeight() {
    double? weight;
    while (weight == null) {
      weight = readDoubleWithText("Enter with person weight: ");
    }
    return weight;
  }

  double getConsoleHeight() {
    double? height;
    while (height == null) {
      height = readDoubleWithText("Enter with person height: ");
    }
    return height;
  }
}
