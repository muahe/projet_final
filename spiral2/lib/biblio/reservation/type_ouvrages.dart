part of biblio_reservation; 
 
// lib/biblio/reservation/type_ouvrages.dart 
 
class TypeOuvrage extends TypeOuvrageGen { 
  var dbKey;
 
  TypeOuvrage(Concept concept) : super(concept); 
 
  TypeOuvrage.withId(Concept concept, String idType) : 
    super.withId(concept, idType); 
 
  // added after code gen - begin 
  Map<String, Object> toJsonMap() {
      Map<String, Object> entityMap = new Map<String, Object>(); 
          
      entityMap['idType'] =idType;
      entityMap['type'] = type;
      return entityMap;
    }  
  
  int _random() {
    final ary = new Uint32List(1);
    window.crypto.getRandomValues(ary);
    return ary[0];
  }

    
    
    fromJsonMap(Map<String, Object> entityMap, [ConceptEntity internalParent]) {
      idType = entityMap['idType'];
      type = entityMap['type'];

    }
 
  // added after code gen - end 
 
} 
 
class TypeOuvrages extends TypeOuvragesGen { 

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
  
  TypeOuvrages(Concept concept) : super(concept); 
 
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
      
      var trans = db.transaction(T_OUVR_STORE, 'readonly');
      var store = trans.objectStore(T_OUVR_STORE);
      this.isEmpty = true;
      // Get everything in the store.
      var cursors = store.openCursor(autoAdvance: true).asBroadcastStream();
      cursors.listen((cursor) {
        // Add milestone to the internal list.
        
        TypeOuvrage tempTouvrage = new TypeOuvrage(this.concept); 
        
        tempTouvrage.fromJsonMap(cursor.value);
        this.add(tempTouvrage);
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
    Future<TypeOuvrage> addTouvrage(TypeOuvrage touvrage) {
      

      var touvrageAsMap = touvrage.toJsonMap();
      var transaction;
      transaction = _db.transaction(T_OUVR_STORE, 'readwrite');  

      
      var objectStore = transaction.objectStore(T_OUVR_STORE);
      
      
      objectStore.add(touvrageAsMap).then((addedKey) {
        touvrage.dbKey = addedKey;
      });
      
      return transaction.completed.then((_) {
        this.add(touvrage);
        
        return touvrage;
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
 
