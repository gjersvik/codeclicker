part of codeclicker;

class Item{
  int quantity = 0;
  double production = 1.0;
  int price = 8;
  
  double get persec => quantity * production;
  
  int buy(int loc){
    if(loc < price){
      return loc;
    }
    loc -= price;
    quantity += 1;
    price += price ~/ 4;
    return loc;
  }
}