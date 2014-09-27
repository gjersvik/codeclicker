import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('loc-counter')
class LocCounterElement extends PolymerElement {
  @published int locs = 0;
  @published String elem = '';

  LocCounterElement.created() : super.created();
  
  void attached() {
    shadowRoot.text = '$locs locs';
  }
  
  void locsChanged() {
    shadowRoot.text = '$locs locs';
  }
}