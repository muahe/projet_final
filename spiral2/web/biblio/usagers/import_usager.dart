import 'dart:html';
import 'package:polymer/polymer.dart';
import "package:biblio_reservation/biblio_reservation.dart";
import "dart:convert";
import 'dart:typed_data';
import "package:dartling/dartling.dart"; 
import 'dart:async';
import 'dart:indexed_db';



@CustomTag('import-usager')
class ImportUsagerElement extends PolymerElement {
  
  bool idbAvailable = IdbFactory.supported;
  
  @published String jsonFileName;
  @observable Usagers usagers;
  @observable Usager newUsager;  
  @observable int progressValue=0;
  @observable bool spinActiv=false;
  @observable bool emptyUsagerList = true;
  @observable Usagers listUsagers;
  @observable bool printGrid = false;
  
  BiblioModels domain;
  DomainSession session;
  ReservationEntries entries;
  
  ImportUsagerElement.created() : super.created() {
    var biblioRepo = new Repository();
    
    domain = biblioRepo.getDomainModels("Biblio");
    session = domain.newSession();
    entries = domain.getModelEntries("Reservation");    

    usagers = entries.usagers;
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
            if (file.name.toLowerCase() == "usagers.json"){ 
              

              final reader = new FileReader();
            
              reader.onLoadEnd.listen((as) {       
                if (reader.readyState ==2){
                  storeData(reader.result);  
                }
                
                
              });
              reader.readAsText(file);
           
            }else{
              window.alert("Seul un fichier nommé «usagers.json» et contenant la liste des usagers peut être utilisée !");
            }
            
          }

    }  
  
  storeData(Object result){
    
    Map listMap = JSON.decode(result.toString());
    
    List listUsager = listMap["USAGERS"];
    int i = 0;
    usagers.open().then((_) {
      listUsager.forEach((value){
        Usager usager = new Usager(usagers.concept);
        usager.idusager ="${_random().toString()}";
        usager.nom = value['nom'];
        usager.adresse = value['adresse'];
        usager.courriel = value['courriel'];        
        usager.tel = value['tel'];
        usager.motPasse = value['motPasse'];   
        
              
        usagers.addUsager(usager).then((_) {
          i = i+1;
          progressValue = ((i * 100)/ listUsager.length).round();
        },
        onError: (e) { print('Clée dupliquée'); } )
        .then((_) {
          if (listUsager.length == i){
            spinActiv =false;
            printGrid = true;
            listUsagers = usagers;
            window.alert("Chargement des données des Usagers terminé, $i usagers ont été chargées avec succès");
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
    
    return usagers.open().then((_) {
      if (usagers.count != 0){
        emptyUsagerList = false;
      }else{
        emptyUsagerList = true;
      }

    });
  }  
  
  
  int _random() {
    final ary = new Uint32List(1);
    window.crypto.getRandomValues(ary);
    return ary[0];
  }

  void initObservableLists() {
    usagers.internalList = toObservable(usagers.internalList);

    for (Usager usager in usagers) {

    }
  }
  
  
}