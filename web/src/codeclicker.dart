part of codeclicker;

class CodeClicker{
  int loc = 0;
  double _decimal = 0.0;
  double _workOfLocs = 0.0;
  
  Stopwatch _timer = new Stopwatch()..start();
  Work worker = new Work();
  
  List<Factory> factories = [];
  List<Research> research = [];
  
  final Achievements achievements = new Achievements();
  
  CodeClicker(){
    _add('tier0',1,10);
    _add('tier1',10,100);
    _add('tier2',100,1000);
    _add('tier3',1337,31337); // 1337 and 31337
    _add('tier4',100000,1000000);
    _add('tier5',10000000,100000000);
    _add('tier6',1000000000,10000000000);
    _add('tier7',420000000000,4200000000000); // 42 someting
    
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
    
    research.add(new Research('work_x2_1', 100, () => worker.researchFactor *= 2));
    research.add(new Research('work_x2_2', 500, () => worker.researchFactor *= 2));
    research.add(new Research('work_x2_3', 1000, () => worker.researchFactor *= 2));
    research.add(new Research('work_x4_1', 40000, () => worker.researchFactor *= 4));
    research.add(new Research('work_x4_2', 400000, () => worker.researchFactor *= 4));
    research.add(new Research('work_x4_3', 4000000, () => worker.researchFactor *= 4));
    research.add(new Research('work_x10_1', 100000000, () => worker.researchFactor *= 10));
    research.add(new Research('work_x10_2', 100000000000, () => worker.researchFactor *= 10));
    
    research.add(new Research('work_locs_1', 256, () => _workOfLocs += 0.01));
    research.add(new Research('work_locs_1', 2560, () => _workOfLocs += 0.015));
    research.add(new Research('work_locs_1', 25600, () => _workOfLocs += 0.025));
    research.add(new Research('work_locs_1', 2560000, () => _workOfLocs += 0.05));
    research.add(new Research('work_locs_1', 256000000, () => _workOfLocs += 0.05));
    research.add(new Research('work_locs_1', 25600000000, () => _workOfLocs += 0.1));
  }
  
  num get locs => factories.fold(0,(num sum, Factory fact)=>sum + fact.output)
      * achievements.rockstar;
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
  
  _add(String id, int output, int price){
    factories.add(new Factory(id, output, price));
  }
}