import 'dart:math';

class Person {
  String _name = "";
  double _height = 0;
  double _weight = 0;
  double _imc = 0;
  String _classification = "";

  void calculateImc() {
    _imc = _weight / pow(_height, 2);
    defineClassification();
  }

  void defineClassification() {
    if (_imc < 16) {
      _classification = "Serious Thinness";
    } else if (_imc < 17) {
      _classification = "Moderated Thinness";
    } else if (_imc < 18.5) {
      _classification = "Small Thinness";
    } else if (_imc < 25) {
      _classification = "Healthy";
    } else if (_imc < 30) {
      _classification = "OverWeight";
    } else if (_imc < 35) {
      _classification = "Obesity 1";
    } else if (_imc < 40) {
      _classification = "Obesity 2";
    } else {
      _classification = "Obesity 3";
    }
  }

  double getHeight() {
    return _height;
  }

  double getImc() {
    return _imc;
  }

  String getName() {
    return _name;
  }

  double getWeight() {
    return _weight;
  }

  String getClassification() {
    return _classification;
  }

  void setHeight(double h) {
    if (h < 1) {
      throw ArgumentError("Height can't be lower than 1m!");
    }
    if (h > 2.4) {
      throw ArgumentError("Height can't be bigger than 2.4m!");
    }
    _height = h;
  }

  void setName(String n) {
    if (n == "") {
      throw ArgumentError("Name can't be empty!");
    }

    if (n.length < 3) {
      throw ArgumentError("Name must be bigger than 2 letters");
    }
    _name = n;
  }

  void setWeight(double w) {
    if (w < 35) {
      throw ArgumentError("Weight can't be lower than 35kg!");
    }
    if (w > 180) {
      throw ArgumentError("Weight can't be bigger than 180kg!");
    }
    _weight = w;
  }
}
