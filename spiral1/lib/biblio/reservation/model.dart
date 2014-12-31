 
part of biblio_reservation; 
 
// lib/biblio/reservation/model.dart 
 
class ReservationModel extends ReservationEntries { 
 
  ReservationModel(Model model) : super(model); 
 
  fromJsonToOuvrageEntry() { 
    fromJsonToEntry(biblioReservationOuvrageEntry); 
  } 
 
  fromJsonToTypeOuvrageEntry() { 
    fromJsonToEntry(biblioReservationTypeOuvrageEntry); 
  } 
 
  fromJsonToBibliothequeEntry() { 
    fromJsonToEntry(biblioReservationBibliothequeEntry); 
  } 
 
  fromJsonToUsagerEntry() { 
    fromJsonToEntry(biblioReservationUsagerEntry); 
  } 
 
  fromJsonToExemplaireEntry() { 
    fromJsonToEntry(biblioReservationExemplaireEntry); 
  } 
 
  fromJsonToModel() { 
    fromJson(biblioReservationModel); 
  } 
 
  init() { 
    initOuvrages(); 
    initBibliotheques(); 
    initTypeOuvrages(); 
    initUsagers(); 
    initExemplaires(); 
  } 
 
  initOuvrages() { 
    var ouvrage1 = new Ouvrage(ouvrages.concept); 
      ouvrage1.idOuvrage = 7666; 
      ouvrage1.titre = 'head'; 
      ouvrage1.auteur = 'element'; 
      ouvrage1.editeur = 'sailing'; 
      ouvrage1.sujet = 'beginning'; 
      ouvrage1.description = 'present'; 
      ouvrage1.publicCible = 'cash'; 
      ouvrage1.nbreExemplaire = 8927; 
      ouvrage1.isbn = 'authority'; 
      ouvrages.add(ouvrage1); 
 
    var ouvrage2 = new Ouvrage(ouvrages.concept); 
      ouvrage2.idOuvrage = 2274; 
      ouvrage2.titre = 'brad'; 
      ouvrage2.auteur = 'instruction'; 
      ouvrage2.editeur = 'deep'; 
      ouvrage2.sujet = 'tag'; 
      ouvrage2.description = 'yellow'; 
      ouvrage2.publicCible = 'bank'; 
      ouvrage2.nbreExemplaire = 8189; 
      ouvrage2.isbn = 'capacity'; 
      ouvrages.add(ouvrage2); 
 
    var ouvrage3 = new Ouvrage(ouvrages.concept); 
      ouvrage3.idOuvrage = 8626; 
      ouvrage3.titre = 'book'; 
      ouvrage3.auteur = 'measuremewnt'; 
      ouvrage3.editeur = 'wheat'; 
      ouvrage3.sujet = 'tape'; 
      ouvrage3.description = 'series'; 
      ouvrage3.publicCible = 'ticket'; 
      ouvrage3.nbreExemplaire = 4921; 
      ouvrage3.isbn = 'country'; 
      ouvrages.add(ouvrage3); 
 
  } 
 
