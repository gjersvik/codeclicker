part of codeclicker;

class Names{
  final Map _n = {};
  
  Names(){
   _n['tier0'] = 'Punch Cards';
   _n['tier1'] = 'Code Monkeys';
   _n['tier2'] = 'Servers';
   _n['tier3'] = 'Hackers';
   _n['tier4'] = 'Start Ups';
   _n['tier5'] = 'Clouds';
   _n['tier6'] = 'AIs';
   _n['tier7'] = 'Cosmological Computers';
  }
  
  get(String id){
    var name = _n[id];
    
    if(name == null){
      name = id;
    }
    
    return name;
  }
}