import 'dart:html';
import 'package:polymer/polymer.dart';
import "package:biblio_reservation/biblio_reservation.dart"; 
import 'dart:typed_data';
import "package:dartling/dartling.dart"; 



@CustomTag('ajout-ouvrage')
class AjoutOuvrageElement extends PolymerElement {
  
  
  @published Ouvrage ouvrage;
  @observable Ouvrage newOuvrage;
  @observable Ouvrages ouvrages;
  @observable String myErrorMessage = '';
  
  
  BiblioModels domain;
  DomainSession session;
  ReservationEntries entries;
  
  AjoutOuvrageElement.created() : super.created() {
    var biblioRepo = new Repository();
    
    domain = biblioRepo.getDomainModels("Biblio");
    session = domain.newSession();
    entries = domain.getModelEntries("Reservation");    

    ouvrages = entries.ouvrages;
    ouvrage = new Ouvrage(ouvrages.concept);
  }
 
  bool validerTitre() {
     if (ouvrage.titre.length < 1) {
       myErrorMessage = "Le nom ne doit pas être vide ";
       return false;
     }
     myErrorMessage = '';
     return true;
   }

   
   bool validerAuteur() {
     if (ouvrage.auteur.length < 1) {
       myErrorMessage = "L'adresse ne doit pas être vide";
       return false;
     }
     myErrorMessage = '';
     return true;
   }
   
  
   bool validerEditeur() {
     if (ouvrage.editeur.length < 1) {
       myErrorMessage = "Le champ informations ne doit pas être vide";
       return false;
     }
     myErrorMessage = '';
     return true;
   }
   
   
   bool validerSujet() {
     if (ouvrage.sujet.length < 1) {
       myErrorMessage = "Le champ Horaires ne doit pas être vide";
       return false;
     }
     myErrorMessage = '';
     return true;
   }
   
   
   bool validerDescription() {
     if (ouvrage.description.length < 1) {
       myErrorMessage = "Le champ Horaires ne doit pas être vide";
       return false;
     }
     myErrorMessage = '';
     return true;
   }
   
   
   bool validerPublicCible() {
     if (ouvrage.publicCible.length < 1) {
       myErrorMessage = "Le champ Horaires ne doit pas être vide";
       return false;
     }
     myErrorMessage = '';
     return true;
   }
   
 
   
   bool validerIsbn() {
     if (ouvrage.isbn.length < 1) {
       myErrorMessage = "Le champ Horaires ne doit pas être vide";
       return false;
     }
     myErrorMessage = '';
     return true;
   }
   
   validerOuvrage(Event event, Object detail, Node sender) {
     event.preventDefault();
     if (validerTitre() && validerIsbn() && validerPublicCible()
         && validerDescription()&& validerSujet()
         && validerEditeur()&& validerAuteur()) {

       addOuvrage();
     }else{
       myErrorMessage = "Veuillez remplir tout les champs obligatoires";
     }
   }
     
   
   addOuvrage() {

     ouvrage.idOuvrage = "${_random().toString()}";
     
     ouvrage.addToDB(ouvrage).then((_) {
       newOuvrage = new Ouvrage(ouvrages.concept);
     },
     onError: (e) { print('duplicate key'); } );    
     
   }

   int _random() {
     final ary = new Uint32List(1);
     window.crypto.getRandomValues(ary);
     return ary[0];
   }
  
}
  
  