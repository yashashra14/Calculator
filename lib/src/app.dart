import 'package:flutter/material.dart';
import 'logic/logic.dart';

/// This screen builds the ui for the screen
/// App uses StateFul Widgets for State Management

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

/// There are 3 variable used in entire app
/// expression for String to be displayed
/// result as double for calcultions
/// and a boolean for changing textfield size on fetching results

class AppState extends State<App> {
  String expression = '0';
  dynamic result = 0;
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

        //App uses Column and Rows to build the Grid Layout
        body: Align(
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
                        // First Container for Entered expression
                        Container(
                          width: double.infinity,
                          child: Text(
                            '${expression}',
                            textScaleFactor: resultEvaluated ? 2 : 3,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color:
                                  resultEvaluated ? Colors.grey : Colors.white,
                            ),
                          ),
                        ),
                        //Second container for result
                        Container(
                          width: double.infinity,
                          child: Text(
                            '= ${result}',
                            textScaleFactor: resultEvaluated ? 3 : 2,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color:
                                  resultEvaluated ? Colors.white : Colors.grey,
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
              // App uses helper methods to build 5 rows for the grid
              buildFirstRow(calc),
              buildSecondRow(calc),
              buildThirdRow(calc),
              buildFourthRow(calc),
              buildFifthRow(calc),
            ],
          ),
        ),
      ),
    );
  }

  ///This helper method takes 2 two lists, first a list of widgets to be displayed in the grid
  ///And the other list of function which is called when the Button is pressed
  ///Observe that setState is called everytime when button is pressed
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

  ///These five build Method actually creates Row, observe how Widgets and functions
  ///are passed as a list to buildRow method

  Widget buildFirstRow(Calculator calc) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: _buildRow(
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
      child: _buildRow(
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
      child: _buildRow(
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
      child: _buildRow(
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
      child: _buildRow(
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
}
