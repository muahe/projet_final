import 'dart:html';
import 'package:polymer/polymer.dart';
import "package:biblio_reservation/biblio_reservation.dart"; 



@CustomTag('main-content')
class MainContentElement extends PolymerElement {
  
  
  @published bool importBiblioClicked;
  @published bool importOuvrageClicked;
  @published bool importtypOuvrClicked;
  @published bool importUsagerClicked;
  
  
  MainContentElement.created() : super.created() {
    
  }
  
  
  
  
}