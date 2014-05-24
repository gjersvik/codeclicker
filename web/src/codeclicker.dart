part of codeclicker;

class CodeClicker{
  int loc = 0;
  double _decimal = 0.0;
  double _workOfLocs = 0.0;
  
  Stopwatch _timer = new Stopwatch()..start();
  Work worker = new Work();
  
  Factories factories = new Factories();
  List<Research> research = [];
  
  final Achievements achievements = new Achievements();
  
  CodeClicker();
  
  num get locs => factories.locs * achievements.rockstar;
  num get perClick => (worker.line + _workOfLocs * locs) * achievements.rockstar;
  
  work() => addLoc(perClick);
  
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
}