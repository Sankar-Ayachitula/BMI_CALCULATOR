import 'package:flutter/material.dart';
class CustomColumn extends StatelessWidget {

  CustomColumn({@required this.iconData,@ required this.sex});

  final IconData iconData;
  final String sex;

  @override
  Widget build(BuildContext context) {



    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Icon(iconData ,size: 80),
        SizedBox(height: 15,),
        Text(sex,style: TextStyle(fontSize: 18,color: Color(0xFF8D8E98))),
      ],
    );
  }
}