import 'dart:math';
class CalculatorBrain{
  CalculatorBrain({this.altura, this.peso});
  final int altura;
  final int peso;
  double _icm;
  

  String calculoICM(){
    _icm = peso / pow(altura/100, 2);
    return _icm.toStringAsFixed(1);
  }

  String getResults(){
    if(_icm >= 40){
      return 'Obesidad Mórbida';
    }
    else if(_icm >= 35 && _icm < 40){
      return 'Obesidad Media';
    }
    else if(_icm >= 30 && _icm < 35){
      return 'Obesidad Leve';
    }
    else if(_icm >= 25 && _icm < 30){
      return 'Pre-obeso';
    }
    else if(_icm >= 18.5 && _icm < 25){
      return 'Normal';
    }  
    else if(_icm >= 17 && _icm < 18.5){
      return 'Delgadez Leve';
    }      
    else if(_icm >= 16 && _icm < 17){
      return 'Delgadez Moderada';
    } 
    else if(_icm < 16){
      return 'Delgadez Severa';
    }       
    return null;
  }

  String getInterpretation(){
    if(_icm >= 25){
      return 'Tu peso es más de lo normal, consulta con un nutricionista y haz más ejecricio';
    }
    else if(_icm >= 18.5 && _icm < 25){
      return 'Tienes el peso correcto. Buen Trabajo!';
    }  
    else if(_icm >= 17 && _icm < 18.5){
      return 'Tienes el peso menos de lo normal, aliméntate mejor';   
    }
    return null;
  }
}