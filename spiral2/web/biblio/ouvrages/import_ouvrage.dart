import 'dart:html';
import 'package:polymer/polymer.dart';
import "package:biblio_reservation/biblio_reservation.dart";
import "dart:convert";
import 'dart:typed_data';
import "package:dartling/dartling.dart"; 
import 'dart:async';
import 'dart:indexed_db';



@CustomTag('import-ouvrage')
class ImportOuvrageElement extends PolymerElement {
  
  bool idbAvailable = IdbFactory.supported;
  
  @published String jsonFileName;
  @observable Ouvrages ouvrages;
  @observable Ouvrages listOuvrages;
  @observable TypeOuvrages tOuvrages;
  @observable Ouvrage newOuvrage;  
  @observable int progressValue=0;
  @observable bool spinActiv=false;
  @observable bool emptyOuvrageList = true;
  @observable bool printGrid = false;
  
  BiblioModels domain;
  DomainSession session;
  ReservationEntries entries;
  
  ImportOuvrageElement.created() : super.created() {
    var biblioRepo = new Repository();
    
    domain = biblioRepo.getDomainModels("Biblio");
    session = domain.newSession();
    entries = domain.getModelEntries("Reservation");    

    ouvrages = entries.ouvrages;
    initObservableLists();
    //start();
  }
  
  
  void startUploading(Event e){
    window.alert("");
    
  }

  
  updatefileToPlay(Event e, dynamic data, FileUploadInputElement el) {

    spinActiv = true;
      final files = el.files;
          if (files.length == 1) {
            final File file = files[0];
            if (file.name.toLowerCase() == "ouvrages.json"){ 
              

              final reader = new FileReader();
            
              reader.onLoadEnd.listen((as) {       
                if (reader.readyState ==2){
                  storeData(reader.result);  
                }
                
                
              });
              reader.readAsText(file);
           
            }else{
              window.alert("Seul un fichier nommé «ouvrages.json» et contenant la liste des ouvrages peut être utilisé !");
            }
            
          }
    //  spinActiv = false;
    }  
  
  storeData(Object result){
    
    Map listMap = JSON.decode(result.toString());
    
    List listOuvrage = listMap["OUVRAGES"];
    int i = 0;
    ouvrages.open().then((_) {
      listOuvrage.forEach((value){
        Ouvrage ouvrage = new Ouvrage(ouvrages.concept);
        
        ouvrage.idOuvrage = "${_random().toString()}";
        ouvrage.auteur = value['Auteur'];
        ouvrage.titre = value['Titre'];
        ouvrage.isbn = value['Isbn'];
        ouvrage.editeur = value['Editeur'];
        ouvrage.description = value['Description'];
        ouvrage.sujet = value['Sujet'];
        //TypeOuvrage touvrage = new TypeOuvrage(tOuvrages.concept);
       // touvrage.type = value['Type'];
       // ouvrage.typeouvrage = touvrage;
        ouvrage.publicCible = "";
        ouvrage.nbreExemplaire = 1;
                
        ouvrages.addOuvrage(ouvrage).then((_) {
          i = i+1;
          progressValue = ((i * 100)/ listOuvrage.length).round();
        },
        onError: (e) { print('Clée dupliquée $e'); } )
        .then((_) {
          if (listOuvrage.length == i){
            spinActiv =false;
            printGrid = true;
            listOuvrages = ouvrages;
            window.alert("Chargement des données Ouvrages terminé, $i ouvrages ont été chargées avec succès");
          }
        });  

    });
    
    
    
    },
    onError: (e) { print("Erreur d'ouverture de table ${e}"); } );
    
  }
  
  
  Future start() {
    if (!idbAvailable) {
      return new Future.error('IndexedDB not supported.');
    }
    
    return ouvrages.open().then((_) {
      if (ouvrages.count != 0){
        emptyOuvrageList = false;
      }else{
        emptyOuvrageList = true;
      }

    });
  }  
  
  
  int _random() {
    final ary = new Uint32List(1);
    window.crypto.getRandomValues(ary);
    return ary[0];
  }

  void initObservableLists() {
    ouvrages.internalList = toObservable(ouvrages.internalList);

    for (Ouvrage ouvrage in ouvrages) {

    }
  }
  
  
}