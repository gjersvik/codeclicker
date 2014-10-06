part of codeclicker;

class GameLoop{
  Stream onRender;
  bool hasResized = false;
  
  
  StreamController _render = new StreamController.broadcast(sync: true);
  
  GameLoop(){
    onRender = _render.stream;
    window.onResize.listen((_) => hasResized = true);
    window.animationFrame.then(_loop);
  }
  
  _loop(_){
    _render.add(this);
    hasResized = false;
    window.animationFrame.then(_loop);
  }
}