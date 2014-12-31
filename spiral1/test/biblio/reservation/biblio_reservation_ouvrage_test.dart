 
// test/biblio/reservation/biblio_reservation_ouvrage_test.dart 
 
import "package:unittest/unittest.dart"; 
import "package:dartling/dartling.dart"; 
import "package:biblio_reservation/biblio_reservation.dart"; 
 
testBiblioReservationOuvrages( 
    BiblioDomain biblioDomain, ReservationModel reservationModel, Ouvrages ouvrages) { 
  DomainSession session; 
  group("Testing Biblio.Reservation.Ouvrage", () { 
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
      expect(ouvrages.isEmpty, isFalse); 
    }); 
 
    test("Empty model", () { 
      reservationModel.clear(); 
      expect(reservationModel.isEmpty, isTrue); 
      expect(ouvrages.isEmpty, isTrue); 
      expect(ouvrages.errors.isEmpty, isTrue); 
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
      var json = reservationModel.fromEntryToJson("Ouvrage"); 
      expect(json, isNotNull); 
 
      print(json); 
      //reservationModel.displayEntryJson("Ouvrage"); 
      //reservationModel.displayJson(); 
      //reservationModel.display(); 
    }); 
 
    test("From JSON to model entry", () { 
      var json = reservationModel.fromEntryToJson("Ouvrage"); 
      ouvrages.clear(); 
      expect(ouvrages.isEmpty, isTrue); 
      reservationModel.fromJsonToEntry(json); 
      expect(ouvrages.isEmpty, isFalse); 
 
      ouvrages.display(title: "From JSON to model entry"); 
    }); 
 
    test("Add ouvrage required error", () { 
      // no required attribute that is not id 
    }); 
 
    test("Add ouvrage unique error", () { 
      var ouvrageConcept = ouvrages.concept; 
      var ouvrageCount = ouvrages.length; 
      var ouvrage = new Ouvrage(ouvrageConcept); 
      var randomOuvrage = ouvrages.random(); 
      ouvrage.idOuvrage = randomOuvrage.idOuvrage; 
      var added = ouvrages.add(ouvrage); 
      expect(added, isFalse); 
      expect(ouvrages.length, equals(ouvrageCount)); 
      expect(ouvrages.errors.length, greaterThan(0)); 
 
      ouvrages.errors.display(title: "Add ouvrage unique error"); 
    }); 
 
    test("Not found ouvrage by new oid", () { 
      var dartlingOid = new Oid.ts(1345648254063); 
      var ouvrage = ouvrages.singleWhereOid(dartlingOid); 
      expect(ouvrage, isNull); 
    }); 
 
    test("Find ouvrage by oid", () { 
      var randomOuvrage = ouvrages.random(); 
      var ouvrage = ouvrages.singleWhereOid(randomOuvrage.oid); 
      expect(ouvrage, isNotNull); 
      expect(ouvrage, equals(randomOuvrage)); 
    }); 
 
    test("Find ouvrage by attribute id", () { 
      var randomOuvrage = ouvrages.random(); 
      var ouvrage = 
          ouvrages.singleWhereAttributeId("idOuvrage", randomOuvrage.idOuvrage); 
      expect(ouvrage, isNotNull); 
      expect(ouvrage.idOuvrage, equals(randomOuvrage.idOuvrage)); 
    }); 
 
    test("Find ouvrage by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Find ouvrage by attribute", () { 
      var randomOuvrage = ouvrages.random(); 
      var ouvrage = 
          ouvrages.firstWhereAttribute("titre", randomOuvrage.titre); 
      expect(ouvrage, isNotNull); 
      expect(ouvrage.titre, equals(randomOuvrage.titre)); 
    }); 
 
    test("Select ouvrages by attribute", () { 
      var randomOuvrage = ouvrages.random(); 
      var selectedOuvrages = 
          ouvrages.selectWhereAttribute("titre", randomOuvrage.titre); 
      expect(selectedOuvrages.isEmpty, isFalse); 
      selectedOuvrages.forEach((se) => 
          expect(se.titre, equals(randomOuvrage.titre))); 
 
      //selectedOuvrages.display(title: "Select ouvrages by titre"); 
    }); 
 
    test("Select ouvrages by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Select ouvrages by attribute, then add", () { 
      var randomOuvrage = ouvrages.random(); 
      var selectedOuvrages = 
          ouvrages.selectWhereAttribute("titre", randomOuvrage.titre); 
      expect(selectedOuvrages.isEmpty, isFalse); 
      expect(selectedOuvrages.source.isEmpty, isFalse); 
      var ouvragesCount = ouvrages.length; 
 
      var ouvrage = new Ouvrage(ouvrages.concept); 
      ouvrage.idOuvrage = 3081; 
      ouvrage.titre = 'sun'; 
      ouvrage.auteur = 'ocean'; 
      ouvrage.editeur = 'sand'; 
      ouvrage.sujet = 'entertainment'; 
      ouvrage.description = 'software'; 
      ouvrage.publicCible = 'heating'; 
      ouvrage.nbreExemplaire = 813; 
      ouvrage.isbn = 'crisis'; 
      var added = selectedOuvrages.add(ouvrage); 
      expect(added, isTrue); 
      expect(ouvrages.length, equals(++ouvragesCount)); 
 
      //selectedOuvrages.display(title: 
      //  "Select ouvrages by attribute, then add"); 
      //ouvrages.display(title: "All ouvrages"); 
    }); 
 
    test("Select ouvrages by attribute, then remove", () { 
      var randomOuvrage = ouvrages.random(); 
      var selectedOuvrages = 
          ouvrages.selectWhereAttribute("titre", randomOuvrage.titre); 
      expect(selectedOuvrages.isEmpty, isFalse); 
      expect(selectedOuvrages.source.isEmpty, isFalse); 
      var ouvragesCount = ouvrages.length; 
 
      var removed = selectedOuvrages.remove(randomOuvrage); 
      expect(removed, isTrue); 
      expect(ouvrages.length, equals(--ouvragesCount)); 
 
      randomOuvrage.display(prefix: "removed"); 
      //selectedOuvrages.display(title: 
      //  "Select ouvrages by attribute, then remove"); 
      //ouvrages.display(title: "All ouvrages"); 
    }); 
 
    test("Sort ouvrages", () { 
      ouvrages.sort(); 
 
      //ouvrages.display(title: "Sort ouvrages"); 
    }); 
 
    test("Order ouvrages", () { 
      var orderedOuvrages = ouvrages.order(); 
      expect(orderedOuvrages.isEmpty, isFalse); 
      expect(orderedOuvrages.length, equals(ouvrages.length)); 
      expect(orderedOuvrages.source.isEmpty, isFalse); 
      expect(orderedOuvrages.source.length, equals(ouvrages.length)); 
      expect(orderedOuvrages, isNot(same(ouvrages))); 
 
      //orderedOuvrages.display(title: "Order ouvrages"); 
    }); 
 
    test("Copy ouvrages", () { 
      var copiedOuvrages = ouvrages.copy(); 
      expect(copiedOuvrages.isEmpty, isFalse); 
      expect(copiedOuvrages.length, equals(ouvrages.length)); 
      expect(copiedOuvrages, isNot(same(ouvrages))); 
      copiedOuvrages.forEach((e) => 
        expect(e, equals(ouvrages.singleWhereOid(e.oid)))); 
      copiedOuvrages.forEach((e) => 
        expect(e, isNot(same(ouvrages.singleWhereId(e.id))))); 
 
      //copiedOuvrages.display(title: "Copy ouvrages"); 
    }); 
 
    test("True for every ouvrage", () { 
      // no required attribute that is not id 
    }); 
 
    test("Random ouvrage", () { 
      var ouvrage1 = ouvrages.random(); 
      expect(ouvrage1, isNotNull); 
      var ouvrage2 = ouvrages.random(); 
      expect(ouvrage2, isNotNull); 
 
      //ouvrage1.display(prefix: "random1"); 
      //ouvrage2.display(prefix: "random2"); 
    }); 
 
    test("Update ouvrage id with try", () { 
      var randomOuvrage = ouvrages.random(); 
      var beforeUpdate = randomOuvrage.idOuvrage; 
      try { 
        randomOuvrage.idOuvrage = 904; 
      } on UpdateError catch (e) { 
        expect(randomOuvrage.idOuvrage, equals(beforeUpdate)); 
      } 
    }); 
 
    test("Update ouvrage id without try", () { 
      var randomOuvrage = ouvrages.random(); 
      var beforeUpdateValue = randomOuvrage.idOuvrage; 
      expect(() => randomOuvrage.idOuvrage = 5167, throws); 
      expect(randomOuvrage.idOuvrage, equals(beforeUpdateValue)); 
    }); 
 
    test("Update ouvrage id with success", () { 
      var randomOuvrage = ouvrages.random(); 
      var afterUpdateEntity = randomOuvrage.copy(); 
      var attribute = randomOuvrage.concept.attributes.singleWhereCode("idOuvrage"); 
      expect(attribute.update, isFalse); 
      attribute.update = true; 
      afterUpdateEntity.idOuvrage = 4353; 
      expect(afterUpdateEntity.idOuvrage, equals(4353)); 
      attribute.update = false; 
      var updated = ouvrages.update(randomOuvrage, afterUpdateEntity); 
      expect(updated, isTrue); 
 
      var entity = ouvrages.singleWhereAttributeId("idOuvrage", 4353); 
      expect(entity, isNotNull); 
      expect(entity.idOuvrage, equals(4353)); 
 
      //ouvrages.display("After update ouvrage id"); 
    }); 
 
    test("Update ouvrage non id attribute with failure", () { 
      var randomOuvrage = ouvrages.random(); 
      var beforeUpdateValue = randomOuvrage.titre; 
      var afterUpdateEntity = randomOuvrage.copy(); 
      afterUpdateEntity.titre = 'crisis'; 
      expect(afterUpdateEntity.titre, equals('crisis')); 
      // ouvrages.update can only be used if oid, code or id is set. 
      expect(() => ouvrages.update(randomOuvrage, afterUpdateEntity), throws); 
    }); 
 
    test("Copy Equality", () { 
      var randomOuvrage = ouvrages.random(); 
      randomOuvrage.display(prefix:"before copy: "); 
      var randomOuvrageCopy = randomOuvrage.copy(); 
      randomOuvrageCopy.display(prefix:"after copy: "); 
      expect(randomOuvrage, equals(randomOuvrageCopy)); 
      expect(randomOuvrage.oid, equals(randomOuvrageCopy.oid)); 
      expect(randomOuvrage.code, equals(randomOuvrageCopy.code)); 
      expect(randomOuvrage.idOuvrage, equals(randomOuvrageCopy.idOuvrage)); 
      expect(randomOuvrage.titre, equals(randomOuvrageCopy.titre)); 
      expect(randomOuvrage.auteur, equals(randomOuvrageCopy.auteur)); 
      expect(randomOuvrage.editeur, equals(randomOuvrageCopy.editeur)); 
      expect(randomOuvrage.sujet, equals(randomOuvrageCopy.sujet)); 
      expect(randomOuvrage.description, equals(randomOuvrageCopy.description)); 
      expect(randomOuvrage.publicCible, equals(randomOuvrageCopy.publicCible)); 
      expect(randomOuvrage.nbreExemplaire, equals(randomOuvrageCopy.nbreExemplaire)); 
      expect(randomOuvrage.isbn, equals(randomOuvrageCopy.isbn)); 
 
      expect(randomOuvrage.id, isNotNull); 
      expect(randomOuvrageCopy.id, isNotNull); 
      expect(randomOuvrage.id, equals(randomOuvrageCopy.id)); 
 
      var idsEqual = false; 
      if (randomOuvrage.id == randomOuvrageCopy.id) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
 
      idsEqual = false; 
      if (randomOuvrage.id.equals(randomOuvrageCopy.id)) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
    }); 
 
    test("New ouvrage action undo and redo", () { 
      var ouvrageConcept = ouvrages.concept; 
      var ouvrageCount = ouvrages.length; 
          var ouvrage = new Ouvrage(ouvrages.concept); 
      ouvrage.idOuvrage = 8487; 
      ouvrage.titre = 'pub'; 
      ouvrage.auteur = 'hall'; 
      ouvrage.editeur = 'tax'; 
      ouvrage.sujet = 'mind'; 
      ouvrage.description = 'big'; 
      ouvrage.publicCible = 'tax'; 
      ouvrage.nbreExemplaire = 4594; 
      ouvrage.isbn = 'end'; 
      ouvrages.add(ouvrage); 
      expect(ouvrages.length, equals(++ouvrageCount)); 
      ouvrages.remove(ouvrage); 
      expect(ouvrages.length, equals(--ouvrageCount)); 
 
      var action = new AddAction(session, ouvrages, ouvrage); 
      action.doit(); 
      expect(ouvrages.length, equals(++ouvrageCount)); 
 
      action.undo(); 
      expect(ouvrages.length, equals(--ouvrageCount)); 
 
      action.redo(); 
      expect(ouvrages.length, equals(++ouvrageCount)); 
    }); 
 
    test("New ouvrage session undo and redo", () { 
      var ouvrageConcept = ouvrages.concept; 
      var ouvrageCount = ouvrages.length; 
          var ouvrage = new Ouvrage(ouvrages.concept); 
      ouvrage.idOuvrage = 5008; 
      ouvrage.titre = 'unit'; 
      ouvrage.auteur = 'nothingness'; 
      ouvrage.editeur = 'hell'; 
      ouvrage.sujet = 'agreement'; 
      ouvrage.description = 'hall'; 
      ouvrage.publicCible = 'tag'; 
      ouvrage.nbreExemplaire = 643; 
      ouvrage.isbn = 'wheat'; 
      ouvrages.add(ouvrage); 
      expect(ouvrages.length, equals(++ouvrageCount)); 
      ouvrages.remove(ouvrage); 
      expect(ouvrages.length, equals(--ouvrageCount)); 
 
      var action = new AddAction(session, ouvrages, ouvrage); 
      action.doit(); 
      expect(ouvrages.length, equals(++ouvrageCount)); 
 
      session.past.undo(); 
      expect(ouvrages.length, equals(--ouvrageCount)); 
 
      session.past.redo(); 
      expect(ouvrages.length, equals(++ouvrageCount)); 
    }); 
 
    test("Ouvrage update undo and redo", () { 
      var ouvrage = ouvrages.random(); 
      var action = new SetAttributeAction(session, ouvrage, "titre", 'ticket'); 
      action.doit(); 
 
      session.past.undo(); 
      expect(ouvrage.titre, equals(action.before)); 
 
      session.past.redo(); 
      expect(ouvrage.titre, equals(action.after)); 
    }); 
 
    test("Ouvrage action with multiple undos and redos", () { 
      var ouvrageCount = ouvrages.length; 
      var ouvrage1 = ouvrages.random(); 
 
      var action1 = new RemoveAction(session, ouvrages, ouvrage1); 
      action1.doit(); 
      expect(ouvrages.length, equals(--ouvrageCount)); 
 
      var ouvrage2 = ouvrages.random(); 
 
      var action2 = new RemoveAction(session, ouvrages, ouvrage2); 
      action2.doit(); 
      expect(ouvrages.length, equals(--ouvrageCount)); 
 
      //session.past.display(); 
 
      session.past.undo(); 
      expect(ouvrages.length, equals(++ouvrageCount)); 
 
      session.past.undo(); 
      expect(ouvrages.length, equals(++ouvrageCount)); 
 
      //session.past.display(); 
 
      session.past.redo(); 
      expect(ouvrages.length, equals(--ouvrageCount)); 
 
      session.past.redo(); 
      expect(ouvrages.length, equals(--ouvrageCount)); 
 
      //session.past.display(); 
    }); 
 
    test("Transaction undo and redo", () { 
      var ouvrageCount = ouvrages.length; 
      var ouvrage1 = ouvrages.random(); 
      var ouvrage2 = ouvrages.random(); 
      while (ouvrage1 == ouvrage2) { 
        ouvrage2 = ouvrages.random();  
      } 
      var action1 = new RemoveAction(session, ouvrages, ouvrage1); 
      var action2 = new RemoveAction(session, ouvrages, ouvrage2); 
 
      var transaction = new Transaction("two removes on ouvrages", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      transaction.doit(); 
      ouvrageCount = ouvrageCount - 2; 
      expect(ouvrages.length, equals(ouvrageCount)); 
 
      ouvrages.display(title:"Transaction Done"); 
 
      session.past.undo(); 
      ouvrageCount = ouvrageCount + 2; 
      expect(ouvrages.length, equals(ouvrageCount)); 
 
      ouvrages.display(title:"Transaction Undone"); 
 
      session.past.redo(); 
      ouvrageCount = ouvrageCount - 2; 
      expect(ouvrages.length, equals(ouvrageCount)); 
 
      ouvrages.display(title:"Transaction Redone"); 
    }); 
 
    test("Transaction with one action error", () { 
      var ouvrageCount = ouvrages.length; 
      var ouvrage1 = ouvrages.random(); 
      var ouvrage2 = ouvrage1; 
      var action1 = new RemoveAction(session, ouvrages, ouvrage1); 
      var action2 = new RemoveAction(session, ouvrages, ouvrage2); 
 
      var transaction = new Transaction( 
        "two removes on ouvrages, with an error on the second", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      var done = transaction.doit(); 
      expect(done, isFalse); 
      expect(ouvrages.length, equals(ouvrageCount)); 
 
      //ouvrages.display(title:"Transaction with an error"); 
    }); 
 
    test("Reactions to ouvrage actions", () { 
      var ouvrageConcept = ouvrages.concept; 
      var ouvrageCount = ouvrages.length; 
 
      var reaction = new OuvrageReaction(); 
      expect(reaction, isNotNull); 
 
      biblioDomain.startActionReaction(reaction); 
          var ouvrage = new Ouvrage(ouvrages.concept); 
      ouvrage.idOuvrage = 5734; 
      ouvrage.titre = 'money'; 
      ouvrage.auteur = 'money'; 
      ouvrage.editeur = 'architecture'; 
      ouvrage.sujet = 'flower'; 
      ouvrage.description = 'horse'; 
      ouvrage.publicCible = 'offence'; 
      ouvrage.nbreExemplaire = 4183; 
      ouvrage.isbn = 'up'; 
      ouvrages.add(ouvrage); 
      expect(ouvrages.length, equals(++ouvrageCount)); 
      ouvrages.remove(ouvrage); 
      expect(ouvrages.length, equals(--ouvrageCount)); 
 
      var session = biblioDomain.newSession(); 
      var addAction = new AddAction(session, ouvrages, ouvrage); 
      addAction.doit(); 
      expect(ouvrages.length, equals(++ouvrageCount)); 
      expect(reaction.reactedOnAdd, isTrue); 
 
      var setAttributeAction = new SetAttributeAction( 
        session, ouvrage, "titre", 'performance'); 
      setAttributeAction.doit(); 
      expect(reaction.reactedOnUpdate, isTrue); 
      biblioDomain.cancelActionReaction(reaction); 
    }); 
 
  }); 
} 
 
class OuvrageReaction implements ActionReactionApi { 
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
  var ouvrages = reservationModel.ouvrages; 
  testBiblioReservationOuvrages(biblioDomain, reservationModel, ouvrages); 
} 
 
