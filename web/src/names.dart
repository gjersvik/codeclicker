part of codeclicker;

class Names{
  final Map _n = {};
  
  Names(){
    // factoris
   _n['tier0'] = 'Punch Cards';
   _n['tier1'] = 'Code Monkeys';
   _n['tier2'] = 'Servers';
   _n['tier3'] = 'Hackers';
   _n['tier4'] = 'Start Ups';
   _n['tier5'] = 'Clouds';
   _n['tier6'] = 'AIs';
   _n['tier7'] = 'Cosmological Computers';
   
   _n['a_tier0_1'] = 'Punch out (First Punch Card).';
   _n['a_tier0_10'] = 'Just enough for hallo world (10 Punch Card).';
   _n['a_tier0_25'] = 'Mainframe (25 Punch Card).';
   _n['a_tier0_50'] = 'Holy crap (50 Punch Card).';
   _n['a_tier0_100'] = 'IBM Master (100 Punch Card).';
  }
  
  get(String id){
    var name = _n[id];
    
    if(name == null){
      name = id;
    }
    
    return name;
  }
}