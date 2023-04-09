import 'package:flutter/material.dart';
import 'logic/logic.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  String expression = '0';
  double result = 0;
  bool resultEvaluated = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Calculator'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: Container(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Text(
                              '${expression}',
                              textScaleFactor: resultEvaluated ? 2 : 3,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: resultEvaluated
                                    ? Colors.grey
                                    : Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                              '= ${result}',
                              textScaleFactor: resultEvaluated ? 3 : 2,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: resultEvaluated
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(bottom: 1),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                ),
                buildFirstRow(calc),
                buildSecondRow(calc),
                buildThirdRow(calc),
                buildFourthRow(calc),
                buildFifthRow(calc),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(@required List<Widget> widgets, List<Function()> callback,
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

  Widget buildFirstRow(Calculator calc) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: _buildRow(
        [
          Text(
            'AC',
            key: Key('AC'),
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
            key: Key('%'),
            textScaleFactor: 2,
            style: TextStyle(color: Colors.amber),
          ),
          Text(
            '/',
            key: Key('/'),
            textScaleFactor: 2,
            style: TextStyle(color: Colors.amber),
          ),
        ],
        [
          calc.reset,
          calc.backSpace,
          calc.mod,
          calc.divide,
        ],
        calc,
      ),
    );
  }

  Widget buildSecondRow(Calculator calc) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: _buildRow(
        [
          Text(
            '7',
            key: Key('7'),
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '8',
            key: Key('8'),
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '9',
            key: Key('9'),
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'x',
            key: Key('x'),
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
      child: _buildRow(
        [
          Text(
            '4',
            key: Key('4'),
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '5',
            key: Key('5'),
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '6',
            key: Key('6'),
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '-',
            key: Key('-'),
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
      child: _buildRow(
        [
          Text(
            '1',
            key: Key('1'),
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '2',
            key: Key('2'),
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '3',
            key: Key('3'),
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '+',
            key: Key('+'),
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
      child: _buildRow(
        [
          Text(
            '',
            key: Key(''),
            textScaleFactor: 2,
            style: TextStyle(color: Colors.amber),
          ),
          Text(
            '0',
            key: Key('0'),
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '.',
            key: Key('.'),
            textScaleFactor: 2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '=',
            key: Key('='),
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
}
