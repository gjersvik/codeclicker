part of codeclicker;

class View{
  CodeClicker cc;
  
  View(this.cc){
    var table = querySelector("#factory");
    table.querySelector("thead").innerHtml = _getTableHead();
    table.querySelector("tbody").innerHtml = _getTableBody();
    
    querySelectorAll(".writeline").onClick.listen(cc.click);
    cc.factories.asMap().forEach((int key, Factory fact){
      querySelectorAll(".buy.tier$key").onClick.listen((_) => fact.buy());
    });
  }
  
  update(){
    _setText(querySelectorAll(".loc"),cc.loc);
    _setText(querySelectorAll(".locsec"),cc.locs);
    cc.factories.asMap().forEach((int key, Factory fact){
      querySelectorAll("buy tier$key").forEach((ButtonElement e){
        e.disabled = !fact.canBuy;
      });
      _setText(querySelectorAll(".name.tier$key"), fact.name);
      _setText(querySelectorAll(".price.tier$key"), fact.price);
      _setText(querySelectorAll(".own.tier$key"), fact.own);
      _setText(querySelectorAll(".locs.tier$key"), fact.locs);
      _setText(querySelectorAll(".output.tier$key"), fact.output);
    });
  }
  
  _setText(ElementList list, Object value){
    list.forEach((Element e) => e.text = value.toString());
  }
  
  _getTableHead(){
    return """<tr>
        <th>Name</th>
        <th>Price</th>
        <th>Owns</th>
        <th>Buy</th>
        <th>loc/s</th>
        <th>Output</th>
      </tr>""";
  }
  
  _getTableBody(){
    var body = "";
    for( var i = 0; i < cc.factories.length; i += 1){
      var fact =  cc.factories[i];
      body += """<tr>
      <td class="name tier$i"></td>
      <td class="price tier$i"></td>
      <td class="own tier$i"></td>
      <td><button class="buy tier$i">Buy</button></td>
      <td class="locs tier$i"></td>
      <td class="output tier$i"></td>
    </tr>""";
    }
    return body;
  }
}