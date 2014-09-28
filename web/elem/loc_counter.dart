import 'package:polymer/polymer.dart';

@CustomTag('loc-counter')
class LocCounterElement extends PolymerElement {
  @published int locs = 0;
  @observable List<String> chars = toObservable(new List.filled(24, '0'));

  LocCounterElement.created() : super.created(){
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