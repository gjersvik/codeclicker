part of codeclicker;

class Factory{
  CodeClicker cc;
  
  final String name;
  final num baseOutput;
  final num basePrice;
  
  int own = 0;
  
  Factory(this.name, this.baseOutput, this.basePrice, this.cc);
  
  int get price => (this.basePrice * (pow(1.2, own))).toInt();
  num get locs => baseOutput;
  num get output => own * locs;
  
  bool get canBuy => cc.loc >= price;
  
  buy(){
    if(canBuy){
      cc.loc -= price;
      own += 1;
    }
  }
}