import 'package:flutter/material.dart';

// class made by extracting the widget with lines of code that was repeating
class ReusableCard extends StatelessWidget {
  // const ReusableCard({ Key? key,}) : super(key: key);

  // creating a colour property of Color
  // using final keyword as value of colour can be assigned during run-time
  final Color colour;
  // creating a Widget type property to initialize the card with any icon or text necessary
  // ? helps making cardChild property optional to be initialized by constructor
  final Widget? cardChild;
  // creating void Function() to take value of (){} passed using onPress
  // and assigning that function to onTap
  final void Function()? onPress;
  // creating constructor to initialize colour property
  // using this keyword which has address of current object
  // the constructor has named parameters
  // required keyword is used hence on calling widget initializing value of colour must be given
  ReusableCard({required this.colour,this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    // Using GestureDetector instead of TextButton
    // because TextButton Widget changes the size of Card
    return GestureDetector(
      // Using onTap property which functions when user taps on Card
      onTap: onPress,
      child: Container(
        child: cardChild,
        // giving margin from all sides
        margin: EdgeInsets.all(15.0),
        // using BoXDecoration to add Border radius to our card
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          // in case we are using BoxDecoration()
          // color of box will be set form inside BoxDecoration
          // and not outside, else it will crash
          color: colour,
        ),
      ),
    );
  }
}