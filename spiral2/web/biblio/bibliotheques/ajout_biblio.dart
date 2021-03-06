import 'dart:html';
import 'package:polymer/polymer.dart';
import "package:biblio_reservation/biblio_reservation.dart"; 
import 'dart:typed_data';
import "package:dartling/dartling.dart"; 



@CustomTag('ajout-biblio')
class AjoutBiblioElement extends PolymerElement {
  
  
  @published Bibliotheque biblio;
  @observable Bibliotheque newBiblio;
  @observable Bibliotheques biblios;
  @observable String myErrorMessage = '';
  
  
  BiblioModels domain;
  DomainSession session;
  ReservationEntries entries;
  
  AjoutBiblioElement.created() : super.created() {
    var biblioRepo = new Repository();
    
    domain = biblioRepo.getDomainModels("Biblio");
    session = domain.newSession();
    entries = domain.getModelEntries("Reservation");    

    biblios = entries.bibliotheques;
    biblio = new Bibliotheque(biblios.concept);
  }
 
  bool validerNom() {
     if (biblio.nom.length < 1) {
       myErrorMessage = "Le nom ne doit pas être vide ";
       return false;
     }
     myErrorMessage = '';
     return true;
   }

   
   bool validerAdresse() {
     if (biblio.adresse.length < 1) {
       myErrorMessage = "L'adresse ne doit pas être vide";
       return false;
     }
     myErrorMessage = '';
     return true;
   }
   
  
   bool validerInformations() {
     if (biblio.informations.length < 1) {
       myErrorMessage = "Le champ informations ne doit pas être vide";
       return false;
     }
     myErrorMessage = '';
     return true;
   }
   
   
   bool validerHoraires() {
     if (biblio.horaires.length < 1) {
       myErrorMessage = "Le champ Horaires ne doit pas être vide";
       return false;
     }
     myErrorMessage = '';
     return true;
   }
   
   validerBiblio(Event event, Object detail, Node sender) {
     event.preventDefault();
     if (validerNom() && validerAdresse() && validerHoraires()
         && validerInformations()) {

       addBiblio();
     }else{
       myErrorMessage = "Veuillez remplir tout les champs obligatoires";
     }
   }
     
   
   addBiblio() {

     biblio.idBibliotheque = "${_random().toString()}";
     
     biblio.addToDB(biblio).then((_) {
       newBiblio = new Bibliotheque(biblios.concept);
     },
     onError: (e) { print('duplicate key'); } );    
     
   }

   int _random() {
     final ary = new Uint32List(1);
     window.crypto.getRandomValues(ary);
     return ary[0];
   }
  
}
  
  