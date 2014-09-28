import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('matrix-digit')
class MatrixDigitElement extends PolymerElement {
  @published String color = 'green';
  @published String char = '';
  
  CanvasRenderingContext2D _p;
  CanvasElement _c;
  
  int _w = 0;
  int _h = 0;

  MatrixDigitElement.created() : super.created();
  
  void attached(){
    super.attached();
    _c = shadowRoot.querySelector('canvas');
    _p = _c.getContext('2d');
    _paint();
  }
  
  void charChanged(){
    _paint();
  }
  
  _paint(){
    _w = clientWidth;
    _h = (_w / 3 * 5).toInt();
    
    _c.height = _h;
    _c.width = _w;
    
    _p.clearRect(0, 0, _w, _h);
    _p.fillStyle = color;
    
    if('234567890L'.contains(char)){
      _paintCell(0, 0);
    }
    if('23567890'.contains(char)){
      _paintCell(1, 0);
    }
    if('1234567890'.contains(char)){
      _paintCell(2, 0);
    }
    
    if('456890L'.contains(char)){
      _paintCell(0, 1);
    }
    // empty pixel
    if('12347890'.contains(char)){
      _paintCell(2, 1);
    }
    
    if('23456890Loc'.contains(char)){
      _paintCell(0, 2);
    }
    if('2345689oc'.contains(char)){
      _paintCell(1, 2);
    }
    if('1234567890oc'.contains(char)){
      _paintCell(2, 2);
    }
    
    if('2680Loc'.contains(char)){
      _paintCell(0, 3);
    }
    if('7'.contains(char)){
      _paintCell(1, 3);
    }
    if('13456890o'.contains(char)){
      _paintCell(2, 3);
    }
    
    if('2356890Loc'.contains(char)){
      _paintCell(0, 4);
    }
    if('23567890Loc'.contains(char)){
      _paintCell(1, 4);
    }
    if('123456890Loc'.contains(char)){
      _paintCell(2, 4);
    }
  }
  
  _paintCell(cx ,cy){
    int cw = _w ~/ 3;
    int ch = _h ~/ 5;
    var x = (cw * cx);
    var y = (ch * cy);
    var w = cw;
    if(cx == 2){
      w = _w - x;
    }
    var h = ch;
    if(cy == 5){
      h = _h - y;
    }
    
    _p.fillRect(x, y, w , h);
  }
}