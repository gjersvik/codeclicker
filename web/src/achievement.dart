part of codeclicker;

class Achievement{
  final String name;
  final Function _test;
  
  bool earned = false;
  
  Achievement(this.name, this._test);
  
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
  final List<Achievement> _all = new List();
  final Set<Achievement> _earned = new Set();
  final Set<Achievement> _unerned = new Set();
  
  Achievements();
  
  add(String name, bool test()){
    var a = new Achievement(name, test);
    _all.add(a);
    _unerned.add(a);
  }
  
  test(){
    var acrived = _unerned.where((a) => a.test());
    if(acrived.isNotEmpty){
      _unerned.removeAll(acrived);
      _earned.addAll(acrived);
    }
  }
}