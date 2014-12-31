part of biblio_reservation; 
 
// lib/gen/biblio/reservation/type_ouvrages.dart 
 
abstract class TypeOuvrageGen extends ConceptEntity<TypeOuvrage> { 
 
  TypeOuvrageGen(Concept concept) : super.of(concept) { 
    Concept ouvrageConcept = concept.model.concepts.singleWhereCode("Ouvrage"); 
    setChild("ouvrages", new Ouvrages(ouvrageConcept)); 
  } 
 
  TypeOuvrageGen.withId(Concept concept, String idType) : super.of(concept) { 
    setAttribute("idType", idType); 
    Concept ouvrageConcept = concept.model.concepts.singleWhereCode("Ouvrage"); 
    setChild("ouvrages", new Ouvrages(ouvrageConcept)); 
  } 
 
  String get idType => getAttribute("idType"); 
  set idType(String a) => setAttribute("idType", a); 
  
  String get type => getAttribute("type"); 
  set type(String a) => setAttribute("type", a); 
  
  Ouvrages get ouvrages => getChild("ouvrages"); 
  
  TypeOuvrage newEntity() => new TypeOuvrage(concept); 
  TypeOuvrages newEntities() => new TypeOuvrages(concept); 
  
  int idTypeCompareTo(TypeOuvrage other) { 
    return idType.compareTo(other.idType); 
  } 
 
} 
 
abstract class TypeOuvragesGen extends Entities<TypeOuvrage> { 
 
  TypeOuvragesGen(Concept concept) : super.of(concept); 
 
  TypeOuvrages newEntities() => new TypeOuvrages(concept); 
  TypeOuvrage newEntity() => new TypeOuvrage(concept); 
  
} 
 
