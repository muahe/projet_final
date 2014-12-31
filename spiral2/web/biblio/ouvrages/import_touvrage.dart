import 'dart:html';
import 'package:polymer/polymer.dart';
import "package:biblio_reservation/biblio_reservation.dart";
import "dart:convert";
import 'dart:typed_data';
import "package:dartling/dartling.dart"; 
import 'dart:async';
import 'dart:indexed_db';



@CustomTag('import-touvrage')
class ImportTouvrageElement extends PolymerElement {
  
  bool idbAvailable = IdbFactory.supported;
  
  @published String jsonFileName;
  @observable TypeOuvrages touvrages, listTouvrages;
  @observable TypeOuvrage newTouvrage;  
  @observable int progressValue=0;
  @observable bool spinActiv=false;
  @observable bool emptyTouvrageList = true;
  @observable bool printGrid = false;
  
  BiblioModels domain;
  DomainSession session;
  ReservationEntries entries;
  
  ImportTouvrageElement.created() : super.created() {
    var biblioRepo = new Repository();
    
    domain = biblioRepo.getDomainModels("Biblio");
    session = domain.newSession();
    entries = domain.getModelEntries("Reservation");    

    touvrages = entries.typeOuvrages;
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
            if (file.name.toLowerCase() == "type_ouvrages.json"){ 
              

              final reader = new FileReader();
            
              reader.onLoadEnd.listen((as) {       
                if (reader.readyState ==2){
                  storeData(reader.result);  
                }
                
                
              });
              reader.readAsText(file);
           
            }else{
              window.alert("Seul un fichier nommé «type_ouvrages.json» et contenant la liste des type ouvrages peut être utilisé !");
            }
            
          }
    //  spinActiv = false;
    }  
  
  storeData(Object result){
    
    Map listMap = JSON.decode(result.toString());
    
    List listTouvrage = listMap["T_OUVRAGES"];
    int i = 0;
    touvrages.open().then((_) {
      listTouvrage.forEach((value){
        TypeOuvrage touvrage = new TypeOuvrage(touvrages.concept);
        touvrage.idType = value['idType'];
        touvrage.type = value['type'];
  
                
        touvrages.addTouvrage(touvrage).then((_) {
          i = i+1;
          progressValue = ((i * 100)/ listTouvrage.length).round();
        },
        onError: (e) { print('Clée dupliquée'); } )
        .then((_) {
          if (listTouvrage.length == i){
            spinActiv =false;
            printGrid = true;
            listTouvrages = touvrages;
            window.alert("Chargement des données Types ouvrages terminé, $i types ouvrages ont été chargées avec succès");
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
    
    return touvrages.open().then((_) {
      if (touvrages.count != 0){
        emptyTouvrageList = false;
      }else{
        emptyTouvrageList = true;
      }

    });
  }  
  
  
  int _random() {
    final ary = new Uint32List(1);
    window.crypto.getRandomValues(ary);
    return ary[0];
  }

  void initObservableLists() {
    touvrages.internalList = toObservable(touvrages.internalList);

    for (TypeOuvrage touvrage in touvrages) {

    }
  }
  
  
}