library codeclicker;

import "dart:html";
import "dart:math";

import "package:collection/wrappers.dart";
import 'package:polymer/polymer.dart';

part "src/achievement.dart";
part "src/buyable.dart";
part "src/codeclicker.dart";
part "src/factory.dart";
part "src/item.dart";
part "src/names.dart";
part "src/research.dart";
part "src/setup.dart";
part "src/view.dart";
part "src/work.dart";

CodeClicker cc;
View view;

void main(){
  initPolymer().run(() {
    Polymer.onReady.then((_) {
      cc = new CodeClicker();
      setup(cc);
      view =  new View(cc);
      
      gameLoop([_]){
        cc.update();
        view.update();
        window.animationFrame.then(gameLoop);
      }
      
      window.animationFrame.then(gameLoop);
    });
  });
}