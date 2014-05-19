library codeclicker;

import "dart:html";
import "dart:math";

part "src/codeclicker.dart";
part "src/factory.dart";
part "src/view.dart";

CodeClicker cc;
View view;

void main() {
  cc = new CodeClicker();
  view =  new View(cc);
  
  gameLoop([_]){
    cc.update();
    view.update();
    window.animationFrame.then(gameLoop);
  }
  
  window.animationFrame.then(gameLoop);
}