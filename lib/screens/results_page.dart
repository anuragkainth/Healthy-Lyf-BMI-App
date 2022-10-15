import 'package:bmi_main/constants.dart';
import 'package:bmi_main/components/reusableCard_widget.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button_card.dart';
import 'package:bmi_main/components/comment_text_style.dart';

class ResultPage extends StatelessWidget {

  final String number ;
  final String comment ;
  final String interpretation ;

  ResultPage({required this.number,required this.comment,required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthy lyf', style: TextStyle(letterSpacing: 2.0)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommentStyle(comment: comment),
                  Text(
                    number,
                    style: kBmiTextStyle,
                  ),
                  // Bmi Scale Image
                  Container(
                    height: 34,
                    width: 362,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white),
                    ),
                    child: Image.asset('images/bmi_scale.jpg',
                        height: kImageHeight,
                        scale: kImageScale,
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kDiscTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButtonCard(onTap: (){ Navigator.pop(context); }, displayText: 'RE-CALCULATE')
        ],
      ),
    );
  }
}

