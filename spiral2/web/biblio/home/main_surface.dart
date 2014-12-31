import 'dart:html';
import 'package:polymer/polymer.dart';
import "package:biblio_reservation/biblio_reservation.dart"; 
import 'dart:indexed_db';
import 'dart:async';
import 'package:paper_elements/paper_dialog.dart';


@CustomTag('main-surface')
class MainSurfaceElement extends PolymerElement {
  
  @published bool isLoggedIn;
  @published Usager usager;
  @observable bool importBiblioClicked = false;
  @observable bool importOuvrageClicked = false;
  @observable bool importtypOuvrClicked = false;
  @observable bool importUsagerClicked = false;
  

 AnchorElement aboutLink;
  
  MainSurfaceElement.created() : super.created() {
    //aboutLink = shadowRoot.querySelector("#about");
    //aboutLink.onClick.listen(openClickHandler);
  
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
  }
  
  
  void importOuvrage(Event e){
    importBiblioClicked = false;
    importOuvrageClicked = true;
    importtypOuvrClicked = false;
    importUsagerClicked = false;
  }
  
  
  void importTypeOuvrage(Event e){
    importBiblioClicked = false;
    importOuvrageClicked = false;
    importtypOuvrClicked = true;
    importUsagerClicked = false;
  }
  
  
  void importUsager(Event e){
    importBiblioClicked = false;
    importOuvrageClicked = false;
    importtypOuvrClicked = false;
    importUsagerClicked = true;
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