import 'dart:html';
import 'package:polymer/polymer.dart';
import "package:biblio_reservation/biblio_reservation.dart";
import "dart:convert";
import 'dart:typed_data';
import "package:dartling/dartling.dart"; 
import 'dart:async';
import 'dart:indexed_db';



@CustomTag('import-biblio')
class ImportBiblioElement extends PolymerElement {
  
  bool idbAvailable = IdbFactory.supported;
  
  @published String jsonFileName;
  @observable Bibliotheques biblios;
  @observable Bibliotheque newBiblio;  
  @observable int progressValue=0;
  @observable bool spinActiv=false;
  @observable bool emptyBibioList = true;
  @observable Bibliotheques listBiblios;
  @observable bool printGrid = false;
  
  BiblioModels domain;
  DomainSession session;
  ReservationEntries entries;
  
  ImportBiblioElement.created() : super.created() {
    var biblioRepo = new Repository();
    
    domain = biblioRepo.getDomainModels("Biblio");
    session = domain.newSession();
    entries = domain.getModelEntries("Reservation");    

    biblios = entries.bibliotheques;
    initObservableLists();
  }
  
  
  void startUploading(Event e){
    window.alert("");
    
  }

  
  updatefileToPlay(Event e, dynamic data, FileUploadInputElement el) {

    spinActiv = true;
      final files = el.files;
          if (files.length == 1) {
            final File file = files[0];
            if (file.name.toLowerCase() == "bibliotheques.json"){ 
              

              final reader = new FileReader();
            
              reader.onLoadEnd.listen((as) {       
                if (reader.readyState ==2){
                  storeData(reader.result);  
                }
                
                
              });
              reader.readAsText(file);
           
            }else{
              window.alert("Seul un fichier nommé «bibliotheques.json» et contenant la liste des bibliotheques peut être utilisé !");
            }
            
          }
    }  
  
  storeData(Object result){
    
    Map listMap = JSON.decode(result.toString());
    
    List listBiblio = listMap["BIBLIO"];
    int i = 0;
    biblios.open().then((_) {
      listBiblio.forEach((value){
        Bibliotheque biblio = new Bibliotheque(biblios.concept);
        biblio.idBibliotheque ="${_random().toString()}";
        biblio.nom = value['Bibliotheque'];
        biblio.adresse = value['Adresse'];
        biblio.informations = value['Telephone'];
        biblio.horaires = '{"Lundi":"${value["Lundi"]}", "Mardi":"${value["Mardi"]}", "Mercredi":"${value["Mercredi"]}", "Jeudi":"${value["Jeudi"]}", "Vendredi":"${value["Vendredi"]}", "Samedi":"${value["Samedi"]}", "Dimanche":"${value["Dimanche"]}"}';
                
        biblios.addBibliotheque(biblio).then((_) {
          i = i+1;
          progressValue = ((i * 100)/ listBiblio.length).round();
        },
        onError: (e) { print('Clée dupliquée'); } )
        .then((_) {
          if (listBiblio.length == i){
            spinActiv =false;
            printGrid = true;
            listBiblios = biblios;
            window.alert("Chargement des données Bibliothèques terminé, $i bibliothèques ont été chargées avec succès");
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
    
    return biblios.open().then((_) {
      if (biblios.count != 0){
        emptyBibioList = false;
      }else{
        emptyBibioList = true;
      }

    });
  }  
  
  
  int _random() {
    final ary = new Uint32List(1);
    window.crypto.getRandomValues(ary);
    return ary[0];
  }

  void initObservableLists() {
    biblios.internalList = toObservable(biblios.internalList);

    for (Bibliotheque biblio in biblios) {

    }
  }
  
  
}