import 'dart:async';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_button.dart';
import 'calculator_brain.dart';
import 'bottom_button.dart';
import 'result_page.dart';

enum Gender {
  male,
  female,
}

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Color maleCardColor = kInactiveCardColor;

  Color femaleCardColor = kInactiveCardColor;

  Gender selectedGender;
  int height = 180;
  int weight = 45;
  int age = 15;

  Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'BMI Calculator',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 2),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.orange,
                  indent: 20,
                  endIndent: 20,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'SELECT GENDER',
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.normal),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ReusableCard(
                          shape: BoxShape.circle,
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.male;
                            });
                          },
                          color: selectedGender == Gender.male
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          childCard: IconContent(
                            icon: FontAwesomeIcons.male,
                            //label: 'MALE',
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          shape: BoxShape.circle,
                          onPress: () {
                            setState(
                              () {
                                selectedGender = Gender.female;
                              },
                            );
                          },
                          color: selectedGender == Gender.female
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          childCard: IconContent(
                            icon: FontAwesomeIcons.female,
                            //label: 'FEMALE',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.blue,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ReusableCard(
                            color: kInactiveCardColor,
                            shape: BoxShape.circle,
                            childCard: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'WEIGHT',
                                  style: kLabelTextStyle,
                                ),
                                Text(
                                  weight.abs().toString(),
                                  style: kNumberTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTapDown: (TapDownDetails details) {
                                        print('down');
                                        _timer = Timer.periodic(
                                            Duration(milliseconds: 100), (t) {
                                          setState(
                                            () {
                                              if (weight > 0) weight--;
                                            },
                                          );
                                          print('value $weight');
                                        });
                                      },
                                      onTapUp: (TapUpDetails details) {
                                        print('up');
                                        _timer.cancel();
                                      },
                                      onTapCancel: () {
                                        print('cancel');
                                        _timer.cancel();
                                      },
                                      child: RoundIconButton(
                                        onPressed: () {
                                          setState(() {
                                            weight--;
                                          });
                                        },
                                        icon: FontAwesomeIcons.minus,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    GestureDetector(
                                      onTapDown: (TapDownDetails details) {
                                        print('down');
                                        _timer = Timer.periodic(
                                          Duration(milliseconds: 100),
                                          (t) {
                                            setState(() {
                                              if (weight > 0) weight++;
                                            });
                                            print('value $weight');
                                          },
                                        );
                                      },
                                      onTapUp: (TapUpDetails details) {
                                        print('up');
                                        _timer.cancel();
                                      },
                                      onTapCancel: () {
                                        print('cancel');
                                        _timer.cancel();
                                      },
                                      child: RoundIconButton(
                                        onPressed: () {
                                          setState(() {
                                            weight++;
                                          });
                                        },
                                        icon: FontAwesomeIcons.plus,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            shape: BoxShape.circle,
                            childCard: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'AGE',
                                  style: kLabelTextStyle,
                                ),
                                Text(
                                  age.abs().toString(),
                                  style: kNumberTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTapDown: (TapDownDetails details) {
                                        print('down');
                                        _timer = Timer.periodic(
                                            Duration(milliseconds: 100), (t) {
                                          setState(() {
                                            if (age >= 0) age--;
                                          });
                                          print('value $age');
                                        });
                                      },
                                      onTapUp: (TapUpDetails details) {
                                        print('up');
                                        _timer.cancel();
                                      },
                                      onTapCancel: () {
                                        print('cancel');
                                        _timer.cancel();
                                      },
                                      child: RoundIconButton(
                                        onPressed: () {
                                          setState(() {
                                            age--;
                                            print('Age is decreased');
                                          });
                                        },
                                        icon: FontAwesomeIcons.minus,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    GestureDetector(
                                      onTapDown: (TapDownDetails details) {
                                        print('down');
                                        _timer = Timer.periodic(
                                            Duration(milliseconds: 100), (t) {
                                          setState(() {
                                            if (age > 0) age++;
                                          });
                                          print('value $age');
                                        });
                                      },
                                      onTapUp: (TapUpDetails details) {
                                        print('up');
                                        _timer.cancel();
                                      },
                                      onTapCancel: () {
                                        print('cancel');
                                        _timer.cancel();
                                      },
                                      child: RoundIconButton(
                                        onPressed: () {
                                          setState(() {
                                            age++;

                                            print('Age is increased');
                                          });
                                        },
                                        icon: FontAwesomeIcons.plus,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            color: kInactiveCardColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.blue,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Expanded(
                    child: ReusableCard(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0),
                      color: kInactiveCardColor,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                ' cm',
                                style: kLabelTextStyle,
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Color(0xFF8D8E98),
                              activeTrackColor: Color(0xFFFF8671),
                              thumbColor: Colors.orange,
                              overlayColor: Color(0x29EB1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 100,
                              max: 220,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BottomButton(
                    color: kBottomContainerColor,
                    width: MediaQuery.of(context).size.width / 1.1,
                    titleText: 'Calculate',
                    onTap: () {
                      CalculatorBrain calc =
                          CalculatorBrain(height: height, weight: weight);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Result(
                            bmiResult: calc.calculateBmi(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
