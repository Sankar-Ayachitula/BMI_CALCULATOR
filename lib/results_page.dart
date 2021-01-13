import 'package:bmi_calculator/ReusedCard.dart';

import 'constants.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult,@required this.feedback,@required this.resultText});

  final String bmiResult;
  final String resultText;
  final String feedback;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'),centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(child: Container(padding: EdgeInsets.all(15),alignment: Alignment.bottomLeft,child:Text('Your Result',style: LargeLabelTextStyle))),
          Expanded(flex:5,child: ReusedCard(
            colour:  activeColor,
            childCard: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,

              children:<Widget> [
                Text(resultText.toUpperCase(),
                style: kresultTextStyle,),
                
                Text(bmiResult,style: kBMITextStyle,),
                Text(feedback,textAlign: TextAlign.center,style: kBodyTextStyle,)
              ],
            ) ,)),
        BottomButton(buttonTitle: 'RE-CALCULATE', onTap: (){
          Navigator.pop(context);
        })
        ],
        

      ),
    );
  }
}
