
import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculatorBrain{

  CalculatorBrain({@required this.pheight,@required this.pweight});

  final pheight;
  final pweight;

  double _bmi;

  String calculateBMI(){
    _bmi= pweight/pow(pheight/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25){
      return 'Overweight';
    }
    else if(_bmi>18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String getFeedback(){
    if(_bmi>=25){
      return 'You have higher than normal body weight. Try to exercise more.';
    }
    else if(_bmi>18.5){
      return 'You have a normal body weight. Good job! ';
    }
    else{
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

}