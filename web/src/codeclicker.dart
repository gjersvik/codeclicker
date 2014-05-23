part of codeclicker;

class CodeClicker{
  int loc = 0;
  double _decimal = 0.0;
  
  Stopwatch _timer = new Stopwatch()..start();
  Work worker = new Work();
  
  List<Factory> factories = [];
  List<Research> research = [];
  
  final Achievements achievements = new Achievements();
  
  CodeClicker(){
    _add('Punch Cards',1,10);
    _add('Code Monkeys',10,100);
    _add('Servers',100,1000);
    _add('Hackers',1337,31337); // 1337 and 31337
    _add('Start Ups',100000,1000000);
    _add('Clouds',10000000,100000000);
    _add('AIs',1000000000,10000000000);
    _add('Cosmological Computers',420000000000,4200000000000); // 42 someting
    
    achievements.add('Punch out (First Punch Card).',
        () => factories[0].own >= 1);
    achievements.add('Just enough for hallo world (10 Punch Card).',
        () => factories[0].own >= 10);
    achievements.add('Mainframe (25 Punch Card).',
        () => factories[0].own >= 25);
    achievements.add('Holy crap (50 Punch Card).',
        () => factories[0].own >= 50);
    achievements.add('IBM Master (100 Punch Card).',
        () => factories[0].own >= 100);
    
    research.add(new Research('Dummy1', 100, () => loc += 100));
    research.add(new Research('Dummy2', 1000, () => loc += 1000));
    research.add(new Research('Dummy3', 10000, () => loc += 10000));
    research.add(new Research('Dummy4', 100000, () => loc += 100000));
  }
  
  num get locs => factories.fold(0,(num sum, Factory fact)=>sum + fact.output)
      * achievements.rockstar;
  
  work() => addLoc(worker.line * achievements.rockstar);
  
  bool buy(Buyable product){
    if(product.price == 0) {
      return false;
    }
    if(product.price > loc){
      return false;
    }
    loc -= product.price;
    product.buy();
    return true;
  }
  
  update(){
    var sec = _timer.elapsedTicks / _timer.frequency;
    _timer.reset();
    addLoc(sec * locs);
    achievements.test();
  }
  
  addLoc(num lines){
    _decimal += lines;
    if(_decimal >= 1.0){
      var interger = _decimal.toInt();
      _decimal -= interger;
      loc += interger;
    }
  }
  
  _add(String name, int output, int price){
    factories.add(new Factory(name, output, price));
  }
}