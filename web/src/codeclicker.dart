part of codeclicker;

class CodeClicker{
  int loc = 0;
  
  double _decimal = 0.0;
  Stopwatch _timer = new Stopwatch()..start();
  
  List<Factory> factories = [];
  
  CodeClicker(){
    factories.add(new Factory('Punch Cards',1));
    factories.add(new Factory('Code Monkeys',10));
    factories.add(new Factory('Servers',100));
    factories.add(new Factory('Hackers',1337)); // 1337 and 31337
    factories.add(new Factory('Start Ups',100000));
    factories.add(new Factory('Clouds',10000000));
    factories.add(new Factory('AIs',1000000000));
    factories.add(new Factory('Cosmological Computers',420000000000)); // 42 someting
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