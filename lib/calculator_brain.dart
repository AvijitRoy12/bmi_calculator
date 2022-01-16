import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorBrain{

  CalculatorBrain({this.height,this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBmi(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25) {
      return 'Overweight';
    }
    else if(_bmi> 18 ){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi> 25){
      return 'You have a higher than normal body weight. Try more exercise';}
    else if(_bmi>=18){
      return 'You have a perfect weight, Good job';
    }
    else{
      return 'You have a lower than normal body weight, Try eat a more';
    }
  }
}