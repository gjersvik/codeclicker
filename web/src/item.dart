part of codeclicker;

class Item{
  String name = 'Tier1';
  int own= 0;
  double locs = 1.0;
  
  double get output => own * locs;
  
  buy(){
    own += 1;
  }
}