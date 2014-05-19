library codeclicker;

import "dart:html";

part "src/codeclicker.dart";
part "src/factory.dart";

CodeClicker cc;

void main() {
  cc = new CodeClicker();
  querySelectorAll(".writeline").onClick.listen(cc.click);
  querySelectorAll(".buy.tier1").onClick.listen(addlocsec);
  
  
  window.animationFrame.then(gameLoop);
}

addlocsec([_]){
  cc.factories[0].buy();
}

gameLoop([_]){
  cc.update();
  update();
  window.animationFrame.then(gameLoop);
}

update(){
  querySelectorAll(".loc").forEach((Element e){
    e.text = cc.loc.toString();
  });
  querySelectorAll(".locsec").forEach((Element e){
    e.text = cc.locs.toString();
  });
  
  querySelectorAll(".name.tier1").forEach((Element e){
    e.text = cc.factories[0].name;
  });
  querySelectorAll(".own.tier1").forEach((Element e){
    e.text = cc.factories[0].own.toString();
  });
  querySelectorAll(".locs.tier1").forEach((Element e){
    e.text = cc.factories[0].locs.toString();
  });
  querySelectorAll(".output.tier1").forEach((Element e){
    e.text = cc.factories[0].output.toString();
  });
}