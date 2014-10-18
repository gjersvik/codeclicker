part of codeclicker;

class Research extends Item implements Buyable{
  final Function _effect;
  
  int price;
  
  Research(String id, this.price, this._effect):super(id);
  
  buy(){
    _effect();
    price == 0;
  }
}