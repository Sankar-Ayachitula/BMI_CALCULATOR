import 'dart:ui';
import 'package:flutter/painting.dart';
import 'bottom_button.dart';
import 'results_page.dart';
import 'ReusedCard.dart';
import 'Customcolumn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';



class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color firstCardColor=Color(0xFF1D1E33);
  Color secondCardColor=Color(0xFF1D1E33);
  int height=180;
  int weight=60;
  int age= 18;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF1D1E33);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        firstCardColor=primaryColor;
                        secondCardColor= secondaryColor;
                      });
                    },
                    child: ReusedCard(
                      colour: firstCardColor,
                      childCard:CustomColumn(iconData: FontAwesomeIcons.mars,sex: 'Male',) ,),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: GestureDetector(
                  onTap: (){
                    setState(() {
                      secondCardColor=primaryColor;
                      firstCardColor= secondaryColor;
                    });
                  },
                    child: ReusedCard(colour: secondCardColor,
                    childCard: CustomColumn(iconData: FontAwesomeIcons.venus,sex: 'Female',),),
                  )
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child:ReusedCard(
              colour: primaryColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                    Text('Height', style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text(height.toString(),style: kNumberTextStyle),
                        Text('cm',style: kLabelTextStyle)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          trackHeight: 2,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white ,
                          overlayColor: Color(0x29EB1555),
                          thumbColor: Color(0xFFEB1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(value: height.toDouble(),onChanged: (double newValue){
                          setState(() {
                            height= newValue.toInt();
                          });
                      },



                      min: 120,max: 220
                      ),
                    )

                ],
              )

            )
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ReusedCard(
                    colour: primaryColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Weight', style: kLabelTextStyle),
                        Text(weight.toString(),style:kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(iconData: FontAwesomeIcons.minus,
                              function: (){
                              setState(() {
                                weight--;
                              });
                              },),
                            SizedBox(width: 10,),
                            RoundIconButton(iconData: FontAwesomeIcons.plus,
                                function: (){
                                  setState(() {
                                    weight++;
                                  });
                                })
                          ],
                        )
                      ],
                    )),
                ),

                Expanded(
                  flex: 1,
                  child:ReusedCard(
                      colour: primaryColor,childCard:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Age', style: kLabelTextStyle),
                      Text(age.toString(),style:kNumberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(iconData: FontAwesomeIcons.minus,
                            function: (){
                              setState(() {
                                age--;
                              });
                            },),
                          SizedBox(width: 10,),
                          RoundIconButton(iconData: FontAwesomeIcons.plus,
                              function: (){
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      )
                    ],
                  ),),
                ),
              ],
            ),
          ),

          BottomButton(buttonTitle: 'CALCULATE',onTap: (){

            CalculatorBrain calc= CalculatorBrain(pheight: height,pweight: weight);
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultsPage(bmiResult: calc.calculateBMI(),resultText: calc.getResult(),feedback: calc.getFeedback(),) ),
            );
          },)



        ],
      ),

    );
  }
}








