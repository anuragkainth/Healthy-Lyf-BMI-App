import 'package:flutter/material.dart';
import '../constants.dart';

class CardDecor extends StatelessWidget {

  final String textContent;
  final IconData iconDetails;
  CardDecor({required this.iconDetails,required this.textContent});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconDetails,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          textContent,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}