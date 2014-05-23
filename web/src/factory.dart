part of codeclicker;

class Factory extends Item implements Buyable{
  final num baseOutput;
  final num basePrice;
  
  int own = 0;
  
  Factory(String id, this.baseOutput, this.basePrice): super(id);
  
  int get price => (this.basePrice * (pow(1.2, own))).toInt();
  num get locs => baseOutput;
  num get output => own * locs;
  
  buy(){
    own += 1;
  }
}