library codeclicker;

import "dart:html";

part "src/codeclicker.dart";

CodeClicker cc;

void main() {
  cc = new CodeClicker();
  querySelectorAll(".writeline").onClick.listen(cc.click);
  querySelectorAll(".addlocsec").onClick.listen(addlocsec);
  
  
  window.animationFrame.then(gameLoop);
}

addlocsec([_]){
  cc.locsec += 1;
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
    e.text = cc.locsec.toString();
  });
}