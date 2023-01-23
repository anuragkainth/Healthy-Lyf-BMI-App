import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButtonCard extends StatelessWidget {

  final String displayText;
  final void Function() onTap;

  BottomButtonCard({required this.onTap, required this.displayText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (onTap),
      child: Container(
        child: Center(
          child: Text(
            displayText,
            style: kBottomButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        // We made a const variable at top as value of height of
        // this container will remain same all the time
        height: kBottomContainerHeight,
      ),
    );
  }
}
