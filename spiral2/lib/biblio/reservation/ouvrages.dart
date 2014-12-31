part of biblio_reservation; 
 
// lib/biblio/reservation/ouvrages.dart 
 
class Ouvrage extends OuvrageGen { 
  var dbKey;
 
  Ouvrage(Concept concept) : super(concept); 
 
  Ouvrage.withId(Concept concept, String idOuvrage) : 
    super.withId(concept, idOuvrage); 
 
  // added after code gen - begin 

  Map<String, Object> toJsonMap() {
      Map<String, Object> entityMap = new Map<String, Object>(); 
      
      entityMap['idOuvrage'] = idOuvrage;
      entityMap['auteur'] = auteur;
      entityMap['titre'] = titre;
      entityMap['isbn'] = isbn;
      entityMap['editeur'] = editeur;
      entityMap['description'] = description;
      entityMap['sujet'] = sujet;
      entityMap['typeouvrage'] = typeouvrage;
      entityMap['publicCible'] = publicCible;
      entityMap['nbreExemplaire'] = nbreExemplaire;      

      return entityMap;
    }  
  
  int _random() {
    final ary = new Uint32List(1);
    window.crypto.getRandomValues(ary);
    return ary[0];
  }

    
    
    fromJsonMap(Map<String, Object> entityMap, [ConceptEntity internalParent]) {

      idOuvrage = entityMap['idOuvrage'];
      auteur = entityMap['auteur'];
      titre = entityMap['titre'];
      isbn = entityMap['isbn'];
      editeur = entityMap['editeur'];
      description = entityMap['description'];
      sujet = entityMap['sujet'];
      typeouvrage = entityMap['typeouvrage'];
      publicCible = entityMap['publicCible'];
      nbreExemplaire = entityMap['nbreExemplaire'];         
    }
  
  
  // added after code gen - end 
 
} 
 
class Ouvrages extends OuvragesGen { 
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
   
  Ouvrages(Concept concept) : super(concept); 
 
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
      
      var trans = db.transaction(OUVRAGE_STORE, 'readonly');
      var store = trans.objectStore(OUVRAGE_STORE);
      this.isEmpty = true;
      // Get everything in the store.
      var cursors = store.openCursor(autoAdvance: true).asBroadcastStream();
      cursors.listen((cursor) {
        // Add milestone to the internal list.
        
        Ouvrage tempOuvrage = new Ouvrage(this.concept); 
        
        tempOuvrage.fromJsonMap(cursor.value);
        this.add(tempOuvrage);
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
    Future<Ouvrage> addOuvrage(Ouvrage ouvrage) {
      

      var ouvrageAsMap = ouvrage.toJsonMap();
      var transaction;
      transaction = _db.transaction(OUVRAGE_STORE, 'readwrite');  

      
      var objectStore = transaction.objectStore(OUVRAGE_STORE);
      
      
      objectStore.add(ouvrageAsMap).then((addedKey) {
        ouvrage.dbKey = addedKey;
      });
      
      return transaction.completed.then((_) {
        this.add(ouvrage);
        
        return ouvrage;
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
 
