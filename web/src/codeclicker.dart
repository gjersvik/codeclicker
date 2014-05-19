part of codeclicker;

class CodeClicker{
  int loc = 0;
  
  double _decimal = 0.0;
  Stopwatch _timer = new Stopwatch()..start();
  
  List<Factory> factories = [];
  
  CodeClicker(){
    _add('Punch Cards',1,10);
    _add('Code Monkeys',10,100);
    _add('Servers',100,1000);
    _add('Hackers',1337,31337); // 1337 and 31337
    _add('Start Ups',100000,1000000);
    _add('Clouds',10000000,100000000);
    _add('AIs',1000000000,10000000000);
    _add('Cosmological Computers',420000000000,4200000000000); // 42 someting
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
  
  _add(String name, int output, int price){
    factories.add(new Factory(name, output, price, this));
  }
}