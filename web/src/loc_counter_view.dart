part of codeclicker;

class LocCounterView {
  DivElement elem;
  
  int locs = 0;
  List<String> chars = new List.filled(24, '0');

  LocCounterView(this.elem) {
    chars[21] = 'L';
    chars[22] = 'o';
    chars[23] = 'c';
  }
  
  void render(_){
    var list = cc.loc.toRadixString(10).split('').toList();
    list.insertAll(0, new List.filled(21 - list.length, '0'));
    chars.setRange(0, 21, list);
    
    elem.querySelectorAll('matrix-digit').asMap().forEach((i, Element e) => e.attributes['char'] = chars[i]);
  }
}