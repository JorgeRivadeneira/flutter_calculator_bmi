import 'package:flutter/material.dart';

import '../constants.dart';
const bottomHeight = 80.0;


Widget iconContent(IconData icono, String texto){
return SafeArea(
  child:   Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icono,
            size: 80.0,),
            SizedBox(height: 5.0,),
            Text(
              texto,
              style: KLabelText,
            )                
          ],
        ),
);  
}

class IconContent extends StatelessWidget {
  final IconData icono;
  final String texto;

  IconContent(this.icono, this.texto);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icono,
          size: 80.0,),
          SizedBox(height: 5.0,),
          Text(
            texto,
            style: TextStyle(fontSize: 18.0, 
            color: Color(0xFF8D8E98))
          )                
        ],
      );
  }
}

