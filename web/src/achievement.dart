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

class Achievements{
  final List<Achievement> all = new List();
  final Set<Achievement> _earned = new Set();
  final Set<Achievement> _unerned = new Set();
  
  Achievements();
  
  num get rockstar => 1.0 + _earned.length * 0.05;
  
  add(String name, bool test()){
    var a = new Achievement(name, test);
    all.add(a);
    _unerned.add(a);
  }
  
  test(){
    var acrived = _unerned.where((a) => a.test()).toSet();
    if(acrived.isNotEmpty){
      _unerned.removeAll(acrived);
      _earned.addAll(acrived);
    }
  }
}