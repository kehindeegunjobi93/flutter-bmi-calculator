import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                color: selectedGender == Gender.male ? activeCardColor : inActiveCardColor,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.mars,
                  label: 'MALE',),
                ),
              ),
              Expanded(child:ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                color: selectedGender == Gender.female ? activeCardColor : inActiveCardColor,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.venus,
                  label: 'FEMALE',
                ),
              )),
            ],
          )),
          Expanded(child: ReusableCard(
            color: activeCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: numberStyle
                    ),
                    Text(
                      'cm',
                      style: labelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0xFFEB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                  ),
                    child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });

                    })
                )
              ],
            ),
          )),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  color: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT', style: labelTextStyle,),
                      Text(weight.toString(),
                      style: numberStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                          onPressed: (){
                              setState(() {
                                weight--;
                              });
                          },),
                          SizedBox(width: 10.0,),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },),
                        ],
                      ),

                    ],
                  ),
                ),
                ),
              Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Age',
                        style: labelTextStyle,
                        ),
                        Text(age.toString(), style: numberStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                age--;
                              });
                            },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            },
                            )
                          ],
                        )
                      ],
                    ),
                  )
              ),
            ],
          )),
          BottomButton(buttonTitle: 'CALCULATE',
            onTap: () {
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                );
              }));
            },)
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}






