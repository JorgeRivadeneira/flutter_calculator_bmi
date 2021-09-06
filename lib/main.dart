import 'package:flutter/material.dart';

import 'screens/input_page.dart';



void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      //theme: ThemeData.dark(),
      theme: ThemeData.dark().copyWith(
        /*
        sliderTheme: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                overlayColor: Color(0x29EB1555),
                thumbColor: Color(0xFFEB1555),
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 15.0                  
                ),
                overlayShape: 
                  RoundSliderOverlayShape(overlayRadius: 30.0)
        ), 
        */      
        primaryColor: Color(0xFF0A0E21), //OxFF representa el # para formato hexadecial
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      debugShowCheckedModeBanner: false,
      //home: InputPage(),
      initialRoute: '/',
      routes: {
        '/'         : (context) => InputPage(),
        //'/Results'  : (context) => ResultsPage()
        //'Results'   : (bu)
      },
    );
  }
}

