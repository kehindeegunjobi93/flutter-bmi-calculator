import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage  extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultsPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: titleTextStyle,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(color: activeCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                      resultText.toUpperCase(),
                      style: resultTextStyle,
                    ),
                Text(
                    bmiResult,
                     style: BMITextStyle,
                ),
                Text(
                  interpretation,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 22.0
                ),)
              ],
            ),),
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          },
              buttonTitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
