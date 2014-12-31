 
// test/biblio/reservation/biblio_reservation_exemplaire_test.dart 
 
import "package:unittest/unittest.dart"; 
import "package:dartling/dartling.dart"; 
import "package:biblio_reservation/biblio_reservation.dart"; 
 
testBiblioReservationExemplaires( 
    BiblioDomain biblioDomain, ReservationModel reservationModel, Exemplaires exemplaires) { 
  DomainSession session; 
  group("Testing Biblio.Reservation.Exemplaire", () { 
    session = biblioDomain.newSession();  
    expect(reservationModel.isEmpty, isTrue); 
    setUp(() { 
      reservationModel.init(); 
    }); 
    tearDown(() { 
      reservationModel.clear(); 
    }); 
 
    test("Not empty model", () { 
      expect(reservationModel.isEmpty, isFalse); 
      expect(exemplaires.isEmpty, isFalse); 
    }); 
 
    test("Empty model", () { 
      reservationModel.clear(); 
      expect(reservationModel.isEmpty, isTrue); 
      expect(exemplaires.isEmpty, isTrue); 
      expect(exemplaires.errors.isEmpty, isTrue); 
    }); 
 
    test("From model to JSON", () { 
      var json = reservationModel.toJson(); 
      expect(json, isNotNull); 
 
      print(json); 
      //reservationModel.displayJson(); 
      //reservationModel.display(); 
    }); 
 
    test("From JSON to model", () { 
      var json = reservationModel.toJson(); 
      reservationModel.clear(); 
      expect(reservationModel.isEmpty, isTrue); 
      reservationModel.fromJson(json); 
      expect(reservationModel.isEmpty, isFalse); 
 
      reservationModel.display(); 
    }); 
 
    test("From model entry to JSON", () { 
      var json = reservationModel.fromEntryToJson("Exemplaire"); 
      expect(json, isNotNull); 
 
      print(json); 
      //reservationModel.displayEntryJson("Exemplaire"); 
      //reservationModel.displayJson(); 
      //reservationModel.display(); 
    }); 
 
    test("From JSON to model entry", () { 
      var json = reservationModel.fromEntryToJson("Exemplaire"); 
      exemplaires.clear(); 
      expect(exemplaires.isEmpty, isTrue); 
      reservationModel.fromJsonToEntry(json); 
      expect(exemplaires.isEmpty, isFalse); 
 
      exemplaires.display(title: "From JSON to model entry"); 
    }); 
 
    test("Add exemplaire required error", () { 
      var exemplaireConcept = exemplaires.concept; 
      var exemplaireCount = exemplaires.length; 
      var exemplaire = new Exemplaire(exemplaireConcept); 
      var added = exemplaires.add(exemplaire); 
      expect(added, isFalse); 
      expect(exemplaires.length, equals(exemplaireCount)); 
      expect(exemplaires.errors.length, greaterThan(0)); 
      expect(exemplaires.errors.toList()[0].category, equals("required")); 
 
      exemplaires.errors.display(title: "Add exemplaire required error"); 
    }); 
 
    test("Add exemplaire unique error", () { 
      // no id attribute 
    }); 
 
    test("Not found exemplaire by new oid", () { 
      var dartlingOid = new Oid.ts(1345648254063); 
      var exemplaire = exemplaires.singleWhereOid(dartlingOid); 
      expect(exemplaire, isNull); 
    }); 
 
    test("Find exemplaire by oid", () { 
      var randomExemplaire = exemplaires.random(); 
      var exemplaire = exemplaires.singleWhereOid(randomExemplaire.oid); 
      expect(exemplaire, isNotNull); 
      expect(exemplaire, equals(randomExemplaire)); 
    }); 
 
    test("Find exemplaire by attribute id", () { 
      // no id attribute 
    }); 
 
    test("Find exemplaire by required attribute", () { 
      var randomExemplaire = exemplaires.random(); 
      var exemplaire = 
          exemplaires.firstWhereAttribute("idExemplaire", randomExemplaire.idExemplaire); 
      expect(exemplaire, isNotNull); 
      expect(exemplaire.idExemplaire, equals(randomExemplaire.idExemplaire)); 
    }); 
 
    test("Find exemplaire by attribute", () { 
      var randomExemplaire = exemplaires.random(); 
      var exemplaire = 
          exemplaires.firstWhereAttribute("DateDisponibilite", randomExemplaire.DateDisponibilite); 
      expect(exemplaire, isNotNull); 
      expect(exemplaire.DateDisponibilite, equals(randomExemplaire.DateDisponibilite)); 
    }); 
 
    test("Select exemplaires by attribute", () { 
      var randomExemplaire = exemplaires.random(); 
      var selectedExemplaires = 
          exemplaires.selectWhereAttribute("DateDisponibilite", randomExemplaire.DateDisponibilite); 
      expect(selectedExemplaires.isEmpty, isFalse); 
      selectedExemplaires.forEach((se) => 
          expect(se.DateDisponibilite, equals(randomExemplaire.DateDisponibilite))); 
 
      //selectedExemplaires.display(title: "Select exemplaires by DateDisponibilite"); 
    }); 
 
    test("Select exemplaires by required attribute", () { 
      var randomExemplaire = exemplaires.random(); 
      var selectedExemplaires = 
          exemplaires.selectWhereAttribute("idExemplaire", randomExemplaire.idExemplaire); 
      expect(selectedExemplaires.isEmpty, isFalse); 
      selectedExemplaires.forEach((se) => 
          expect(se.idExemplaire, equals(randomExemplaire.idExemplaire))); 
 
      //selectedExemplaires.display(title: "Select exemplaires by idExemplaire"); 
    }); 
 
    test("Select exemplaires by attribute, then add", () { 
      var randomExemplaire = exemplaires.random(); 
      var selectedExemplaires = 
          exemplaires.selectWhereAttribute("idExemplaire", randomExemplaire.idExemplaire); 
      expect(selectedExemplaires.isEmpty, isFalse); 
      expect(selectedExemplaires.source.isEmpty, isFalse); 
      var exemplairesCount = exemplaires.length; 
 
      var exemplaire = new Exemplaire(exemplaires.concept); 
      exemplaire.idExemplaire = 4095; 
      exemplaire.DateDisponibilite = new DateTime.now(); 
      exemplaire.dateReservation = new DateTime.now(); 
      exemplaire.dateRetourPrevu = new DateTime.now(); 
      exemplaire.dateRetour = new DateTime.now(); 
      exemplaire.nbreExemplaireRestant = 6265; 
      var added = selectedExemplaires.add(exemplaire); 
      expect(added, isTrue); 
      expect(exemplaires.length, equals(++exemplairesCount)); 
 
      //selectedExemplaires.display(title: 
      //  "Select exemplaires by attribute, then add"); 
      //exemplaires.display(title: "All exemplaires"); 
    }); 
 
    test("Select exemplaires by attribute, then remove", () { 
      var randomExemplaire = exemplaires.random(); 
      var selectedExemplaires = 
          exemplaires.selectWhereAttribute("idExemplaire", randomExemplaire.idExemplaire); 
      expect(selectedExemplaires.isEmpty, isFalse); 
      expect(selectedExemplaires.source.isEmpty, isFalse); 
      var exemplairesCount = exemplaires.length; 
 
      var removed = selectedExemplaires.remove(randomExemplaire); 
      expect(removed, isTrue); 
      expect(exemplaires.length, equals(--exemplairesCount)); 
 
      randomExemplaire.display(prefix: "removed"); 
      //selectedExemplaires.display(title: 
      //  "Select exemplaires by attribute, then remove"); 
      //exemplaires.display(title: "All exemplaires"); 
    }); 
 
    test("Sort exemplaires", () { 
      // no id attribute 
      // add compareTo method in the specific Exemplaire class 
      /* 
      exemplaires.sort(); 
 
      //exemplaires.display(title: "Sort exemplaires"); 
      */ 
    }); 
 
    test("Order exemplaires", () { 
      // no id attribute 
      // add compareTo method in the specific Exemplaire class 
      /* 
      var orderedExemplaires = exemplaires.order(); 
      expect(orderedExemplaires.isEmpty, isFalse); 
      expect(orderedExemplaires.length, equals(exemplaires.length)); 
      expect(orderedExemplaires.source.isEmpty, isFalse); 
      expect(orderedExemplaires.source.length, equals(exemplaires.length)); 
      expect(orderedExemplaires, isNot(same(exemplaires))); 
 
      //orderedExemplaires.display(title: "Order exemplaires"); 
      */ 
    }); 
 
    test("Copy exemplaires", () { 
      var copiedExemplaires = exemplaires.copy(); 
      expect(copiedExemplaires.isEmpty, isFalse); 
      expect(copiedExemplaires.length, equals(exemplaires.length)); 
      expect(copiedExemplaires, isNot(same(exemplaires))); 
      copiedExemplaires.forEach((e) => 
        expect(e, equals(exemplaires.singleWhereOid(e.oid)))); 
 
      //copiedExemplaires.display(title: "Copy exemplaires"); 
    }); 
 
    test("True for every exemplaire", () { 
      expect(exemplaires.every((e) => e.idExemplaire != null), isTrue); 
    }); 
 
    test("Random exemplaire", () { 
      var exemplaire1 = exemplaires.random(); 
      expect(exemplaire1, isNotNull); 
      var exemplaire2 = exemplaires.random(); 
      expect(exemplaire2, isNotNull); 
 
      //exemplaire1.display(prefix: "random1"); 
      //exemplaire2.display(prefix: "random2"); 
    }); 
 
    test("Update exemplaire id with try", () { 
      // no id attribute 
    }); 
 
    test("Update exemplaire id without try", () { 
      // no id attribute 
    }); 
 
    test("Update exemplaire id with success", () { 
      // no id attribute 
    }); 
 
    test("Update exemplaire non id attribute with failure", () { 
      var randomExemplaire = exemplaires.random(); 
      var beforeUpdateValue = randomExemplaire.idExemplaire; 
      var afterUpdateEntity = randomExemplaire.copy(); 
      afterUpdateEntity.idExemplaire = 7833; 
      expect(afterUpdateEntity.idExemplaire, equals(7833)); 
      // exemplaires.update can only be used if oid, code or id is set. 
      expect(() => exemplaires.update(randomExemplaire, afterUpdateEntity), throws); 
    }); 
 
    test("Copy Equality", () { 
      var randomExemplaire = exemplaires.random(); 
      randomExemplaire.display(prefix:"before copy: "); 
      var randomExemplaireCopy = randomExemplaire.copy(); 
      randomExemplaireCopy.display(prefix:"after copy: "); 
      expect(randomExemplaire, equals(randomExemplaireCopy)); 
      expect(randomExemplaire.oid, equals(randomExemplaireCopy.oid)); 
      expect(randomExemplaire.code, equals(randomExemplaireCopy.code)); 
      expect(randomExemplaire.idExemplaire, equals(randomExemplaireCopy.idExemplaire)); 
      expect(randomExemplaire.DateDisponibilite, equals(randomExemplaireCopy.DateDisponibilite)); 
      expect(randomExemplaire.dateReservation, equals(randomExemplaireCopy.dateReservation)); 
      expect(randomExemplaire.dateRetourPrevu, equals(randomExemplaireCopy.dateRetourPrevu)); 
      expect(randomExemplaire.dateRetour, equals(randomExemplaireCopy.dateRetour)); 
      expect(randomExemplaire.nbreExemplaireRestant, equals(randomExemplaireCopy.nbreExemplaireRestant)); 
 
    }); 
 
    test("New exemplaire action undo and redo", () { 
      var exemplaireConcept = exemplaires.concept; 
      var exemplaireCount = exemplaires.length; 
          var exemplaire = new Exemplaire(exemplaires.concept); 
      exemplaire.idExemplaire = 3094; 
      exemplaire.DateDisponibilite = new DateTime.now(); 
      exemplaire.dateReservation = new DateTime.now(); 
      exemplaire.dateRetourPrevu = new DateTime.now(); 
      exemplaire.dateRetour = new DateTime.now(); 
      exemplaire.nbreExemplaireRestant = 5028; 
    var exemplaireOuvrages = ouvrages.random(); 
    exemplaire.ouvrages = exemplaireOuvrages; 
    var exemplaireBibliotheque = bibliotheques.random(); 
    exemplaire.bibliotheque = exemplaireBibliotheque; 
      exemplaires.add(exemplaire); 
    exemplaireOuvrages.pret.add(exemplaire); 
    exemplaireBibliotheque.exemplaires.add(exemplaire); 
      expect(exemplaires.length, equals(++exemplaireCount)); 
      exemplaires.remove(exemplaire); 
      expect(exemplaires.length, equals(--exemplaireCount)); 
 
      var action = new AddAction(session, exemplaires, exemplaire); 
      action.doit(); 
      expect(exemplaires.length, equals(++exemplaireCount)); 
 
      action.undo(); 
      expect(exemplaires.length, equals(--exemplaireCount)); 
 
      action.redo(); 
      expect(exemplaires.length, equals(++exemplaireCount)); 
    }); 
 
    test("New exemplaire session undo and redo", () { 
      var exemplaireConcept = exemplaires.concept; 
      var exemplaireCount = exemplaires.length; 
          var exemplaire = new Exemplaire(exemplaires.concept); 
      exemplaire.idExemplaire = 5234; 
      exemplaire.DateDisponibilite = new DateTime.now(); 
      exemplaire.dateReservation = new DateTime.now(); 
      exemplaire.dateRetourPrevu = new DateTime.now(); 
      exemplaire.dateRetour = new DateTime.now(); 
      exemplaire.nbreExemplaireRestant = 3019; 
    var exemplaireOuvrages = ouvrages.random(); 
    exemplaire.ouvrages = exemplaireOuvrages; 
    var exemplaireBibliotheque = bibliotheques.random(); 
    exemplaire.bibliotheque = exemplaireBibliotheque; 
      exemplaires.add(exemplaire); 
    exemplaireOuvrages.pret.add(exemplaire); 
    exemplaireBibliotheque.exemplaires.add(exemplaire); 
      expect(exemplaires.length, equals(++exemplaireCount)); 
      exemplaires.remove(exemplaire); 
      expect(exemplaires.length, equals(--exemplaireCount)); 
 
      var action = new AddAction(session, exemplaires, exemplaire); 
      action.doit(); 
      expect(exemplaires.length, equals(++exemplaireCount)); 
 
      session.past.undo(); 
      expect(exemplaires.length, equals(--exemplaireCount)); 
 
      session.past.redo(); 
      expect(exemplaires.length, equals(++exemplaireCount)); 
    }); 
 
    test("Exemplaire update undo and redo", () { 
      var exemplaire = exemplaires.random(); 
      var action = new SetAttributeAction(session, exemplaire, "idExemplaire", 4148); 
      action.doit(); 
 
      session.past.undo(); 
      expect(exemplaire.idExemplaire, equals(action.before)); 
 
      session.past.redo(); 
      expect(exemplaire.idExemplaire, equals(action.after)); 
    }); 
 
    test("Exemplaire action with multiple undos and redos", () { 
      var exemplaireCount = exemplaires.length; 
      var exemplaire1 = exemplaires.random(); 
 
      var action1 = new RemoveAction(session, exemplaires, exemplaire1); 
      action1.doit(); 
      expect(exemplaires.length, equals(--exemplaireCount)); 
 
      var exemplaire2 = exemplaires.random(); 
 
      var action2 = new RemoveAction(session, exemplaires, exemplaire2); 
      action2.doit(); 
      expect(exemplaires.length, equals(--exemplaireCount)); 
 
      //session.past.display(); 
 
      session.past.undo(); 
      expect(exemplaires.length, equals(++exemplaireCount)); 
 
      session.past.undo(); 
      expect(exemplaires.length, equals(++exemplaireCount)); 
 
      //session.past.display(); 
 
      session.past.redo(); 
      expect(exemplaires.length, equals(--exemplaireCount)); 
 
      session.past.redo(); 
      expect(exemplaires.length, equals(--exemplaireCount)); 
 
      //session.past.display(); 
    }); 
 
    test("Transaction undo and redo", () { 
      var exemplaireCount = exemplaires.length; 
      var exemplaire1 = exemplaires.random(); 
      var exemplaire2 = exemplaires.random(); 
      while (exemplaire1 == exemplaire2) { 
        exemplaire2 = exemplaires.random();  
      } 
      var action1 = new RemoveAction(session, exemplaires, exemplaire1); 
      var action2 = new RemoveAction(session, exemplaires, exemplaire2); 
 
      var transaction = new Transaction("two removes on exemplaires", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      transaction.doit(); 
      exemplaireCount = exemplaireCount - 2; 
      expect(exemplaires.length, equals(exemplaireCount)); 
 
      exemplaires.display(title:"Transaction Done"); 
 
      session.past.undo(); 
      exemplaireCount = exemplaireCount + 2; 
      expect(exemplaires.length, equals(exemplaireCount)); 
 
      exemplaires.display(title:"Transaction Undone"); 
 
      session.past.redo(); 
      exemplaireCount = exemplaireCount - 2; 
      expect(exemplaires.length, equals(exemplaireCount)); 
 
      exemplaires.display(title:"Transaction Redone"); 
    }); 
 
    test("Transaction with one action error", () { 
      var exemplaireCount = exemplaires.length; 
      var exemplaire1 = exemplaires.random(); 
      var exemplaire2 = exemplaire1; 
      var action1 = new RemoveAction(session, exemplaires, exemplaire1); 
      var action2 = new RemoveAction(session, exemplaires, exemplaire2); 
 
      var transaction = new Transaction( 
        "two removes on exemplaires, with an error on the second", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      var done = transaction.doit(); 
      expect(done, isFalse); 
      expect(exemplaires.length, equals(exemplaireCount)); 
 
      //exemplaires.display(title:"Transaction with an error"); 
    }); 
 
    test("Reactions to exemplaire actions", () { 
      var exemplaireConcept = exemplaires.concept; 
      var exemplaireCount = exemplaires.length; 
 
      var reaction = new ExemplaireReaction(); 
      expect(reaction, isNotNull); 
 
      biblioDomain.startActionReaction(reaction); 
          var exemplaire = new Exemplaire(exemplaires.concept); 
      exemplaire.idExemplaire = 1612; 
      exemplaire.DateDisponibilite = new DateTime.now(); 
      exemplaire.dateReservation = new DateTime.now(); 
      exemplaire.dateRetourPrevu = new DateTime.now(); 
      exemplaire.dateRetour = new DateTime.now(); 
      exemplaire.nbreExemplaireRestant = 4480; 
    var exemplaireOuvrages = ouvrages.random(); 
    exemplaire.ouvrages = exemplaireOuvrages; 
    var exemplaireBibliotheque = bibliotheques.random(); 
    exemplaire.bibliotheque = exemplaireBibliotheque; 
      exemplaires.add(exemplaire); 
    exemplaireOuvrages.pret.add(exemplaire); 
    exemplaireBibliotheque.exemplaires.add(exemplaire); 
      expect(exemplaires.length, equals(++exemplaireCount)); 
      exemplaires.remove(exemplaire); 
      expect(exemplaires.length, equals(--exemplaireCount)); 
 
      var session = biblioDomain.newSession(); 
      var addAction = new AddAction(session, exemplaires, exemplaire); 
      addAction.doit(); 
      expect(exemplaires.length, equals(++exemplaireCount)); 
      expect(reaction.reactedOnAdd, isTrue); 
 
      var setAttributeAction = new SetAttributeAction( 
        session, exemplaire, "idExemplaire", 3015); 
      setAttributeAction.doit(); 
      expect(reaction.reactedOnUpdate, isTrue); 
      biblioDomain.cancelActionReaction(reaction); 
    }); 
 
  }); 
} 
 
class ExemplaireReaction implements ActionReactionApi { 
  bool reactedOnAdd    = false; 
  bool reactedOnUpdate = false; 
 
  react(BasicAction action) { 
    if (action is EntitiesAction) { 
      reactedOnAdd = true; 
    } else if (action is EntityAction) { 
      reactedOnUpdate = true; 
    } 
  } 
} 
 
void main() { 
  var repository = new Repository(); 
  var biblioDomain = repository.getDomainModels("Biblio");   
  assert(biblioDomain != null); 
  var reservationModel = biblioDomain.getModelEntries("Reservation");  
  assert(reservationModel != null); 
  var exemplaires = reservationModel.exemplaires; 
  testBiblioReservationExemplaires(biblioDomain, reservationModel, exemplaires); 
} 
 