  initTypeOuvrages() { 
    var typeOuvrage1 = new TypeOuvrage(typeOuvrages.concept); 
      typeOuvrage1.idType = 6271; 
      typeOuvrage1.type = 'saving'; 
      typeOuvrages.add(typeOuvrage1); 
 
    var typeOuvrage1ouvrages1 = new Ouvrage(typeOuvrage1.ouvrages.concept); 
      typeOuvrage1ouvrages1.idOuvrage = 704; 
      typeOuvrage1ouvrages1.titre = 'wave'; 
      typeOuvrage1ouvrages1.auteur = 'vessel'; 
      typeOuvrage1ouvrages1.editeur = 'selfie'; 
      typeOuvrage1ouvrages1.sujet = 'productivity'; 
      typeOuvrage1ouvrages1.description = 'consciousness'; 
      typeOuvrage1ouvrages1.publicCible = 'tape'; 
      typeOuvrage1ouvrages1.nbreExemplaire = 1671; 
      typeOuvrage1ouvrages1.isbn = 'computer'; 
    typeOuvrage1ouvrages1.typeouvrage = typeOuvrage1; 
    typeOuvrage1.ouvrages.add(typeOuvrage1ouvrages1); 
 
    var typeOuvrage1ouvrages2 = new Ouvrage(typeOuvrage1.ouvrages.concept); 
      typeOuvrage1ouvrages2.idOuvrage = 6055; 
      typeOuvrage1ouvrages2.titre = 'beans'; 
      typeOuvrage1ouvrages2.auteur = 'time'; 
      typeOuvrage1ouvrages2.editeur = 'milk'; 
      typeOuvrage1ouvrages2.sujet = 'measuremewnt'; 
      typeOuvrage1ouvrages2.description = 'dog'; 
      typeOuvrage1ouvrages2.publicCible = 'money'; 
      typeOuvrage1ouvrages2.nbreExemplaire = 7002; 
      typeOuvrage1ouvrages2.isbn = 'word'; 
    typeOuvrage1ouvrages2.typeouvrage = typeOuvrage1; 
    typeOuvrage1.ouvrages.add(typeOuvrage1ouvrages2); 
 
    var typeOuvrage2 = new TypeOuvrage(typeOuvrages.concept); 
      typeOuvrage2.idType = 2886; 
      typeOuvrage2.type = 'end'; 
      typeOuvrages.add(typeOuvrage2); 
 
    var typeOuvrage2ouvrages1 = new Ouvrage(typeOuvrage2.ouvrages.concept); 
      typeOuvrage2ouvrages1.idOuvrage = 3093; 
      typeOuvrage2ouvrages1.titre = 'theme'; 
      typeOuvrage2ouvrages1.auteur = 'walking'; 
      typeOuvrage2ouvrages1.editeur = 'body'; 
      typeOuvrage2ouvrages1.sujet = 'pub'; 
      typeOuvrage2ouvrages1.description = 'edition'; 
      typeOuvrage2ouvrages1.publicCible = 'seed'; 
      typeOuvrage2ouvrages1.nbreExemplaire = 1774; 
      typeOuvrage2ouvrages1.isbn = 'book'; 
    typeOuvrage2ouvrages1.typeouvrage = typeOuvrage2; 
    typeOuvrage2.ouvrages.add(typeOuvrage2ouvrages1); 
 
    var typeOuvrage2ouvrages2 = new Ouvrage(typeOuvrage2.ouvrages.concept); 
      typeOuvrage2ouvrages2.idOuvrage = 6462; 
      typeOuvrage2ouvrages2.titre = 'head'; 
      typeOuvrage2ouvrages2.auteur = 'center'; 
      typeOuvrage2ouvrages2.editeur = 'school'; 
      typeOuvrage2ouvrages2.sujet = 'seed'; 
      typeOuvrage2ouvrages2.description = 'vessel'; 
      typeOuvrage2ouvrages2.publicCible = 'phone'; 
      typeOuvrage2ouvrages2.nbreExemplaire = 2916; 
      typeOuvrage2ouvrages2.isbn = 'wife'; 
    typeOuvrage2ouvrages2.typeouvrage = typeOuvrage2; 
    typeOuvrage2.ouvrages.add(typeOuvrage2ouvrages2); 
 
    var typeOuvrage3 = new TypeOuvrage(typeOuvrages.concept); 
      typeOuvrage3.idType = 3123; 
      typeOuvrage3.type = 'hospital'; 
      typeOuvrages.add(typeOuvrage3); 
 
    var typeOuvrage3ouvrages1 = new Ouvrage(typeOuvrage3.ouvrages.concept); 
      typeOuvrage3ouvrages1.idOuvrage = 4711; 
      typeOuvrage3ouvrages1.titre = 'entertainment'; 
      typeOuvrage3ouvrages1.auteur = 'judge'; 
      typeOuvrage3ouvrages1.editeur = 'interest'; 
      typeOuvrage3ouvrages1.sujet = 'drink'; 
      typeOuvrage3ouvrages1.description = 'text'; 
      typeOuvrage3ouvrages1.publicCible = 'brave'; 
      typeOuvrage3ouvrages1.nbreExemplaire = 7202; 
      typeOuvrage3ouvrages1.isbn = 'hot'; 
    typeOuvrage3ouvrages1.typeouvrage = typeOuvrage3; 
    typeOuvrage3.ouvrages.add(typeOuvrage3ouvrages1); 
 
    var typeOuvrage3ouvrages2 = new Ouvrage(typeOuvrage3.ouvrages.concept); 
      typeOuvrage3ouvrages2.idOuvrage = 448; 
      typeOuvrage3ouvrages2.titre = 'season'; 
      typeOuvrage3ouvrages2.auteur = 'book'; 
      typeOuvrage3ouvrages2.editeur = 'knowledge'; 
      typeOuvrage3ouvrages2.sujet = 'deep'; 
      typeOuvrage3ouvrages2.description = 'salad'; 
      typeOuvrage3ouvrages2.publicCible = 'pattern'; 
      typeOuvrage3ouvrages2.nbreExemplaire = 5629; 
      typeOuvrage3ouvrages2.isbn = 'concern'; 
    typeOuvrage3ouvrages2.typeouvrage = typeOuvrage3; 
    typeOuvrage3.ouvrages.add(typeOuvrage3ouvrages2); 
 
  } 
 
