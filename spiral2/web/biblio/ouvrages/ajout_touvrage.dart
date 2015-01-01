import 'dart:html';
import 'package:polymer/polymer.dart';
import "package:biblio_reservation/biblio_reservation.dart"; 
import 'dart:typed_data';
import "package:dartling/dartling.dart"; 



@CustomTag('ajout-touvrage')
class AjoutTouvrageElement extends PolymerElement {
  
  
  @published TypeOuvrage touvrage;
  @observable TypeOuvrage newTouvrage;
  @observable TypeOuvrages touvrages;
  @observable String myErrorMessage = '';
  
  
  BiblioModels domain;
  DomainSession session;
  ReservationEntries entries;
  
  AjoutTouvrageElement.created() : super.created() {
    var biblioRepo = new Repository();
    
    domain = biblioRepo.getDomainModels("Biblio");
    session = domain.newSession();
    entries = domain.getModelEntries("Reservation");    

    touvrages = entries.typeOuvrages;
    touvrage = new TypeOuvrage(touvrages.concept);
  }
 
  bool validerType() {
     if (touvrage.type.length < 1) {
       myErrorMessage = "Le nom ne doit pas être vide ";
       return false;
     }
     myErrorMessage = '';
     return true;
   }

   
   validerTouvrage(Event event, Object detail, Node sender) {
     event.preventDefault();
     if (validerType()) {

       addTouvrage();
     }else{
       myErrorMessage = "Veuillez remplir tout les champs obligatoires";
     }
   }
     
   
   addTouvrage() {

     touvrage.idType = "${_random().toString()}";
     
     touvrage.addToDB(touvrage).then((_) {
       newTouvrage = new TypeOuvrage(touvrages.concept);
     },
     onError: (e) { print('duplicate key'); } );    
     
   }

   int _random() {
     final ary = new Uint32List(1);
     window.crypto.getRandomValues(ary);
     return ary[0];
   }
  
}
  
  