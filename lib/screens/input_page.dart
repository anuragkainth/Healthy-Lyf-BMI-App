import 'package:bmi_main/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusableCard_widget.dart';
import '../components/cardDecor_widget.dart';
import '../constants.dart';
import '../components/round_icon_button.dart';
import 'results_page.dart';
import '../components/bottom_button_card.dart';
import 'package:bmi_main/calculation_bmi.dart';

// Using Enums to make code more readable
// Enums work like bool but can have multiple name values
enum Gender{ male, female, }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  // making a Gender(Enum type) variable to use ternary operator to change card color
  // by using ? variable does not ask to initialize the variable
  Gender? selectedGender;
  int height = 175  ;
  int weight = 73;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.green,
        title: Center(
          child: Text('Healthy Lyf', style: TextStyle(letterSpacing: 2.0) ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // Building Columns for Cards that include info like male,female,age,etc..
        children: [
          // Creating First Row for first 2 Cards
          Expanded(
            child: Row(
              children:  [
                // CARD - 1
                Expanded(
                  // Using ReusableCard Widget made by us
                  child: ReusableCard(
                    // we have integrated onTap function inside ReusableCard
                    // passing void (){} function to onPressed property of ReusableCard
                    onPress: (){
                      // SetState performs the work inside curly braces
                      // and refreshes the entire stateful widget with changes done
                      setState(() {
                        // when the card is tapped selectedGender changes to male
                        // and hence color gets updated as per code below
                        selectedGender = Gender.male;
                      });
                    },
                    // using ternary operator to make code shorter and easily readable
                    // if selectedGender is male this card color gets dark
                    // if selectedGender is female this card color gets light
                    // INITIALLY ITS NOT MALE HENCE CARD WILL BE OF INACTIVE(DARK)COLOR
                    colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                    // Using cardDecor Widget made by us
                    cardChild: CardDecor(
                      iconDetails: FontAwesomeIcons.mars,
                      textContent: 'Male',
                    ),
                  ),
                ),
                // CARD - 2
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    // if selectedGender is female this card color gets dark
                    // if selectedGender is male this card color gets light
                    // INITIALLY ITS NOT FEMALE HENCE CARD WILL BE OF INACTIVE(DARK)COLOR
                    colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                    cardChild: CardDecor(
                      iconDetails: FontAwesomeIcons.venus,
                      textContent: 'Female',
                    ),
                  ),
                ),
              ],
            ),
            // CREATING MIDDLE CARD - 3
          ),
          Expanded(
            child: ReusableCard(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  // Slider Theme Widget used to set theme for our slider
                  // SliderTheme has child Slider in which there actual functionality of slider
                  SliderTheme(
                    // SliderTheme takes data property as required
                    // Here we have used default Theme of Slider with some specific changes
                    // by using .copyWith widget
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kSliderThumbColor,
                      activeTrackColor: kSliderActiveColor,
                      trackHeight: 1.0,
                      inactiveTrackColor: kSliderInactiveColor,
                      // 0x29 here 29 is amount of transparency i.e
                      // more transparent than FF
                      overlayColor: kSliderOverlayColor,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    // Slider Widget has actual functionality of our slider
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      // activeColor: kSliderActiveColor, // mentioned in SliderTheme widget above
                      // inactiveColor: kSliderInactiveColor, // mentioned in SliderTheme widget above
                      // .
                      // when we move slider to a new value it gives that value to function below
                      // where we give the newValue to height variable inside setState Widget
                      // setState gives that value to 'value' and refresh our stateful widget
                      // hence we see our slider moving to a new value as we drag it
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          // CREATING LAST TWO CARDS
          Expanded(
            child: Row(
              children: [
                // CARD - 4
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight (kg)',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            roundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){ setState(() { weight--; });
                              },
                            ),
                            SizedBox(width: 10.0),
                            roundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){ setState(() { weight++; });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // CARD - 5
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            roundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){ setState(() { age--; });
                              },
                            ),
                            SizedBox(width: 10.0),
                            roundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){ setState(() { age++; });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButtonCard(
              onTap: (){
                CalculateBmi calc = CalculateBmi(height: height, weight: weight);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultPage(
                      number: calc.bmiCalculation(),
                      comment: calc.getResults(),
                      interpretation: calc.getInterpret()
                    )));
              },
              displayText: 'CALCULATE BMI')
        ],
      ),
    );
  }
}


