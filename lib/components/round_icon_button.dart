import 'package:flutter/material.dart';
import '../constants.dart';

class roundIconButton extends StatelessWidget {

  roundIconButton({required this.icon,required this.onPressed});

  final IconData? icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.00,
      child: Icon( icon ),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor:  kWeightButtonColor,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
