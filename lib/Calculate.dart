import 'package:flutter/material.dart';
import 'package:flutter_bmicalculator/constants.dart';
import 'package:flutter_bmicalculator/main_input.dart';

class Calculator extends StatelessWidget {

  Calculator({@required this.cal, @required this.getResult, @required this.interpretation});

  final String cal;
  final String getResult;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                child: Text('Your Result',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusable(
              color: inactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(getResult,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.lightGreen,
                    ),
                  ),
                  Text(cal,
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(interpretation,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text('RE-CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.green,
                  primary: Colors.red,
                ),

                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}




