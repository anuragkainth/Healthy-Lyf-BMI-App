import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/history_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // removing debug banner
      // Giving Theme to our App
      // here we used default dark theme but did some changes in
      // it as per our requirements using .copyWith() widget
      theme: ThemeData.dark().copyWith(
          // giving color to primary and secondary components of app
          colorScheme: ColorScheme.light(primary: Color(0xff0a0e15)), // #233045 // 0xff0A0D22
          // giving background color to our app
          scaffoldBackgroundColor: Color(0xff0a0e15), // color using hex code
          // giving color to text in our app
      ),
      home: InputPage(),
    );
  }
}