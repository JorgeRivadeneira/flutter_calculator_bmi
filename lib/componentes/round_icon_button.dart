import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icono, @required this.onPress});
  final IconData icono;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      
      child: Icon(icono),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      elevation: 0.0,
      disabledElevation: 6.0,
      shape: CircleBorder(
        
      ),
      /*
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      */
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPress
    );
  }
}