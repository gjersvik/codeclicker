part of codeclicker;

class GameLoop{
  Stream onRender;
  StreamController _render = new StreamController.broadcast(sync: true);
  
  GameLoop(){
    onRender = _render.stream;
    window.animationFrame.then(_loop);
  }
  
  _loop(_){
    _render.add(null);
    window.animationFrame.then(_loop);
  }
}