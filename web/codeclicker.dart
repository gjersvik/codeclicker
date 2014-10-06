library codeclicker;

import "dart:html";
import "dart:math";
import "dart:async";

import "package:collection/wrappers.dart";
import 'package:polymer/polymer.dart';

part "src/achievement.dart";
part "src/buyable.dart";
part "src/codeclicker.dart";
part "src/factory.dart";
part "src/game_loop.dart";
part "src/item.dart";
part 'src/loc_counter_view.dart';
part 'src/matrix_digit.dart';
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
      var loop =  new GameLoop();
      
      cc = new CodeClicker();
      setup(cc);
      view =  new View(cc);
      var locs = new LocCounterView(querySelector('#locs'));
      
      loop.onRender.listen((_) => cc.update());
      loop.onRender.listen((_) => view.update());
      loop.onRender.listen(locs.render);
    });
  });
}