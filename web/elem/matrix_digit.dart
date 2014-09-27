import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('matrix-digit')
class MatrixDigitElement extends PolymerElement {
  @published String color = 'green';
  @published String char = '';
  
  CanvasRenderingContext2D _p;

  MatrixDigitElement.created() : super.created();
  
  void attached(){
    _p = (shadowRoot.querySelector('canvas') as CanvasElement).getContext('2d');
    //_paint();
  }
  
  void charChanged() => _paint();
  
  _paint(){
    _p.clearRect(0, 0, 3, 5);
    _p.fillStyle = color;
    
    if('234567890L'.contains(char)){
      _p.fillRect(0, 0, 1, 1);
    }
    if('23567890'.contains(char)){
      _p.fillRect(1, 0, 1, 1);
    }
    if('1234567890'.contains(char)){
      _p.fillRect(2, 0, 1, 1);
    }
    
    if('456890L'.contains(char)){
      _p.fillRect(0, 1, 1, 1);
    }
    // empty pixel
    if('12347890'.contains(char)){
      _p.fillRect(2, 1, 1, 1);
    }
    
    if('23456890Loc'.contains(char)){
      _p.fillRect(0, 2, 1, 1);
    }
    if('2345689oc'.contains(char)){
      _p.fillRect(1, 2, 1, 1);
    }
    if('1234567890oc'.contains(char)){
      _p.fillRect(2, 2, 1, 1);
    }
    
    if('2680Loc'.contains(char)){
      _p.fillRect(0, 3, 1, 1);
    }
    if('7'.contains(char)){
      _p.fillRect(1, 3, 1, 1);
    }
    if('13456890o'.contains(char)){
      _p.fillRect(2, 3, 1, 1);
    }
    
    if('2356890Loc'.contains(char)){
      _p.fillRect(0, 4, 1, 1);
    }
    if('23567890Loc'.contains(char)){
      _p.fillRect(1, 4, 1, 1);
    }
    if('123456890Loc'.contains(char)){
      _p.fillRect(2, 4, 1, 1);
    }
  }
}