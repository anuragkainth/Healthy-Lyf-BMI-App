import 'package:flutter/material.dart';
import 'package:bmi_main/constants.dart';
import 'package:bmi_main/components/reusableCard_widget.dart';
import '../components/bottom_button_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bmi_main/bmi_result.dart';
import 'dart:convert';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  @override
  void initState() {
    super.initState();
    _loadData();
  }
  List<BMIResult> _bmiResults = [];
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
                'Your History',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kInactiveCardColor,
              cardChild: _bmiResults.isEmpty
                  ? Center(child: Text('No History to display'))
                  : ListView.separated(
                      itemCount: _bmiResults.length,
                      itemBuilder: (BuildContext context, int index) {
                        final bmiResult = _bmiResults[index];
                        return ListTile(
                          leading: Text((index+1).toString() + '.'),
                          title: Text('${bmiResult.name}'),
                          subtitle: Text('BMI: ${bmiResult.bmi} | ${bmiResult.comment} | ${bmiResult.date}'),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                    ),
            ),
          ),
          ReusableCard(
            colour: kInactiveCardColor,
            cardChild: Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: FloatingActionButton(
                onPressed: _clearHistory,
                backgroundColor: kBottomContainerColor,
                foregroundColor: kInactiveCardColor,
                child: Icon(
                    Icons.delete,
                  color: kInactiveCardColor,
                ),
              ),
            ),
          ),
          BottomButtonCard(
              onTap: () {
                Navigator.pop(context);
              },
              displayText: 'GO TO BACK SCREEN')
        ],
      ),
    );
  }
  void _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString('bmi_results');
    if (json != null) {
      final bmiResults = (jsonDecode(json) as List).map((i) => BMIResult.fromJson(i)).toList();
      setState(() {
        _bmiResults = bmiResults;
      });
    }
  }

  void _clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('bmi_results');
    setState(() {
      _bmiResults = [];
    });
  }
}

