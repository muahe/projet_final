import 'dart:html';
import 'package:polymer/polymer.dart';
import "package:biblio_reservation/biblio_reservation.dart"; 



@CustomTag('ajout-biblio')
class AjoutBiblioElement extends PolymerElement {
  
  
  @published bool importBiblioClicked;
  @published bool ajoutBiblioClicked;
  
  
  AjoutBiblioElement.created() : super.created() {
    
  }
  
}
  
  