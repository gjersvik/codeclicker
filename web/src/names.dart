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
   
   _n['r_work_x2_0'] = 'Double Spaced (2x lines per click)';
   _n['r_work_x2_1'] = 'Copy Paste (2x lines per click)';
   _n['r_work_x2_2'] = 'Auto complete (2x lines per click)';
   _n['r_work_x4_0'] = 'Compiler (4x lines per click)';
   _n['r_work_x4_1'] = 'Macros (4x lines per click)';
   _n['r_work_x4_2'] = 'Code Generation (4x lines per click)';
   _n['r_work_x10_0'] = 'Viratual Macine (10x lines per click)';
   _n['r_work_x10_1'] = 'Functinal Programming (10x lines per click)';

   _n['r_work_locs_0'] = 'Examples. (+1% locs per click)';
   _n['r_work_locs_1'] = 'Api doumenation. (+1.5% locs per click)';
   _n['r_work_locs_2'] = 'Design patterns. (+2.5% locs per click)';
   _n['r_work_locs_3'] = 'View Source. (+5% locs per click)';
   _n['r_work_locs_4'] = 'Opensource. (+5% locs per click)';
   _n['r_work_locs_5'] = 'Great artists steal. (+10% locs per click)';
   
   _n['r_tier0_x2_0'] = 'Port-A-Punch. (x2 Punch Cards output)';
   _n['r_tier0_x2_1'] = 'Keypunches. (x2 Punch Cards output)';
   _n['r_tier0_x2_2'] = 'Card Verifier. (x2 Punch Cards output)';
   _n['r_tier0_x4_0'] = 'Sorting Machine. (x4 Punch Cards output)';
   
   _n['r_tier1_x2_0'] = 'Code gorillas. (x2 Code Monkeys output)';
   _n['r_tier1_x2_1'] = 'Rugged keyboards (x2 Code Monkeys output)';
   _n['r_tier1_x2_2'] = 'Premium bananas. (x2 Code Monkeys output)';
   _n['r_tier1_x4_0'] = 'Save the rainforest. (x4 Code Monkeys output)';
   
   _n['r_tier2_x2_0'] = 'Racks (x2 Servers output)';
   _n['r_tier2_x2_1'] = 'Water cooling (x2 Servers output)';
   _n['r_tier2_x2_2'] = 'Virtualization (x2 Servers output)';
   _n['r_tier2_x4_0'] = 'Blade servers (x4 Servers output)';
   
   _n['r_tier3_x2_0'] = 'Crackers. (x2 Hackers output)';
   _n['r_tier3_x2_1'] = 'Exploit kits. (x2 Hackers output)';
   _n['r_tier3_x2_2'] = 'Guy Fawkes masks. (x2 Hackers output)';
   _n['r_tier3_x4_0'] = 'Anonymous. (x4 Hackers output)';
   
   _n['r_tier4_x2_0'] = 'Coffee shops. (x2 Start Ups output)';
   _n['r_tier4_x2_1'] = 'Flavor of the month buzzwords. (x2 Start Ups output)';
   _n['r_tier4_x2_2'] = 'Hipster tech. (x2 Start Ups output)';
   _n['r_tier4_x4_0'] = 'Silicon valley. (x4 Start Ups output)';
   
   _n['r_tier5_x2_0'] = 'Software as a service. (x2 Clouds output)';
   _n['r_tier5_x2_1'] = 'Platform as a service. (x2 Clouds output)';
   _n['r_tier5_x2_2'] = 'Infrastructure as a service. (x2 Clouds output)';
   _n['r_tier5_x4_0'] = 'Service as a service. (x4 Clouds output)';
   
   _n['r_tier6_x2_0'] = 'Machine learning. (x2 AIs output)';
   _n['r_tier6_x2_1'] = 'Artificial Brains. (x2 AIs output)';
   _n['r_tier6_x2_2'] = 'Quantum computing. (x2 AIs output)';
   _n['r_tier6_x4_0'] = 'Self replication. (x4 AIs output)';
   
   _n['r_tier7_x2_0'] = 'Universe in a box.  (x2 Cosmological Computers output)';
   _n['r_tier7_x2_1'] = 'Artificial universe. (x2 Cosmological Computers output)';
   _n['r_tier7_x2_2'] = 'Big bang as a service. (x2 Cosmological Computers output)';
   _n['r_tier7_x4_0'] = 'Multiple multiversees (x4 Cosmological Computers output)';
 
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