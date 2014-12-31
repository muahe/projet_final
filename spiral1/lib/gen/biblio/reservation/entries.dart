part of biblio_reservation; 
 
// lib/gen/biblio/reservation/entries.dart 
 
class ReservationEntries extends ModelEntries { 
 
  ReservationEntries(Model model) : super(model); 
 
  Map<String, Entities> newEntries() { 
    var entries = new Map<String, Entities>(); 
    var concept; 
    concept = model.concepts.singleWhereCode("Ouvrage"); 
    entries["Ouvrage"] = new Ouvrages(concept); 
    concept = model.concepts.singleWhereCode("TypeOuvrage"); 
    entries["TypeOuvrage"] = new TypeOuvrages(concept); 
    concept = model.concepts.singleWhereCode("Bibliotheque"); 
    entries["Bibliotheque"] = new Bibliotheques(concept); 
    concept = model.concepts.singleWhereCode("Usager"); 
    entries["Usager"] = new Usagers(concept); 
    concept = model.concepts.singleWhereCode("Exemplaire"); 
    entries["Exemplaire"] = new Exemplaires(concept); 
    return entries; 
  } 
 
  Entities newEntities(String conceptCode) { 
    var concept = model.concepts.singleWhereCode(conceptCode); 
    if (concept == null) { 
      throw new ConceptError("${conceptCode} concept does not exist.") ; 
    } 
    if (concept.code == "Ouvrage") { 
      return new Ouvrages(concept); 
    } 
    if (concept.code == "TypeOuvrage") { 
      return new TypeOuvrages(concept); 
    } 
    if (concept.code == "Bibliotheque") { 
      return new Bibliotheques(concept); 
    } 
    if (concept.code == "Usager") { 
      return new Usagers(concept); 
    } 
    if (concept.code == "Exemplaire") { 
      return new Exemplaires(concept); 
    } 
    return null; 
  } 
 
  ConceptEntity newEntity(String conceptCode) { 
    var concept = model.concepts.singleWhereCode(conceptCode); 
    if (concept == null) { 
      throw new ConceptError("${conceptCode} concept does not exist.") ; 
    } 
    if (concept.code == "Ouvrage") { 
      return new Ouvrage(concept); 
    } 
    if (concept.code == "TypeOuvrage") { 
      return new TypeOuvrage(concept); 
    } 
    if (concept.code == "Bibliotheque") { 
      return new Bibliotheque(concept); 
    } 
    if (concept.code == "Usager") { 
      return new Usager(concept); 
    } 
    if (concept.code == "Exemplaire") { 
      return new Exemplaire(concept); 
    } 
    return null; 
  } 
 
  Ouvrages get ouvrages => getEntry("Ouvrage"); 
  TypeOuvrages get typeOuvrages => getEntry("TypeOuvrage"); 
  Bibliotheques get bibliotheques => getEntry("Bibliotheque"); 
  Usagers get usagers => getEntry("Usager"); 
  Exemplaires get exemplaires => getEntry("Exemplaire"); 
 
} 
 
