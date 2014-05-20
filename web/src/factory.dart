part of codeclicker;

class Factory extends Buyable{
  final String name;
  final num baseOutput;
  final num basePrice;
  
  int own = 0;
  
  Factory(this.name, this.baseOutput, this.basePrice);
  
  int get price => (this.basePrice * (pow(1.2, own))).toInt();
  num get locs => baseOutput;
  num get output => own * locs;
  
  buy(){
    own += 1;
  }
}