import 'package:calculator/src/logic/logic.dart';
import 'package:flutter/material.dart';

class CalcRow extends StatefulWidget {
  String? expression;
  dynamic result;
  bool? resultEvaluated;
  Calculator? calc;
  CalcRow({
    this.expression,
    this.result,
    this.resultEvaluated,
    this.calc,
  });
  @override
  State<StatefulWidget> createState() => CalcState(
        expression: expression,
        result: result,
        resultEvaluated: resultEvaluated,
        calc: calc,
      );
}

class CalcState extends State<CalcRow> {
  String? expression;
  dynamic result;
  bool? resultEvaluated;
  Calculator? calc;

  CalcState({
    this.expression,
    this.result,
    this.resultEvaluated,
    this.calc,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    children.add(
      Expanded(
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // First Container for Entered expression
                Container(
                  width: double.infinity,
                  child: Text(
                    '${expression}',
                    textScaleFactor: resultEvaluated! ? 2 : 3,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: resultEvaluated! ? Colors.grey : Colors.white,
                    ),
                  ),
                ),
                //Second container for result
                Container(
                  width: double.infinity,
                  child: Text(
                    '= ${result}',
                    textScaleFactor: resultEvaluated! ? 3 : 2,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: resultEvaluated! ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    children.add(
      Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: 1),
        margin: EdgeInsets.symmetric(horizontal: 20),
      ),
    );
    children.addAll(
      [
        buildFirstRow(calc!),
        buildSecondRow(calc!),
        buildThirdRow(calc!),
        buildFourthRow(calc!),
        buildFifthRow(calc!),
      ],
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: children,
    );
  }

  Widget buildFirstRow(Calculator calc) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: buildRow(
        [
          Text(
            'AC',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.amber),
          ),
          Container(
            key: Key('_'),
            child: Icon(
              Icons.backspace,
            ),
          ),
          Text(
            '%',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.amber),
          ),
          Text(
            '/',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.amber),
          ),
        ],
        [
          calc.reset,
          calc.backSpace,
          calc.percentage,
          calc.divide,
        ],
        calc,
      ),
    );
  }

  Widget buildSecondRow(Calculator calc) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: buildRow(
        [
          Text(
            '7',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '8',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '9',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'x',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.amber),
          ),
        ],
        [
          calc.seven,
          calc.eight,
          calc.nine,
          calc.multiply,
        ],
        calc,
      ),
    );
  }

  Widget buildThirdRow(Calculator calc) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: buildRow(
        [
          Text(
            '4',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '5',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '6',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '-',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.amber),
          ),
        ],
        [
          calc.four,
          calc.five,
          calc.six,
          calc.minus,
        ],
        calc,
      ),
    );
  }

  Widget buildFourthRow(Calculator calc) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: buildRow(
        [
          Text(
            '1',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '2',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '3',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '+',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.amber),
          ),
        ],
        [
          calc.one,
          calc.two,
          calc.three,
          calc.plus,
        ],
        calc,
      ),
    );
  }

  Widget buildFifthRow(Calculator calc) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: buildRow(
        [
          Text(
            '',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.amber),
          ),
          Text(
            '0',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '.',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '=',
            textScaleFactor: 2,
            style: TextStyle(color: Colors.amber),
          ),
        ],
        [
          () {},
          calc.zero,
          calc.decimal,
          calc.getResults,
        ],
        calc,
      ),
    );
  }

  Widget buildRow(@required List<Widget> widgets, List<Function()> callback,
      Calculator calc) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {
              setState(callback[0]);
              setState(() {
                expression = calc.expression;
                result = calc.result;
                resultEvaluated = calc.resultEvaluated;
              });
            },
            style: TextButton.styleFrom(primary: Colors.amber),
            child: widgets[0],
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {
              setState(callback[1]);
              setState(() {
                expression = calc.expression;
                result = calc.result;
                resultEvaluated = calc.resultEvaluated;
              });
            },
            style: TextButton.styleFrom(primary: Colors.amber),
            child: widgets[1],
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {
              setState(callback[2]);
              setState(() {
                expression = calc.expression;
                result = calc.result;
                resultEvaluated = calc.resultEvaluated;
              });
            },
            style: TextButton.styleFrom(primary: Colors.amber),
            child: widgets[2],
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {
              setState(callback[3]);
              setState(() {
                expression = calc.expression;
                result = calc.result;
                resultEvaluated = calc.resultEvaluated;
              });
            },
            style: TextButton.styleFrom(primary: Colors.amber),
            child: widgets[3],
          ),
        ),
      ],
    );
  }
}
