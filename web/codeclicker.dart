library codeclicker;

import "dart:html";

part "src/codeclicker.dart";
part "src/factory.dart";
part "src/view.dart";

CodeClicker cc;
View view;

void main() {
  cc = new CodeClicker();
  view =  new View();
  querySelectorAll(".writeline").onClick.listen(cc.click);
  querySelectorAll(".buy.tier1").onClick.listen(addlocsec);
  
  
  window.animationFrame.then(gameLoop);
}

addlocsec([_]){
  cc.factories[0].buy();
}

gameLoop([_]){
  cc.update();
  view.update(cc);
  window.animationFrame.then(gameLoop);
}