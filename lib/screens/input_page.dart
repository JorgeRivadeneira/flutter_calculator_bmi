import 'package:bmi_calculator/componentes/bottom_button.dart';
import 'package:bmi_calculator/componentes/icon_content.dart';
import 'package:bmi_calculator/componentes/reusable_card.dart';
import 'package:bmi_calculator/componentes/round_icon_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import '../constants.dart';




enum Genero {Masculino, Femenino}

/*
ThemeData(
        primaryColor: Color(0xFF0A0E21), //OxFF representa el # para formato hexadecial
        accentColor: Colors.deepPurple,
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.white)
        )
      ),
*/      
class InputPage extends StatefulWidget {
  
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  /*Color maleCardColour = inactiveColor;
  Color femaleCardColour = inactiveColor;*/
  Genero _genero;
  int _altura = 160;
  int _peso = 60;
  int _edad = 30;
  

  /*
  1 = hombre
  2 = mujer
  */ 
  /*
  void updateColor(Genero genero){
    setState(() {
      if(genero == Genero.Masculino){
        if(maleCardColour == inactiveColor){
          maleCardColour = activeColor;
          femaleCardColour = inactiveColor;

          //maleCardColour == inactiveColor ? maleCardColour = activeColor : femaleCardColour = inactiveColor;
        }else{
          maleCardColour = inactiveColor;
          femaleCardColour = activeColor;
        }
      }  
      if(genero == Genero.Femenino){
        if(femaleCardColour == inactiveColor){
          maleCardColour = inactiveColor;
          femaleCardColour = activeColor;
        }else{
          maleCardColour = activeColor;
          femaleCardColour = inactiveColor;
        }
      }           
    });
  }*/
  

  @override
  Widget build(BuildContext context) {
    var _deviceData = MediaQuery.of(context);
    return Scaffold(
      
      appBar: AppBar(
        
        title: Text('CALCULADORA IMC'),
      ),
      body: getRectangulos(context, _deviceData.size.height),

    );
  }

Widget getRectangulos(BuildContext context, double altoPantalla){
  double azulejos   = altoPantalla * 18 / 100;
  double scrollH    = altoPantalla * 32 / 100;
  double boton      = altoPantalla * 12 / 100;
  double fondo      = altoPantalla * 2  / 100;
  print(altoPantalla);

  return Column(
    //crossAxisAlignment: CrossAxisAlignment.stretch,
    //mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Expanded(child: Row(
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                height: azulejos,
                onPress: (){
                  setState(() {
                    _genero = Genero.Masculino;
                  });
                },
                colour: 
                _genero == Genero.Masculino ? 
                            KActiveColor : 
                            KInactiveColor,
                //cardChild: IconContent(FontAwesomeIcons.mars,'Hombre'),
                cardChild: iconContent(
                  FontAwesomeIcons.mars, 
                  'HOMBRE'),
              )          
            ),
            Expanded(
              child: ReusableCard(
                height: azulejos,
                onPress: (){
                  setState(() {
                    _genero = Genero.Femenino;
                  });
                },
                colour: _genero == Genero.Femenino ? KActiveColor : KInactiveColor,
                cardChild: IconContent(FontAwesomeIcons.venus,'MUJER'),)        
            ),
          ],
        ),
      ),
      Expanded(child: 
        ReusableCard(          
          height: scrollH,
          colour: KInactiveColor,
          cardChild: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('ALTURA: ', style:  KLabelText,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  _altura.toString(),
                  style: KNumerosStyle
                ),
                Text(
                  'cm',
                  style: KLabelText,
                ),

              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: Color(0xFF8D8E98),
                activeTrackColor: Colors.white,
                overlayColor: Color(0x29EB1555),
                thumbColor: Color(0xFFEB1555),
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 15.0                  
                ),
                overlayShape: 
                  RoundSliderOverlayShape(overlayRadius: 30.0)
              ),
              child: Slider(
                value: _altura.toDouble(),
                min: 120.0,
                max: 220.0,
                //activeColor: Colors.white,
                //inactiveColor: Color(0xFF8D8E98),
                onChanged: (double nuevoValor){
                  setState(() {
                    _altura = nuevoValor.round(); 
                  });
                },
              ),
            )            
           ],
        ),)
      ),      
      Expanded(child: Row(
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                height: azulejos,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('PESO',
                    style: KLabelText,),
                    Text(
                      _peso.toString(),
                      style: KNumerosStyle
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icono: FontAwesomeIcons.minus,
                          onPress: (){
                            setState(() {
                              _peso--;
                            });
                          },
                        ),
                        SizedBox(width: 20.0,),
                        RoundIconButton(
                          icono: FontAwesomeIcons.plus,
                          onPress: (){
                            setState(() {
                              _peso++;
                            });
                          },
                        ),                       
                      ],
                    )
                  ],
                ),
                colour: KInactiveColor)
            ),            
            Expanded(
              child: ReusableCard(
                height: azulejos,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('EDAD',
                    style: KLabelText,),
                    Text(
                      _edad.toString(),
                      style: KNumerosStyle
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icono: FontAwesomeIcons.minus,
                          onPress: (){
                            setState(() {
                              _edad--;
                            });
                          },
                        ),
                        SizedBox(width: 20.0,),
                        RoundIconButton(
                          icono: FontAwesomeIcons.plus,
                          onPress: (){
                            setState(() {
                              _edad++;
                            });
                          },
                        ),                       
                      ],
                    )
                  ],
                ),                
                colour: KInactiveColor
              )
            ),           
          ],
        ),
      ),  
      BottomButton(
        /*margenFondo: fondo,
        alto: boton,*/
        onTap: (){
          CalculatorBrain calculoICM = CalculatorBrain(
            altura: _altura,
            peso: _peso
            );

          //Navigator.pushNamed(context, '/Results');
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => ResultsPage(
                icmResults: calculoICM.calculoICM() ,
                icmInterpretation: calculoICM.getInterpretation() ,
                resultText: calculoICM.getResults(),
              )
            )
          );
        },
        buttonTitle: 'Calcular',
      ),          
    ]
  );

}  
}


