import 'dart:html';
import 'package:polymer/polymer.dart';
import "package:biblio_reservation/biblio_reservation.dart"; 
import 'package:paper_elements/paper_dialog.dart';


@CustomTag('main-surface')
class MainSurfaceElement extends PolymerElement {
  
  @published bool isLoggedIn;
  @published Usager usager;
  
  @observable bool importBiblioClicked = false;
  @observable bool importOuvrageClicked = false;
  @observable bool importtypOuvrClicked = false;
  @observable bool importUsagerClicked = false;
  @observable bool ajoutBiblioClicked = false;
  @observable bool ajoutUsagerClicked = false;
  @observable bool ajoutOuvrageClicked = false;
  @observable bool ajoutTouvrageClicked = false;

 AnchorElement aboutLink;
  
  MainSurfaceElement.created() : super.created() {
  
  }
  

  void openClickHandler(Event e) {
    ($['autom_desc_dialog'] as PaperDialog).opened = true;

  }

  void openHelp(Event e){
    var url = "biblio/aide/aide.html";
    window.open(url, '_blank');
  }
  
  
  void importBiblio(Event e){
    importBiblioClicked = true;
    importOuvrageClicked = false;
    importtypOuvrClicked = false;
    importUsagerClicked = false;
    ajoutBiblioClicked = false;
    ajoutUsagerClicked = false;
    ajoutOuvrageClicked = false;
    ajoutTouvrageClicked = false;
  }
  
  
  void importOuvrage(Event e){
    importBiblioClicked = false;
    importOuvrageClicked = true;
    importtypOuvrClicked = false;
    importUsagerClicked = false;
    ajoutBiblioClicked = false;
    ajoutUsagerClicked = false;
    ajoutOuvrageClicked = false;
    ajoutTouvrageClicked = false;
  }
  
  
  void importTypeOuvrage(Event e){
    importBiblioClicked = false;
    importOuvrageClicked = false;
    importtypOuvrClicked = true;
    importUsagerClicked = false;
    ajoutBiblioClicked = false;
    ajoutUsagerClicked = false;
    ajoutOuvrageClicked = false;
    ajoutTouvrageClicked = false;
  }
  
  
  void importUsager(Event e){
    importBiblioClicked = false;
    importOuvrageClicked = false;
    importtypOuvrClicked = false;
    importUsagerClicked = true;
    ajoutBiblioClicked = false;   
    ajoutUsagerClicked = false;
    ajoutOuvrageClicked = false;
    ajoutTouvrageClicked = false;
  }
 

  void ajoutBiblio(Event e){
    importBiblioClicked = false;
    importOuvrageClicked = false;
    importtypOuvrClicked = false;
    importUsagerClicked = false;
    ajoutBiblioClicked = true;
    ajoutUsagerClicked = false;
    ajoutOuvrageClicked = false;
    ajoutTouvrageClicked = false;
  }  
  
  
  void ajoutUsager(Event e){
    importBiblioClicked = false;
    importOuvrageClicked = false;
    importtypOuvrClicked = false;
    importUsagerClicked = false;
    ajoutBiblioClicked = false;
    ajoutUsagerClicked = true;
    ajoutOuvrageClicked = false;
    ajoutTouvrageClicked = false;
  }  
  
  
  void ajoutOuvrage(Event e){
    importBiblioClicked = false;
    importOuvrageClicked = false;
    importtypOuvrClicked = false;
    importUsagerClicked = false;
    ajoutBiblioClicked = false;
    ajoutUsagerClicked = false;
    ajoutOuvrageClicked = true;
    ajoutTouvrageClicked = false;
  }  
  
  
  void ajoutTouvrage(Event e){
    importBiblioClicked = false;
    importOuvrageClicked = false;
    importtypOuvrClicked = false;
    importUsagerClicked = false;
    ajoutBiblioClicked = false;
    ajoutUsagerClicked = false;
    ajoutOuvrageClicked = false;
    ajoutTouvrageClicked = true;
  }  

  quitter() {

    isLoggedIn = false;

  }
  
  
  void closeClickHandler(Event e){
    if(true /* some condition */) {
      ($['autom_desc_dialog'] as PaperDialog).opened = false;
    }
  }
  
  
}