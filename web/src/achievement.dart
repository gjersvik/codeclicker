part of codeclicker;

class Achievement extends Item{
  final Function _test;
  
  bool earned = false;
  
  Achievement(String name, this._test): super(name);
  
  bool test(){
    if(_test()){
      earned = true;
      return true;
    }else{
      return false;
    }
  }
}

class Achievements extends DelegatingList<Achievement>{
  double rockstarFact = 0.05;
  
  Achievements():super([]);
  
  Iterable<Achievement> get earned => where((a) => a.earned);
  Iterable<Achievement> get unerned => where((a) => !a.earned);
  
  num get rockstar => 1.0 + earned.length * rockstarFact;
  
  test() => unerned.forEach((a) => a.test());
}