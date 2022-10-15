import 'dart:math';

class CalculateBmi{

  CalculateBmi({required this.height, required this.weight});
  final int height;
  final int weight;

  // creating private variable using _
  // can only be assessed by members of class
  double _bmi = 18.3;

  String bmiCalculation(){

    _bmi = weight / pow(height/100, 2);

    // will return the bmi in string with one decimal precision
    return _bmi.toStringAsFixed(1);
  }

  String getResults(){

    if(_bmi >= 30){
      return 'OBESE';
    }if(_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if(_bmi >18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpret(){

    if(_bmi >= 30){
      return 'Your Weight is Very High, \nExercise More :(';
    } else if(_bmi >= 25) {
      return 'Your Weight is Higher than Normal, \nExercise little More :(';
    } else if(_bmi >18.5) {
      return 'WOW! Your Weight is Normal, \nGreat Job :)';
    } else {
      return 'Your Weight is Less than Normal, \nEat More :(';
    }
  }

}