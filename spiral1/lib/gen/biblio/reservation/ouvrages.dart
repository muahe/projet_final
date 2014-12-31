part of biblio_reservation; 
 
// lib/gen/biblio/reservation/ouvrages.dart 
 
abstract class OuvrageGen extends ConceptEntity<Ouvrage> { 
 
  OuvrageGen(Concept concept) : super.of(concept) { 
    Concept exemplaireConcept = concept.model.concepts.singleWhereCode("Exemplaire"); 
    setChild("pret", new Exemplaires(exemplaireConcept)); 
  } 
 
  OuvrageGen.withId(Concept concept, int idOuvrage) : super.of(concept) { 
    setAttribute("idOuvrage", idOuvrage); 
    Concept exemplaireConcept = concept.model.concepts.singleWhereCode("Exemplaire"); 
    setChild("pret", new Exemplaires(exemplaireConcept)); 
  } 
 
  Reference get typeouvrageReference => getReference("typeouvrage"); 
  set typeouvrageReference(Reference reference) => setReference("typeouvrage", reference); 
  
  TypeOuvrage get typeouvrage => getParent("typeouvrage"); 
  set typeouvrage(TypeOuvrage p) => setParent("typeouvrage", p); 
  
  int get idOuvrage => getAttribute("idOuvrage"); 
  set idOuvrage(int a) => setAttribute("idOuvrage", a); 
  
  String get titre => getAttribute("titre"); 
  set titre(String a) => setAttribute("titre", a); 
  
  String get auteur => getAttribute("auteur"); 
  set auteur(String a) => setAttribute("auteur", a); 
  
  String get editeur => getAttribute("editeur"); 
  set editeur(String a) => setAttribute("editeur", a); 
  
  String get sujet => getAttribute("sujet"); 
  set sujet(String a) => setAttribute("sujet", a); 
  
  String get description => getAttribute("description"); 
  set description(String a) => setAttribute("description", a); 
  
  String get publicCible => getAttribute("publicCible"); 
  set publicCible(String a) => setAttribute("publicCible", a); 
  
  int get nbreExemplaire => getAttribute("nbreExemplaire"); 
  set nbreExemplaire(int a) => setAttribute("nbreExemplaire", a); 
  
  String get isbn => getAttribute("isbn"); 
  set isbn(String a) => setAttribute("isbn", a); 
  
  Exemplaires get pret => getChild("pret"); 
  
  Ouvrage newEntity() => new Ouvrage(concept); 
  Ouvrages newEntities() => new Ouvrages(concept); 
  
  int idOuvrageCompareTo(Ouvrage other) { 
    return idOuvrage.compareTo(other.idOuvrage); 
  } 
 
} 
 
abstract class OuvragesGen extends Entities<Ouvrage> { 
 
  OuvragesGen(Concept concept) : super.of(concept); 
 
  Ouvrages newEntities() => new Ouvrages(concept); 
  Ouvrage newEntity() => new Ouvrage(concept); 
  
} 
 
