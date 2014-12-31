part of biblio_reservation; 
 
// lib/gen/biblio/reservation/usagers.dart 
 
abstract class UsagerGen extends ConceptEntity<Usager> { 
 
  UsagerGen(Concept concept) : super.of(concept) { 
    Concept exemplaireConcept = concept.model.concepts.singleWhereCode("Exemplaire"); 
    setChild("prets", new Exemplaires(exemplaireConcept)); 
  } 
 
  UsagerGen.withId(Concept concept, String idusager) : super.of(concept) { 
    setAttribute("idusager", idusager); 
    Concept exemplaireConcept = concept.model.concepts.singleWhereCode("Exemplaire"); 
    setChild("prets", new Exemplaires(exemplaireConcept)); 
  } 
 
  String get idusager => getAttribute("idusager"); 
  set idusager(String a) => setAttribute("idusager", a); 
  
  String get nom => getAttribute("nom"); 
  set nom(String a) => setAttribute("nom", a); 
  
  String get adresse => getAttribute("adresse"); 
  set adresse(String a) => setAttribute("adresse", a); 
  
  String get tel => getAttribute("tel"); 
  set tel(String a) => setAttribute("tel", a); 
  
  String get courriel => getAttribute("courriel"); 
  set courriel(String a) => setAttribute("courriel", a); 
  
  DateTime get dateInscription => getAttribute("dateInscription"); 
  set dateInscription(DateTime a) => setAttribute("dateInscription", a); 
  
  String get motPasse => getAttribute("motPasse"); 
  set motPasse(String a) => setAttribute("motPasse", a); 
  
  Exemplaires get prets => getChild("prets"); 
  
  Usager newEntity() => new Usager(concept); 
  Usagers newEntities() => new Usagers(concept); 
  
  int idusagerCompareTo(Usager other) { 
    return idusager.compareTo(other.idusager); 
  } 
 
} 
 
abstract class UsagersGen extends Entities<Usager> { 
 
  UsagersGen(Concept concept) : super.of(concept); 
 
  Usagers newEntities() => new Usagers(concept); 
  Usager newEntity() => new Usager(concept); 
  
} 
 
