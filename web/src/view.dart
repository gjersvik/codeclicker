part of codeclicker;

class View{
  CodeClicker cc;
  Names names = new Names();
  
  View(this.cc){
    querySelectorAll(".writeline").onClick.listen((_) => cc.work());
    
    _setupFactories();
    
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
    
    _updateFactories();
    
    var map = new Map.fromIterables(
        querySelectorAll("#achievement li"), cc.achievements);
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
    
  _setupFactories(){
    var elem = querySelector("#factory");     
    
    elem.children.addAll(cc.factories.map((Factory fact){
      var id = fact.id;
      var button = new ButtonElement();
      button.attributes['flex'] = '';
      button.attributes['one'] = '';
      button.classes.addAll(['buy', id]);
      button.innerHtml =  """<span class="own $id"></span><br>
        <span class="name $id">${names.get(id)}</span><br>
        <span class="price $id"></span> locs.""";
      button.onClick.listen((_) => cc.buy(fact));
      
      return button;
    }));
  }
  
  _updateFactories(){
    cc.factories.asMap().forEach((int key, Factory fact){
      _setText(querySelectorAll(".price.tier$key"), fact.price);
      _setText(querySelectorAll(".own.tier$key"), fact.own);
      _setText(querySelectorAll(".locs.tier$key"), fact.locs);
      _setText(querySelectorAll(".output.tier$key"), fact.output);
    });
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
    cc.achievements.forEach((Achievement a){
      body += "<li>${names.get(a.id)}</li>";
    });
    return body;
  }
}