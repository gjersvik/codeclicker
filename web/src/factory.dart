part of codeclicker;

class Factory{
  final String name;
  final num base;
  
  int own = 0;
  
  Factory(this.name, this.base);
  
  num get locs => base;
  num get output => own * locs;
  
  buy(){
    own += 1;
  }
}