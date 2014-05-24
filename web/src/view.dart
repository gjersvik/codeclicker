part of codeclicker;

class View{
  CodeClicker cc;
  Names names = new Names();
  
  View(this.cc){
    querySelectorAll(".writeline").onClick.listen((_) => cc.work());
    
    var table = querySelector("#factory");
    table.querySelector("thead").innerHtml = _getTableHead();
    table.querySelector("tbody").innerHtml = _getTableBody();
    cc.factories.asMap().forEach((int key, Factory fact){
      querySelectorAll(".buy.tier$key").onClick.listen((_) => cc.buy(fact));
    });
    
    querySelector("#achievement").innerHtml = _getAchievementList();
    
    querySelector("#research thead").innerHtml = _getResearchHead();
    querySelector("#research tbody").innerHtml = _getResearchBody();
    var map = new Map.fromIterables(
        querySelectorAll("#research .buy"), cc.research);
    map.forEach((Element button, Research r){
      button.onClick.listen((_){
        if(cc.buy(r)){
          button.parent.parent.remove();
        }
      });
    });
    
  }
  
  update(){
    _setText(querySelectorAll(".loc"),cc.loc);
    _setText(querySelectorAll(".locsec"),cc.locs);
    cc.factories.asMap().forEach((int key, Factory fact){
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
    
    _setText(querySelectorAll(".rockstar"),cc.achievements.rockstar);
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
      var id = fact.id;
      body += """<tr>
      <td class="name $id">${names.get(id)}</td>
      <td class="price $id"></td>
      <td class="own $id"></td>
      <td><button class="buy $id">Buy</button></td>
      <td class="locs $id"></td>
      <td class="output $id"></td>
    </tr>""";
    }
    return body;
  }
  
  _getResearchHead(){
    return """<tr>
        <th>Name</th>
        <th>Price</th>
        <th>Buy</th>
      </tr>""";
  }
  
  _getResearchBody(){
    var body = "";
    for( var i = 0; i < cc.research.length; i += 1){
      var r =  cc.research[i];
      body += """<tr>
      <td class="name">${names.get(r.id)}</td>
      <td class="price">${r.price}</td>
      <td><button class="buy">Buy</button></td>
    </tr>""";
    }
    return body;
  }
  
  _getAchievementList(){
    var body = "";
    cc.achievements.all.forEach((Achievement a){
      body += "<li>${names.get(a.id)}</li>";
    });
    return body;
  }
}