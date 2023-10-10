import 'dart:convert';
import 'dart:io';

String readConsoleStringWithText(String text) {
  print(text);
  return stdin.readLineSync(encoding: utf8) ?? " ";
}

String readConsole() {
  return stdin.readLineSync(encoding: utf8) ?? " ";
}

double? readDouble() {
  var val = readConsole();
  try {
    return double.parse(val);
  } catch (e) {
    return null;
  }
}

double? readDoubleWithText(String text) {
  print(text);
  var val = readConsole();
  try {
    return double.parse(val);
  } catch (e) {
    return null;
  }
}

double? readDoubleWithTextAndExit(String text, String exit) {
  String val;
  do {
    val = readConsoleStringWithText(text);
    try {
      return double.parse(val);
    } catch (e) {
      if (val == exit) return null;
      print("Valor $val inválido!");
    }
  } while (true);
}

void clearScreen() {
  print("\x1B[2J\x1B[0;0H");
}