  initBibliotheques() { 
    var bibliotheque1 = new Bibliotheque(bibliotheques.concept); 
      bibliotheque1.idBibliotheque = 9523; 
      bibliotheque1.nom = 'call'; 
      bibliotheque1.adresse = 'consulting'; 
      bibliotheque1.informations = 'video'; 
      bibliotheque1.horaires = 'park'; 
      bibliotheques.add(bibliotheque1); 
 
    var bibliotheque2 = new Bibliotheque(bibliotheques.concept); 
      bibliotheque2.idBibliotheque = 5597; 
      bibliotheque2.nom = 'tax'; 
      bibliotheque2.adresse = 'election'; 
      bibliotheque2.informations = 'answer'; 
      bibliotheque2.horaires = 'tree'; 
      bibliotheques.add(bibliotheque2); 
 
    var bibliotheque3 = new Bibliotheque(bibliotheques.concept); 
      bibliotheque3.idBibliotheque = 8976; 
      bibliotheque3.nom = 'park'; 
      bibliotheque3.adresse = 'sin'; 
      bibliotheque3.informations = 'series'; 
      bibliotheque3.horaires = 'health'; 
      bibliotheques.add(bibliotheque3); 
 
  } 
 
  initUsagers() { 
    var usager1 = new Usager(usagers.concept); 
      usager1.idusager = 'explanation'; 
      usager1.nom = 'marriage'; 
      usager1.adresse = 'organization'; 
      usager1.tel = 'cabinet'; 
      usager1.courriel = 'employer'; 
      usager1.dateInscription = new DateTime.now(); 
      usager1.motPasse = 'small'; 
      usagers.add(usager1); 
 
    var usager1prets1 = new Exemplaire(usager1.prets.concept); 
      usager1prets1.idExemplaire = 1849; 
      usager1prets1.DateDisponibilite = new DateTime.now(); 
      usager1prets1.dateReservation = new DateTime.now(); 
      usager1prets1.dateRetourPrevu = new DateTime.now(); 
      usager1prets1.dateRetour = new DateTime.now(); 
      usager1prets1.nbreExemplaireRestant = 1228; 
    var usager1prets1Ouvrages = ouvrages.random(); 
    usager1prets1.ouvrages = usager1prets1Ouvrages; 
    var usager1prets1Bibliotheque = bibliotheques.random(); 
    usager1prets1.bibliotheque = usager1prets1Bibliotheque; 
    usager1prets1.usager = usager1; 
    usager1.prets.add(usager1prets1); 
    usager1prets1Ouvrages.pret.add(usager1prets1); 
    usager1prets1Bibliotheque.exemplaires.add(usager1prets1); 
 
    var usager1prets2 = new Exemplaire(usager1.prets.concept); 
      usager1prets2.idExemplaire = 5409; 
      usager1prets2.DateDisponibilite = new DateTime.now(); 
      usager1prets2.dateReservation = new DateTime.now(); 
      usager1prets2.dateRetourPrevu = new DateTime.now(); 
      usager1prets2.dateRetour = new DateTime.now(); 
      usager1prets2.nbreExemplaireRestant = 1503; 
    var usager1prets2Ouvrages = ouvrages.random(); 
    usager1prets2.ouvrages = usager1prets2Ouvrages; 
    var usager1prets2Bibliotheque = bibliotheques.random(); 
    usager1prets2.bibliotheque = usager1prets2Bibliotheque; 
    usager1prets2.usager = usager1; 
    usager1.prets.add(usager1prets2); 
    usager1prets2Ouvrages.pret.add(usager1prets2); 
    usager1prets2Bibliotheque.exemplaires.add(usager1prets2); 
 
    var usager2 = new Usager(usagers.concept); 
      usager2.idusager = 'school'; 
      usager2.nom = 'chairman'; 
      usager2.adresse = 'beach'; 
      usager2.tel = 'tall'; 
      usager2.courriel = 'train'; 
      usager2.dateInscription = new DateTime.now(); 
      usager2.motPasse = 'table'; 
      usagers.add(usager2); 
 
    var usager2prets1 = new Exemplaire(usager2.prets.concept); 
      usager2prets1.idExemplaire = 4700; 
      usager2prets1.DateDisponibilite = new DateTime.now(); 
      usager2prets1.dateReservation = new DateTime.now(); 
      usager2prets1.dateRetourPrevu = new DateTime.now(); 
      usager2prets1.dateRetour = new DateTime.now(); 
      usager2prets1.nbreExemplaireRestant = 746; 
    var usager2prets1Ouvrages = ouvrages.random(); 
    usager2prets1.ouvrages = usager2prets1Ouvrages; 
    var usager2prets1Bibliotheque = bibliotheques.random(); 
    usager2prets1.bibliotheque = usager2prets1Bibliotheque; 
    usager2prets1.usager = usager2; 
    usager2.prets.add(usager2prets1); 
    usager2prets1Ouvrages.pret.add(usager2prets1); 
    usager2prets1Bibliotheque.exemplaires.add(usager2prets1); 
 
    var usager2prets2 = new Exemplaire(usager2.prets.concept); 
      usager2prets2.idExemplaire = 788; 
      usager2prets2.DateDisponibilite = new DateTime.now(); 
      usager2prets2.dateReservation = new DateTime.now(); 
      usager2prets2.dateRetourPrevu = new DateTime.now(); 
      usager2prets2.dateRetour = new DateTime.now(); 
      usager2prets2.nbreExemplaireRestant = 8468; 
    var usager2prets2Ouvrages = ouvrages.random(); 
    usager2prets2.ouvrages = usager2prets2Ouvrages; 
    var usager2prets2Bibliotheque = bibliotheques.random(); 
    usager2prets2.bibliotheque = usager2prets2Bibliotheque; 
    usager2prets2.usager = usager2; 
    usager2.prets.add(usager2prets2); 
    usager2prets2Ouvrages.pret.add(usager2prets2); 
    usager2prets2Bibliotheque.exemplaires.add(usager2prets2); 
 
    var usager3 = new Usager(usagers.concept); 
      usager3.idusager = 'television'; 
      usager3.nom = 'deep'; 
      usager3.adresse = 'school'; 
      usager3.tel = 'advisor'; 
      usager3.courriel = 'horse'; 
      usager3.dateInscription = new DateTime.now(); 
      usager3.motPasse = 'professor'; 
      usagers.add(usager3); 
 
    var usager3prets1 = new Exemplaire(usager3.prets.concept); 
      usager3prets1.idExemplaire = 821; 
      usager3prets1.DateDisponibilite = new DateTime.now(); 
      usager3prets1.dateReservation = new DateTime.now(); 
      usager3prets1.dateRetourPrevu = new DateTime.now(); 
      usager3prets1.dateRetour = new DateTime.now(); 
      usager3prets1.nbreExemplaireRestant = 3309; 
    var usager3prets1Ouvrages = ouvrages.random(); 
    usager3prets1.ouvrages = usager3prets1Ouvrages; 
    var usager3prets1Bibliotheque = bibliotheques.random(); 
    usager3prets1.bibliotheque = usager3prets1Bibliotheque; 
    usager3prets1.usager = usager3; 
    usager3.prets.add(usager3prets1); 
    usager3prets1Ouvrages.pret.add(usager3prets1); 
    usager3prets1Bibliotheque.exemplaires.add(usager3prets1); 
 
    var usager3prets2 = new Exemplaire(usager3.prets.concept); 
      usager3prets2.idExemplaire = 5464; 
      usager3prets2.DateDisponibilite = new DateTime.now(); 
      usager3prets2.dateReservation = new DateTime.now(); 
      usager3prets2.dateRetourPrevu = new DateTime.now(); 
      usager3prets2.dateRetour = new DateTime.now(); 
      usager3prets2.nbreExemplaireRestant = 5203; 
    var usager3prets2Ouvrages = ouvrages.random(); 
    usager3prets2.ouvrages = usager3prets2Ouvrages; 
    var usager3prets2Bibliotheque = bibliotheques.random(); 
    usager3prets2.bibliotheque = usager3prets2Bibliotheque; 
    usager3prets2.usager = usager3; 
    usager3.prets.add(usager3prets2); 
    usager3prets2Ouvrages.pret.add(usager3prets2); 
    usager3prets2Bibliotheque.exemplaires.add(usager3prets2); 
 
  } 
 
