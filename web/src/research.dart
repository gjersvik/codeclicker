part of codeclicker;

class Research extends Buyable{
  final String name;
  final Function _effect;
  
  int price;
  
  Research(this.name, this.price, this._effect);
  
  buy(){
    _effect();
    price == 0;
  }
}