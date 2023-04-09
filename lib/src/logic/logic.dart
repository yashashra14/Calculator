import 'package:math_expressions/math_expressions.dart';

class Calculator {
  late String expression;
  late dynamic result;
  late Parser parser;
  late Expression exp;
  late ContextModel cm;
  late bool resultEvaluated;
  Calculator() {
    expression = '0';
    result = 0;
    resultEvaluated = false;
  }
  reset() {
    resultEvaluated = false;
    expression = '0';
    result = 0;
  }

  backSpace() {
    if (expression.length > 1)
      expression = expression.substring(0, expression.length - 1);
    else if (expression.length == 1) {
      expression = '0';
    }
    getResults(fromOutside: false);
  }

  mod() {
    result = result / 100;
    expression = result.toString();
  }

  divide() {
    if (expression[expression.length - 1] == '+' ||
        expression[expression.length - 1] == '-' ||
        expression[expression.length - 1] == '/' ||
        expression[expression.length - 1] == 'x') {
      expression = expression.substring(0, expression.length - 1) + '/';
    } else {
      expression += '/';
    }
    resultEvaluated = false;
  }

  multiply() {
    if (expression[expression.length - 1] == '+' ||
        expression[expression.length - 1] == '-' ||
        expression[expression.length - 1] == 'x' ||
        expression[expression.length - 1] == '/') {
      expression = expression.substring(0, expression.length - 1) + 'x';
    } else {
      expression += 'x';
    }
    resultEvaluated = false;
  }

  minus() {
    if (expression[expression.length - 1] == '+' ||
        expression[expression.length - 1] == '-' ||
        expression[expression.length - 1] == 'x' ||
        expression[expression.length - 1] == '/') {
      expression = expression.substring(0, expression.length - 1) + '-';
    } else {
      expression += '-';
    }
    resultEvaluated = false;
  }

  plus() {
    if (expression[expression.length - 1] == '+' ||
        expression[expression.length - 1] == '-' ||
        expression[expression.length - 1] == 'x' ||
        expression[expression.length - 1] == '/') {
      expression = expression.substring(0, expression.length - 1) + '+';
    } else {
      expression += '+';
    }
    resultEvaluated = false;
  }

  decimal() {
    if (!expression.contains('.')) {
      expression += '.';
    }
    getResults(fromOutside: false);
  }

  getResults({bool fromOutside = true}) {
    String internalExp = expression.replaceAll(RegExp('x'), '*');
    parser = Parser();
    exp = parser.parse(internalExp);
    cm = ContextModel();
    result = exp.evaluate(EvaluationType.REAL, cm);
    result = double.parse(result.toStringAsFixed(11));
    resultEvaluated = fromOutside;
  }

  zero() {
    if (expression == '0' || resultEvaluated)
      expression = '0';
    else {
      expression += '0';
    }
    getResults(fromOutside: false);
  }

  one() {
    if (expression == '0' || resultEvaluated)
      expression = '1';
    else {
      expression += '1';
    }
    getResults(fromOutside: false);
  }

  two() {
    if (expression == '0' || resultEvaluated)
      expression = '2';
    else {
      expression += '2';
    }
    getResults(fromOutside: false);
  }

  three() {
    if (expression == '0' || resultEvaluated)
      expression = '3';
    else {
      expression += '3';
    }
    getResults(fromOutside: false);
  }

  four() {
    if (expression == '0' || resultEvaluated)
      expression = '4';
    else {
      expression += '4';
    }
    getResults(fromOutside: false);
  }

  five() {
    if (expression == '0' || resultEvaluated)
      expression = '5';
    else {
      expression += '5';
    }
    getResults(fromOutside: false);
  }

  six() {
    if (expression == '0' || resultEvaluated)
      expression = '6';
    else {
      expression += '6';
    }
    getResults(fromOutside: false);
  }

  seven() {
    if (expression == '0' || resultEvaluated)
      expression = '7';
    else {
      expression += '7';
    }
  }

  eight() {
    if (expression == '0' || resultEvaluated)
      expression = '8';
    else {
      expression += '8';
    }
    getResults(fromOutside: false);
  }

  nine() {
    if (expression == '0' || resultEvaluated)
      expression = '9';
    else {
      expression += '9';
    }
    getResults(fromOutside: false);
  }
}

final calc = Calculator();
