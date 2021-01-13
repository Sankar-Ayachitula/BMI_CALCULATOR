import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({@required this.buttonTitle,@required this.onTap});

  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.only(top: 10),
        color: pinkColor,
        width: double.infinity,
        height: 70,
        child: Center(child: Text(buttonTitle,style: kLargeButtonLabelTextStyle,)),
      ),
    );
  }
}