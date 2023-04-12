import 'package:calculator/src/widgets/row_widget.dart';
import 'package:flutter/material.dart';
import 'logic/logic.dart';

class App extends StatelessWidget {
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
          child: CalcRow(
            expression: expression,
            result: result,
            resultEvaluated: resultEvaluated,
            calc: calc,
          ),
        ),
      ),
    );
  }
}
