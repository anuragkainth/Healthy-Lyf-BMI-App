import 'package:flutter/material.dart';
import 'package:bmi_main/constants.dart';

class CommentStyle extends StatelessWidget {

  final String comment;
  CommentStyle({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Text(
        comment,
        style: TextStyle(
            color: comment.compareTo('UNDERWEIGHT')==0 ? kUnderWeightColor :
            ( comment.compareTo('NORMAL')==0 ? kNormalWeightColor :
            ( comment.compareTo('OVERWEIGHT')==0 ? kOverWeightColor :
            kObeseWeightColor ) ),//Color(0xFF24D876)
            fontSize: 25.0,
            fontWeight: FontWeight.bold
        )
    );
  }
}