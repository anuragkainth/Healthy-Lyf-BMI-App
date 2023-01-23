import 'package:bmi_main/screens/history_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bmi_main/constants.dart';
import 'package:bmi_main/components/reusableCard_widget.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button_card.dart';
import 'package:bmi_main/components/comment_text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:bmi_main/bmi_result.dart';
import 'dart:convert';

class ResultPage extends StatefulWidget {
  const ResultPage(
      {Key? key,
      required this.number,
      required this.comment,
      required this.interpretation})
      : super(key: key);

  final String number;
  final String comment;
  final String interpretation;


  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool _showPopup = false;
  int count = 1;

  _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: kInactiveCardColor,
        fontSize: 16.0
    );
  }

  String _name = "Default";
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthy lyf', style: TextStyle(letterSpacing: 2.0)),
      ),
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              Column(
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
                          CommentStyle(comment: widget.comment),
                          Text(
                            widget.number,
                            style: kBmiTextStyle,
                          ),
                          // Bmi Scale Image
                          Container(
                            height: 34,
                            width: 362,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                            ),
                            child: Image.asset(
                              'images/bmi_scale.jpg',
                              height: kImageHeight,
                              scale: kImageScale,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => HistoryPage()));
                                },
                                child: Card(
                                  color: kBottomContainerColor,
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: Colors.white, width: 0.8),
                                  ),
                                  child: SizedBox(
                                    width: 110,
                                    height: 36,
                                    child: Center(
                                      child: Text(
                                        'View History',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                setState(() {
                                  _showPopup = true;
                                });
                              },
                                child: Card(
                                  color: kBottomContainerColor,
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: Colors.white, width: 0.8),
                                  ),
                                  child: SizedBox(
                                    width: 110,
                                    height: 36,
                                    child: Center(
                                      child: Text(
                                        'Save Result',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            widget.interpretation,
                            textAlign: TextAlign.center,
                            style: kDiscTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  BottomButtonCard(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      displayText: 'RE-CALCULATE'
                  )
                ],
              ),
              if (_showPopup == true)
                Container(
                  color: kInactiveCardColor.withOpacity(0.7),
                  height: double.infinity,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Container(
                        width: 300,
                        height: 180,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Enter your Name',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kInactiveCardColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextField(
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                controller: _nameController,
                                onChanged: (value) {
                                  setState(() {
                                    _name = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.black26,
                                  ),
                                  hintText: 'Full Name',
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  splashColor: Colors.white,
                                  child: Card(
                                      color: Colors.white70,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 6.0, horizontal: 15),
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                              color: kActiveCardColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13),
                                        ),
                                      )),
                                  onPressed: () {
                                    setState(() {
                                      _showPopup = false;
                                    });
                                  },
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    _saveData();
                                    setState(() {
                                      _showPopup = false;
                                    });
                                    _showToast("saved");
                                  },
                                  child: Card(
                                    color: kBottomContainerColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: SizedBox(
                                      width: 75,
                                      height: 30,
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 6.0, horizontal: 15),
                                          child: Text(
                                            'Save',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        }
      ),
    );
  }

  void _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    List<BMIResult> bmiResults = await _getBMIResults();
    final bmiResult = BMIResult(name: _name, bmi: widget.number,comment: widget.comment, date: DateFormat('dd-MM-yyyy').format(DateTime.now().toLocal()));
    bmiResults.add(bmiResult);
    prefs.setString('bmi_results', jsonEncode(bmiResults));
  }

  Future<List<BMIResult>> _getBMIResults() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString('bmi_results');
    if (json != null) {
      return (jsonDecode(json) as List).map((i) => BMIResult.fromJson(i)).toList();
    }
    return [];
  }
}
