import "dart:html";

var loc = 0;

void main() {
  querySelectorAll(".writeline").onClick.listen(writeLine);
  update();
}

writeLine([_]){
  loc += 1;
  update();
}

update(){
  querySelectorAll(".loc").forEach((Element e){
    e.text = loc.toString();
  });
}