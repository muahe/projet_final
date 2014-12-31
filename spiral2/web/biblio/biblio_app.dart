import 'dart:html';
import 'dart:convert';
import 'package:polymer/polymer.dart';
import "package:biblio_reservation/biblio_reservation.dart"; 
import "package:dartling/dartling.dart"; 
import 'dart:indexed_db';
import 'dart:async';
import 'dart:typed_data';


 
@CustomTag('biblio-app')
class BiblioApp extends PolymerElement {
  
  
  bool idbAvailable = IdbFactory.supported;

  
  @observable Usagers usagers;
  @observable Usager newUsager, userConnected;
  @observable bool emptyList = true;
  @observable bool isLoggedIn = true;
  String tempSTR="";

  BiblioModels domain;
  DomainSession session;
  ReservationEntries entries;
  
  BiblioApp.created() : super.created() {
    var biblioRepo = new Repository();
    
    domain = biblioRepo.getDomainModels("Biblio");
    session = domain.newSession();
    entries = domain.getModelEntries("Reservation");

    usagers = entries.usagers;
    newUsager = new Usager(usagers.concept);
    initObservableLists();
    start();

    
  }
  
  usagersChanged(){
    if (usagers.count != 0){
      emptyList = false;
    }else{
      emptyList = true;
    }
  }
  
  Future start() { 
    if (!idbAvailable) {
      return new Future.error('IndexedDB not supported.');
    }
    
    return usagers.open().then((_) {
      if (usagers.count != 0){
        emptyList = false;
      }else{
        emptyList = true;
      }

    });
  }  

  

  
  addUsager(Event e, var detail, Node sender) {
    e.preventDefault();
    Usager ct = detail['usager'] as Usager; 
    ct.idusager = "${_random().toString()}";
    usagers.addUsager(ct).then((_) {
      emptyList = false;
      newUsager = new Usager(usagers.concept);
      //dispatchEvent(new CustomEvent('formnotneeded'));
    },
    onError: (e) { print('duplicate key'); } );    
    
  }

  int _random() {
    final ary = new Uint32List(1);
    window.crypto.getRandomValues(ary);
    return ary[0];
  }
  
  authentifierUsager(Event e, var detail, Node sender) {
    e.preventDefault();
    Usager ct = detail['usager'] as Usager; 
    if (!emptyList){
      try{ 
        userConnected = usagers.firstWhere((e)=> ((e.courriel==ct.courriel)
                                    &&(e.motPasse==ct.motPasse)));
        if (userConnected != null ){
          
          //var request = new HttpRequest();
//          var url = "biblio/home/accueil.html?auth=true";
//          window.open(url, '_self');
          isLoggedIn = true;
          
  
          
  //        href = "home/accueil.html";
        }
      } catch(exception){
        window.alert("Le courriel ou le mot de passe saisi est incorrect !! ");  
      }
      
    }
    
  }

  resetForm() {
    newUsager = new Usager(usagers.concept);
    emptyList = false;

  }
  
  void newUsagerAdded(Event e, var detail, Node target){
    emptyList = true;
  }
  
  void storeData() {
    window.localStorage['entries'] = JSON.encode(entries.toJson());
  }
  
  void _readData() {
    usagers.open();    

  }
  
  void initObservableLists() {
    usagers.internalList = toObservable(usagers.internalList);

    for (Usager usager in usagers) {

    }
  }
  
}

