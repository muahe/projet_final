part of biblio_reservation; 
 
// lib/gen/biblio/reservation/exemplaires.dart 
 
abstract class ExemplaireGen extends ConceptEntity<Exemplaire> { 
 
  ExemplaireGen(Concept concept) : super.of(concept); 
 
  Reference get usagerReference => getReference("usager"); 
  set usagerReference(Reference reference) => setReference("usager", reference); 
  
  Usager get usager => getParent("usager"); 
  set usager(Usager p) => setParent("usager", p); 
  
  Reference get ouvragesReference => getReference("ouvrages"); 
  set ouvragesReference(Reference reference) => setReference("ouvrages", reference); 
  
  Ouvrage get ouvrages => getParent("ouvrages"); 
  set ouvrages(Ouvrage p) => setParent("ouvrages", p); 
  
  Reference get bibliothequeReference => getReference("bibliotheque"); 
  set bibliothequeReference(Reference reference) => setReference("bibliotheque", reference); 
  
  Bibliotheque get bibliotheque => getParent("bibliotheque"); 
  set bibliotheque(Bibliotheque p) => setParent("bibliotheque", p); 
  
  int get idExemplaire => getAttribute("idExemplaire"); 
  set idExemplaire(int a) => setAttribute("idExemplaire", a); 
  
  DateTime get DateDisponibilite => getAttribute("DateDisponibilite"); 
  set DateDisponibilite(DateTime a) => setAttribute("DateDisponibilite", a); 
  
  DateTime get dateReservation => getAttribute("dateReservation"); 
  set dateReservation(DateTime a) => setAttribute("dateReservation", a); 
  
  DateTime get dateRetourPrevu => getAttribute("dateRetourPrevu"); 
  set dateRetourPrevu(DateTime a) => setAttribute("dateRetourPrevu", a); 
  
  DateTime get dateRetour => getAttribute("dateRetour"); 
  set dateRetour(DateTime a) => setAttribute("dateRetour", a); 
  
  int get nbreExemplaireRestant => getAttribute("nbreExemplaireRestant"); 
  set nbreExemplaireRestant(int a) => setAttribute("nbreExemplaireRestant", a); 
  
  Exemplaire newEntity() => new Exemplaire(concept); 
  Exemplaires newEntities() => new Exemplaires(concept); 
  
} 
 
abstract class ExemplairesGen extends Entities<Exemplaire> { 
 
  ExemplairesGen(Concept concept) : super.of(concept); 
 
  Exemplaires newEntities() => new Exemplaires(concept); 
  Exemplaire newEntity() => new Exemplaire(concept); 
  
} 
 
