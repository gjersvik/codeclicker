part of codeclicker;

class LocCounterView {
  DivElement elem;
  
  int locs = 0;
  List<String> chars = new List.filled(24, '0');
  
  List<MatrixDigitView> _digits;

  LocCounterView(this.elem) {
    _updateBoxWidth();
    _digits = elem.querySelectorAll('canvas').map((e) => new MatrixDigitView(e)).toList();
    elem.style.display = 'none';
    Timer.run((){
      elem.style.display = '';
    });
    
    chars[21] = 'L';
    chars[22] = 'o';
    chars[23] = 'c';
  }
  
  void render(GameLoop loop){
    if(loop.hasResized){
      _updateBoxWidth();
    }
    
    var list = cc.loc.toRadixString(10).split('').toList();
    list.insertAll(0, new List.filled(21 - list.length, '0'));
    chars.setRange(0, 21, list);
    
    new Map.fromIterables(chars, _digits).forEach((c, MatrixDigitView m) => m.char = c);
    _digits.forEach((m)=> m.render(loop));
  }
  
  _updateBoxWidth(){
    var boxWidth = (elem.clientWidth / 90).floor() * 10;
    print(boxWidth);
    elem.querySelectorAll('.box').style.width = '${boxWidth}px';
  }
}