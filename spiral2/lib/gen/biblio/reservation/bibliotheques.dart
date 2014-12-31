part of biblio_reservation; 
 
// lib/gen/biblio/reservation/bibliotheques.dart 
 
abstract class BibliothequeGen extends ConceptEntity<Bibliotheque> { 
 
  BibliothequeGen(Concept concept) : super.of(concept) { 
    Concept exemplaireConcept = concept.model.concepts.singleWhereCode("Exemplaire"); 
    setChild("exemplaires", new Exemplaires(exemplaireConcept)); 
  } 
 
  BibliothequeGen.withId(Concept concept, String idBibliotheque) : super.of(concept) { 
    setAttribute("idBibliotheque", idBibliotheque); 
    Concept exemplaireConcept = concept.model.concepts.singleWhereCode("Exemplaire"); 
    setChild("exemplaires", new Exemplaires(exemplaireConcept)); 
  } 
 
  String get idBibliotheque => getAttribute("idBibliotheque"); 
  set idBibliotheque(String a) => setAttribute("idBibliotheque", a); 
  
  String get nom => getAttribute("nom"); 
  set nom(String a) => setAttribute("nom", a); 
  
  String get adresse => getAttribute("adresse"); 
  set adresse(String a) => setAttribute("adresse", a); 
  
  String get informations => getAttribute("informations"); 
  set informations(String a) => setAttribute("informations", a); 
  
  String get horaires => getAttribute("horaires"); 
  set horaires(String a) => setAttribute("horaires", a); 
  
  Exemplaires get exemplaires => getChild("exemplaires"); 
  
  Bibliotheque newEntity() => new Bibliotheque(concept); 
  Bibliotheques newEntities() => new Bibliotheques(concept); 
  
  int idBibliothequeCompareTo(Bibliotheque other) { 
    return idBibliotheque.compareTo(other.idBibliotheque); 
  } 
 
} 
 
abstract class BibliothequesGen extends Entities<Bibliotheque> { 
 
  BibliothequesGen(Concept concept) : super.of(concept); 
 
  Bibliotheques newEntities() => new Bibliotheques(concept); 
  Bibliotheque newEntity() => new Bibliotheque(concept); 
  
} 
 
