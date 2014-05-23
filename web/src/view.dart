part of codeclicker;

class View{
  CodeClicker cc;
  
  View(this.cc){
    var table = querySelector("#factory");
    table.querySelector("thead").innerHtml = _getTableHead();
    table.querySelector("tbody").innerHtml = _getTableBody();
    
    querySelector("#achievement").innerHtml = _getAchievementList();
    
    querySelectorAll(".writeline").onClick.listen((_) => cc.work());
    cc.factories.asMap().forEach((int key, Factory fact){
      querySelectorAll(".buy.tier$key").onClick.listen((_) => cc.buy(fact));
    });
  }
  
  update(){
    _setText(querySelectorAll(".loc"),cc.loc);
    _setText(querySelectorAll(".locsec"),cc.locs);
    cc.factories.asMap().forEach((int key, Factory fact){
      _setText(querySelectorAll(".name.tier$key"), fact.name);
      _setText(querySelectorAll(".price.tier$key"), fact.price);
      _setText(querySelectorAll(".own.tier$key"), fact.own);
      _setText(querySelectorAll(".locs.tier$key"), fact.locs);
      _setText(querySelectorAll(".output.tier$key"), fact.output);
    });
    
    var map = new Map.fromIterables(
        querySelectorAll("#achievement li"), cc.achievements.all);
    map.forEach((Element li, Achievement a){
      if(a.earned){
        li.style.textDecoration = "line-through";
      }
    });
  }
  
  _setText(ElementList list, Object value){
    list.forEach((Element e){
      if(e.text != value.toString()){
        e.text = value.toString();
      }
    });
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
  
  _getAchievementList(){
    var body = "";
    cc.achievements.all.forEach((Achievement a){
      body += "<li>${a.name}</li>";
    });
    return body;
  }
}