  initExemplaires() { 
    var exemplaire1 = new Exemplaire(exemplaires.concept); 
      exemplaire1.idExemplaire = 3104; 
      exemplaire1.DateDisponibilite = new DateTime.now(); 
      exemplaire1.dateReservation = new DateTime.now(); 
      exemplaire1.dateRetourPrevu = new DateTime.now(); 
      exemplaire1.dateRetour = new DateTime.now(); 
      exemplaire1.nbreExemplaireRestant = 5584; 
    var exemplaire1Ouvrages = ouvrages.random(); 
    exemplaire1.ouvrages = exemplaire1Ouvrages; 
    var exemplaire1Bibliotheque = bibliotheques.random(); 
    exemplaire1.bibliotheque = exemplaire1Bibliotheque; 
      exemplaires.add(exemplaire1); 
    exemplaire1Ouvrages.pret.add(exemplaire1); 
    exemplaire1Bibliotheque.exemplaires.add(exemplaire1); 
 
    var exemplaire2 = new Exemplaire(exemplaires.concept); 
      exemplaire2.idExemplaire = 9141; 
      exemplaire2.DateDisponibilite = new DateTime.now(); 
      exemplaire2.dateReservation = new DateTime.now(); 
      exemplaire2.dateRetourPrevu = new DateTime.now(); 
      exemplaire2.dateRetour = new DateTime.now(); 
      exemplaire2.nbreExemplaireRestant = 185; 
    var exemplaire2Ouvrages = ouvrages.random(); 
    exemplaire2.ouvrages = exemplaire2Ouvrages; 
    var exemplaire2Bibliotheque = bibliotheques.random(); 
    exemplaire2.bibliotheque = exemplaire2Bibliotheque; 
      exemplaires.add(exemplaire2); 
    exemplaire2Ouvrages.pret.add(exemplaire2); 
    exemplaire2Bibliotheque.exemplaires.add(exemplaire2); 
 
    var exemplaire3 = new Exemplaire(exemplaires.concept); 
      exemplaire3.idExemplaire = 6484; 
      exemplaire3.DateDisponibilite = new DateTime.now(); 
      exemplaire3.dateReservation = new DateTime.now(); 
      exemplaire3.dateRetourPrevu = new DateTime.now(); 
      exemplaire3.dateRetour = new DateTime.now(); 
      exemplaire3.nbreExemplaireRestant = 8142; 
    var exemplaire3Ouvrages = ouvrages.random(); 
    exemplaire3.ouvrages = exemplaire3Ouvrages; 
    var exemplaire3Bibliotheque = bibliotheques.random(); 
    exemplaire3.bibliotheque = exemplaire3Bibliotheque; 
      exemplaires.add(exemplaire3); 
    exemplaire3Ouvrages.pret.add(exemplaire3); 
    exemplaire3Bibliotheque.exemplaires.add(exemplaire3); 
 
  } 
 
  // added after code gen - begin 
 
  // added after code gen - end 
 
} 
 
