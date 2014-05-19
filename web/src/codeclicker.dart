part of codeclicker;

class CodeClicker{
  int loc = 0;
  
  double _decimal = 0.0;
  Stopwatch _timer = new Stopwatch()..start();
  
  List<Factory> factories = [];
  
  CodeClicker(){
    factories.add(new Factory());
  }
  
  num get locs => factories.fold(0,(num sum, Factory fact) => sum + fact.output);
  
  click([_]){
    loc += 1;
  }
  
  update(){
    var sec = _timer.elapsedTicks / _timer.frequency;
    _timer.reset();
    
    _decimal += sec * locs;
    if(_decimal >= 1.0){
      var interger = _decimal.toInt();
      _decimal -= interger;
      loc += interger;
    }
  }
}