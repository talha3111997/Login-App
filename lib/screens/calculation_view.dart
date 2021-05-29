import 'package:flutter/material.dart';

class CalculationView extends StatelessWidget {
  final int firstNum;
  final int secondNum;
  //int ans = firstNum + secondNum;
  const CalculationView({Key key, @required this.firstNum , @required this.secondNum, });

  int calculate() {
    return firstNum + secondNum;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Result of Calculation"),),
        body: Center(
          child: Text("$firstNum + $secondNum = ${calculate()}",
          style: TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}
