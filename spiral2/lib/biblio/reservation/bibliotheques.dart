part of biblio_reservation; 
 
// lib/biblio/reservation/bibliotheques.dart 
 
class Bibliotheque extends BibliothequeGen { 
  var dbKey;
 
  Bibliotheque(Concept concept) : super(concept); 
 
  Bibliotheque.withId(Concept concept, String idBibliotheque) : 
    super.withId(concept, idBibliotheque); 
 
  // added after code gen - begin 
  
  Map<String, Object> toJsonMap() {
      Map<String, Object> entityMap = new Map<String, Object>(); 
      entityMap['idBibliotheque'] =idBibliotheque;
      entityMap['nom'] = nom;
      entityMap['adresse'] = adresse;
      entityMap['informations'] = informations;
      entityMap['horaires'] = horaires;
      return entityMap;
    }  
  
  int _random() {
    final ary = new Uint32List(1);
    window.crypto.getRandomValues(ary);
    return ary[0];
  }

    
    
    fromJsonMap(Map<String, Object> entityMap, [ConceptEntity internalParent]) {
      idBibliotheque = entityMap['idBibliotheque'];
      nom = entityMap['nom'];
      adresse = entityMap['adresse'];
      informations = entityMap['informations'];
      horaires = entityMap['horaires'];
    }
 
    Future<Bibliotheque> addToDB(Bibliotheque biblio){
      
      return BibliosDb.open().then((_){     
        
        var biblioAsMap = biblio.toJsonMap();
        
        var transaction;
        transaction = BibliosDb.db.transaction("biblio", 'readwrite');  

      
      var objectStore = transaction.objectStore("biblio");
      
      
      objectStore.add(biblioAsMap).then((addedKey) {
        biblio.dbKey = addedKey;
      });
      
      return transaction.completed.then((_) {
        
        return biblio;

      });
      
      });
      
      
    }
    

    
  // added after code gen - end 
 
} 
 
class Bibliotheques extends BibliothequesGen { 
 // static const String TABLE_BIBLIOTHEQUE = 'bibliotheques';
 // static const String NAME_INDEX = 'nom_index'; 
  
  
  static const String USAGER_STORE = 'usagers';
  static const String USAGER_INDEX = 'usagerIndex';
  static const String BIBLIO_STORE = 'biblio';
  static const String BIBLIO_INDEX = 'biblioIndex';
  static const String OUVRAGE_STORE = 'ouvrageStore';
  static const String OUVRAGE_INDEX = 'ouvrageIndex';
  static const String T_OUVR_STORE = 'touvrStore';
  static const String t_OUVR_INDEX = 'touvrIndex';
  static const String EXEMP_STORE = 'exempStore';
  static const String EXEMP_INDEX = 'exempIndex';

  
  idb.Database _db;
  bool isEmpty = true;
 
  Bibliotheques(Concept concept) : super(concept); 
 
  // added after code gen - begin 
 
  
  
  Future open() {
      return window.indexedDB.open('biblioDBS',
          version: 1,
          onUpgradeNeeded: _initializeDatabase)
        .then(_loadFromDB);
    }
    
  void _initializeDatabase(idb.VersionChangeEvent e) {
    idb.Database db = (e.target as idb.OpenDBRequest).result;
    if( e.oldVersion == 0 ){
      var usagerStore = db.createObjectStore(USAGER_STORE, autoIncrement: true);
      usagerStore.createIndex(USAGER_INDEX, 'indexUsagers', unique: true);
      
      var biblioStore = db.createObjectStore(BIBLIO_STORE, autoIncrement: true);
      biblioStore.createIndex(BIBLIO_INDEX, 'indexUsagers', unique: true);
      
      var ouvrageStore = db.createObjectStore(OUVRAGE_STORE, autoIncrement: true);
      ouvrageStore.createIndex(OUVRAGE_INDEX, 'indexUsagers', unique: true);
      
      var touvrStore = db.createObjectStore(T_OUVR_STORE, autoIncrement: true);
      touvrStore.createIndex(t_OUVR_INDEX, 'indexUsagers', unique: true);
      
      var exempStore = db.createObjectStore(EXEMP_STORE, autoIncrement: true);
      exempStore.createIndex(EXEMP_INDEX, 'indexUsagers', unique: true);      
    }

    }
    
  
  
    Future _loadFromDB(idb.Database db) {
      _db = db;
      
      var trans = db.transaction(BIBLIO_STORE, 'readonly');
      var store = trans.objectStore(BIBLIO_STORE);
      this.isEmpty = true;
      // Get everything in the store.
      var cursors = store.openCursor(autoAdvance: true).asBroadcastStream();
      cursors.listen((cursor) {
        // Add milestone to the internal list.
        
        Bibliotheque tempBibliotheque = new Bibliotheque(this.concept); 
        
        tempBibliotheque.fromJsonMap(cursor.value);
        this.add(tempBibliotheque);
        this.isEmpty = false;
      });
      return cursors.length.then((_) {
        return this.length;
      });
    }  
    
    
    // Add a new milestone to the milestones in the Database.
    // 
    // This returns a Future with the new milestone when the milestone
    // has been added.
    Future<Bibliotheque> addBibliotheque(Bibliotheque bibliotheque) {
      

      var biblioAsMap = bibliotheque.toJsonMap();
      var transaction;
      transaction = _db.transaction(BIBLIO_STORE, 'readwrite');  

      
      var objectStore = transaction.objectStore(BIBLIO_STORE);
      
      
      objectStore.add(biblioAsMap).then((addedKey) {
        bibliotheque.dbKey = addedKey;
      });
      
      return transaction.completed.then((_) {
        this.add(bibliotheque);
        
        return bibliotheque;
      });
    }
    
        
    
    /*
    // Removes a milestone from the list of milestones.
    // 
    // This returns a Future which completes when the milestone has been removed.
    Future remove(Milestone milestone) {
      // Remove from database.
      var transaction = _db.transaction(MILESTONE_STORE, 'readwrite');
      transaction.objectStore(MILESTONE_STORE).delete(milestone.dbKey);
      
      return transaction.completed.then((_) {
        // Null out the key to indicate that the milestone is dead.
        milestone.dbKey = null;
        // Remove from internal list.
        milestones.remove(milestone);
      });
    }
    
    // Removes ALL milestones.
    Future clear() {
      // Clear database.
      var transaction = _db.transaction(MILESTONE_STORE, 'readwrite');
      transaction.objectStore(MILESTONE_STORE).clear();
      
      return transaction.completed.then((_) {
        // Clear internal list.
        milestones.clear();
      });
    }  
    
    // added after code gen - end 
   */

} 
 

 
