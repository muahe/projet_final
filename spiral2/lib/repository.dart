part of biblio_reservation; 
 
// lib/repository.dart 
 
class Repository extends Repo { 
 
  static const REPOSITORY = "Repository"; 

 
  Repository([String code=REPOSITORY]) : super(code) { 
    var domain = new Domain("Biblio"); 
    domains.add(domain); 
    add(new BiblioDomain(domain)); 
 
  } 
 
} 
 
