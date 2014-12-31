part of biblio_reservation; 



class BibliosDb {
  
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
  
  static idb.Database db;
  
  static bool idbAvailable = idb.IdbFactory.supported;
  
  
  static Future<int> open(){
    
    if (!idbAvailable) {
      return new Future.error('IndexedDB not supported.');
    }
    
    return window.indexedDB.open("biblioDB", version: 1, 
          onUpgradeNeeded: _onUpgradeNeeded, 
          onBlocked: _onBlocked)
    .then((idb.Database _db){ db = _db;});
  }
  
  static void _onBlocked(Event ev){
   print("can't open - idb blocked $ev");    
  }

  
  static void _onUpgradeNeeded(idb.VersionChangeEvent vce){
    db = (vce.target as idb.OpenDBRequest).result;
    //print("onUpgradeNeeded versions: ${vce.oldVersion} -> ${vce.newVersion}"); 
    if( vce.oldVersion == 0 ){
      print("creation of db");  
      _createStores();
    } 
//    else {
//      print("modification of db");
//      db.objectStoreNames.forEach((name)=>db.deleteObjectStore(name));
//      _createStores();  
//    }
  }
  
  
  static void _createStores(){
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
