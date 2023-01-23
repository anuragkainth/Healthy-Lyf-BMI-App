import 'package:flutter/material.dart';
import 'dart:convert';

class BMIResult{
  String? name;
  String? bmi;
  String? date;
  String? comment;

  BMIResult({this.name, this.bmi, this.date, this.comment});

  BMIResult.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        bmi = json['bmi'],
        date = json['date'],
        comment = json['comment'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'bmi': bmi,
        'date': date,
        'comment' : comment
      };
}
