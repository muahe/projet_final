import 'dart:html';
import 'package:polymer/polymer.dart';
import "package:biblio_reservation/biblio_reservation.dart"; 
import 'dart:typed_data';
import "package:dartling/dartling.dart"; 




@CustomTag('ajout-usager')
class AjoutUsagerElement extends PolymerElement {
  
  
  @published Usager usager;
  @observable Usager newUsager;
  @observable Usagers usagers;
  @observable String myErrorMessage = '';
  
  
  BiblioModels domain;
  DomainSession session;
  ReservationEntries entries;
  
  AjoutUsagerElement.created() : super.created() {
    var biblioRepo = new Repository();
    
    domain = biblioRepo.getDomainModels("Biblio");
    session = domain.newSession();
    entries = domain.getModelEntries("Reservation");    

    usagers = entries.usagers;
    usager = new Usager(usagers.concept);
  }
 
  bool validerNom() {
     if (usager.nom.length < 1) {
       myErrorMessage = "Le nom ne doit pas être vide ";
       return false;
     }
     myErrorMessage = '';
     return true;
   }

   
   bool validerAdresse() {
     if (usager.adresse.length < 1) {
       myErrorMessage = "L'adresse ne doit pas être vide";
       return false;
     }
     myErrorMessage = '';
     return true;
   }
   
  
   bool validerTel() {
     if (usager.tel.length < 1) {
       myErrorMessage = "Le champ informations ne doit pas être vide";
       return false;
     }
     myErrorMessage = '';
     return true;
   }
   
   
   bool validerCourriel() {
     if (usager.courriel.length < 1) {
       myErrorMessage = "Le champ Horaires ne doit pas être vide";
       return false;
     }
     myErrorMessage = '';
     return true;
   }
   
   

   
   
   bool validermotPasse() {
     if (usager.motPasse.length < 1) {
       myErrorMessage = "Le champ Horaires ne doit pas être vide";
       return false;
     }
     myErrorMessage = '';
     return true;
   }
   
   
   validerUsager(Event event, Object detail, Node sender) {
     event.preventDefault();
     if (validerNom() && validerAdresse() && validerTel()
         && validerCourriel() 
         && validermotPasse()) {

       addUsager();
     }else{
       myErrorMessage = "Veuillez remplir tout les champs obligatoires";
     }
   }
     
   
   addUsager() {

     usager.idusager = "${_random().toString()}";
     
     usager.addToDB(usager).then((_) {

       newUsager = new Usager(usagers.concept);

     },
     onError: (e) { print('duplicate key'); } );    
     
   }

   int _random() {
     final ary = new Uint32List(1);
     window.crypto.getRandomValues(ary);
     return ary[0];
   }
  
}
  
  