part of codeclicker;

setup(CodeClicker cc){
  var factories = [
    new Factory('tier0',1,10),
    new Factory('tier1',10,100),
    new Factory('tier2',100,1000),
    new Factory('tier3',1337,31337), // 1337 and 31337
    new Factory('tier4',100000,1000000),
    new Factory('tier5',10000000,100000000),
    new Factory('tier6',1000000000,10000000000),
    new Factory('tier7',420000000000,4200000000000) // 42 someting
  ];
  cc.factories.addAll(factories);

  var research = [
    new Research('r_work_x2_0', 100, () => cc.worker.researchFactor *= 2),
    new Research('r_work_x2_1', 500, () => cc.worker.researchFactor *= 2),
    new Research('r_work_x2_2', 1000, () => cc.worker.researchFactor *= 2),
    new Research('r_work_x4_0', 40000, () => cc.worker.researchFactor *= 4),
    new Research('r_work_x4_1', 400000, () => cc.worker.researchFactor *= 4),
    new Research('r_work_x4_2', 4000000, () => cc.worker.researchFactor *= 4),
    new Research('r_work_x10_0', 100000000, () => cc.worker.researchFactor *= 10),
    new Research('r_work_x10_1', 100000000000, () => cc.worker.researchFactor *= 10),
    
    new Research('r_work_locs_0', 256, () => cc._workOfLocs += 0.01),
    new Research('r_work_locs_1', 2560, () => cc._workOfLocs += 0.015),
    new Research('r_work_locs_2', 25600, () => cc._workOfLocs += 0.025),
    new Research('r_work_locs_3', 2560000, () => cc._workOfLocs += 0.05),
    new Research('r_work_locs_4', 256000000, () => cc._workOfLocs += 0.05),
    new Research('r_work_locs_5', 25600000000, () => cc._workOfLocs += 0.1)
  ];
  cc.research.addAll(research);
  
  var factoryResearch = factories.expand((Factory f){
    return [
      new Research('r_${f.id}_x2_0', f.basePrice * 100 , () => f.research *= 2),
      new Research('r_${f.id}_x2_1', f.basePrice * 1000, () => f.research *= 2),
      new Research('r_${f.id}_x2_2', f.basePrice * 10000, () => f.research *= 2),
      new Research('r_${f.id}_x4_0', f.basePrice * 100000, () => f.research *= 4)
    ];
  });
  cc.research.addAll(factoryResearch);
  
  var rockstarResearch = [
    new Research('r_rockstar_0', 31337, () => cc.achievements.rockstarFact += 0.05),
    new Research('r_rockstar_1', 3133731337, () => cc.achievements.rockstarFact += 0.05),
    new Research('r_rockstar_2', 313373133731337, () => cc.achievements.rockstarFact += 0.05),
  ];
  cc.research.addAll(rockstarResearch);
  
  
  
  var achievements = [
    
  ];
  cc.achievements.addAll(achievements);
  
  var factoryAchievements = factories.expand((Factory f){
    var list = [1, 10, 25, 50, 100];
    return list.map((int i) => new Achievement('a_${f.id}_$i', () => f.own >= i));
  });

  cc.achievements.addAll(factoryAchievements);
}