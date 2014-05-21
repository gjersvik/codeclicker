part of codeclicker;

class Achievement{
  final String name;
  final Function _test;
  final Function _action;
  
  bool earned = false;
  
  Achievement(this.name, this._test, this._action);
  
  bool test(){
    var result = _test();
    if(result){
      if(earned == false){
        _action();
        earned = true;
      }
      return result;
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
  
  add(String name, bool test(), void action()){
    var a = new Achievement(name, test, action);
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