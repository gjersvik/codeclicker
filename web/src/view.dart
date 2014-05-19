part of codeclicker;

class View{
  CodeClicker cc;
  
  View(this.cc){
    querySelectorAll(".writeline").onClick.listen(cc.click);
    cc.factories.asMap().forEach((int key, Factory fact){
      var tier = key + 1;
      querySelectorAll(".buy.tier$tier").onClick.listen((_) => fact.buy());
    });
  }
  
  update(){
    _setText(querySelectorAll(".loc"),cc.loc);
    _setText(querySelectorAll(".locsec"),cc.locs);
    cc.factories.asMap().forEach((int key, Factory fact){
      var tier = key + 1;
      _setText(querySelectorAll(".name.tier$tier"), fact.name);
      _setText(querySelectorAll(".own.tier$tier"), fact.own);
      _setText(querySelectorAll(".locs.tier$tier"), fact.locs);
      _setText(querySelectorAll(".output.tier$tier"), fact.output);
    });
  }
  
  _setText(ElementList list, Object value){
    list.forEach((Element e) => e.text = value.toString());
  }
}