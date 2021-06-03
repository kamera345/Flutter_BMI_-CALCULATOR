
import 'dart:math';

import 'package:flutter/cupertino.dart';

class ResultOut {

  ResultOut({@required this.height, @required this.weight});

  final int height;
  final int weight;

  double _bmi;

  String Cal(){

    _bmi = weight/ pow( height / 100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String GetResult(){

    if(_bmi >=25){
      return 'OverWeight';
    }
    else if(_bmi>18.8){
      return 'Normal';
    }
    else{
      return 'UnderWeight';
    }
  }

  String Interpretation(){
    if(_bmi >=25){
      return 'You have a higher than normal body weight. Try to exercise more.';
    }
    else if(_bmi>18.8){
      return 'You have a normal body weight';
    }
    else{
      return 'You have a lower normal body weight. You can eat bit more';
    }
  }

}