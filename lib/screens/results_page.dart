import 'package:bmi_calculator/componentes/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../componentes/reusable_card.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.icmInterpretation, 
               @required this.icmResults, 
               @required this.resultText});

  final String icmResults;
  final String icmInterpretation;
  final String resultText;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indice Masa Corporal'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Tus Resultados',
              style: KTitleTextStyle,),
            ),
          ),
          Expanded(            
            child: ReusableCard(
              colour: KActiveColor,
              cardChild: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(),
                  style: KResultTextStyle
                  ),
                  Text(icmResults,
                  style: KBMITextStyle,
                  ),
                  Text(icmInterpretation,
                  style: KBodyextStyle,
                  textAlign: TextAlign.center,)
                ],
              ),
            ),
          ),
          BottomButton(
            /*alto: 60.0,
            margenFondo: 10.0,*/
            buttonTitle: 'RE-CALCULAR',
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      )
    );
  }
}