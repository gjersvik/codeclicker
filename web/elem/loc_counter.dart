import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('loc-counter')
class LocCounterElement extends PolymerElement {
  @published int locs = 0;
  @observable List<String> chars = new ObservableList(24);

  LocCounterElement.created() : super.created(){
    chars.fillRange(0, 24, '0');
    chars[21] = 'L';
    chars[22] = 'o';
    chars[23] = 'c';
  }
  
  void attached() => _setPrintLocs();
  
  void locsChanged() => _setPrintLocs();
  
  _setPrintLocs(){
    var list = locs.toRadixString(10).split('').toList();
    list.insertAll(0, new List.filled(21 - list.length, '0'));
    chars.setRange(0, 21, list);
  }
}