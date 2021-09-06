import 'package:flutter/material.dart';

import '../constants.dart';
import 'icon_content.dart';
class BottomButton extends StatelessWidget {
  
  final Function  onTap;
  final String    buttonTitle;
  /*final double    margenFondo;
  final double    alto;*/

  BottomButton({@required this.onTap, 
  @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(        
        padding: EdgeInsets.only(bottom: 10.0),
        child: Center(
          child: Text(
            buttonTitle,
            style: KLargeButtonTextStyle,
          ),
        ),
        color: KBottomColor,
        height: bottomHeight,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
      ),
    );
  }
}