import 'dart:html';
import 'package:polymer/polymer.dart';
import "package:biblio_reservation/biblio_reservation.dart"; 
import 'dart:indexed_db';
import 'dart:async';


@CustomTag('nouveau-usager')
class NouveauUsagerElement extends PolymerElement {
  
  
  
  @published Usager usager;
  
  @observable String myErrorMessage = '';  
  
  
  NouveauUsagerElement.created() : super.created() {}
  
    
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
      myErrorMessage = "Le téléphone ne doit pas être vide";
      return false;
    }
    myErrorMessage = '';
    return true;
  }
  
  
  bool validerCourriel() {
    if (usager.courriel.length < 1) {
      myErrorMessage = "Le courriel ne doit pas être vide";
      return false;
    }
    myErrorMessage = '';
    return true;
  }
  
  
  bool validerPassword() {
    if (usager.motPasse.length < 8) {
      myErrorMessage = "Le mot de passe doit avoir au moins huit caractères ";
      return false;
    }
    myErrorMessage = '';
    return true;
  }
  

  validerUsager(Event event, Object detail, Node sender) {
    event.preventDefault();
    if (validerNom() && validerAdresse() && validerPassword()
        && validerCourriel() && validerTel()) {
      dispatchEvent(new CustomEvent('usagervalidated',
          detail: {'usager': usager}));
    }else{
      myErrorMessage = "Veuillez remplir tout les champs obligatoires";
    }
  }
  
  
  cancelForm(Event event, Object detail, Node sender) {
    event.preventDefault();
    myErrorMessage = '';
    dispatchEvent(new CustomEvent('formnotneeded'));
  }
  
}
