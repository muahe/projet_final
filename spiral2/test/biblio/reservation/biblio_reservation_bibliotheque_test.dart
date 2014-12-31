 
// test/biblio/reservation/biblio_reservation_bibliotheque_test.dart 
 
import "package:unittest/unittest.dart"; 
import "package:dartling/dartling.dart"; 
import "package:biblio_reservation/biblio_reservation.dart"; 
 
testBiblioReservationBibliotheques( 
    BiblioDomain biblioDomain, ReservationModel reservationModel, Bibliotheques bibliotheques) { 
  DomainSession session; 
  group("Testing Biblio.Reservation.Bibliotheque", () { 
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
      expect(bibliotheques.isEmpty, isFalse); 
    }); 
 
    test("Empty model", () { 
      reservationModel.clear(); 
      expect(reservationModel.isEmpty, isTrue); 
      expect(bibliotheques.isEmpty, isTrue); 
      expect(bibliotheques.errors.isEmpty, isTrue); 
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
      var json = reservationModel.fromEntryToJson("Bibliotheque"); 
      expect(json, isNotNull); 
 
      print(json); 
      //reservationModel.displayEntryJson("Bibliotheque"); 
      //reservationModel.displayJson(); 
      //reservationModel.display(); 
    }); 
 
    test("From JSON to model entry", () { 
      var json = reservationModel.fromEntryToJson("Bibliotheque"); 
      bibliotheques.clear(); 
      expect(bibliotheques.isEmpty, isTrue); 
      reservationModel.fromJsonToEntry(json); 
      expect(bibliotheques.isEmpty, isFalse); 
 
      bibliotheques.display(title: "From JSON to model entry"); 
    }); 
 
    test("Add bibliotheque required error", () { 
      // no required attribute that is not id 
    }); 
 
    test("Add bibliotheque unique error", () { 
      var bibliothequeConcept = bibliotheques.concept; 
      var bibliothequeCount = bibliotheques.length; 
      var bibliotheque = new Bibliotheque(bibliothequeConcept); 
      var randomBibliotheque = bibliotheques.random(); 
      bibliotheque.idBibliotheque = randomBibliotheque.idBibliotheque; 
      var added = bibliotheques.add(bibliotheque); 
      expect(added, isFalse); 
      expect(bibliotheques.length, equals(bibliothequeCount)); 
      expect(bibliotheques.errors.length, greaterThan(0)); 
 
      bibliotheques.errors.display(title: "Add bibliotheque unique error"); 
    }); 
 
    test("Not found bibliotheque by new oid", () { 
      var dartlingOid = new Oid.ts(1345648254063); 
      var bibliotheque = bibliotheques.singleWhereOid(dartlingOid); 
      expect(bibliotheque, isNull); 
    }); 
 
    test("Find bibliotheque by oid", () { 
      var randomBibliotheque = bibliotheques.random(); 
      var bibliotheque = bibliotheques.singleWhereOid(randomBibliotheque.oid); 
      expect(bibliotheque, isNotNull); 
      expect(bibliotheque, equals(randomBibliotheque)); 
    }); 
 
    test("Find bibliotheque by attribute id", () { 
      var randomBibliotheque = bibliotheques.random(); 
      var bibliotheque = 
          bibliotheques.singleWhereAttributeId("idBibliotheque", randomBibliotheque.idBibliotheque); 
      expect(bibliotheque, isNotNull); 
      expect(bibliotheque.idBibliotheque, equals(randomBibliotheque.idBibliotheque)); 
    }); 
 
    test("Find bibliotheque by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Find bibliotheque by attribute", () { 
      var randomBibliotheque = bibliotheques.random(); 
      var bibliotheque = 
          bibliotheques.firstWhereAttribute("nom", randomBibliotheque.nom); 
      expect(bibliotheque, isNotNull); 
      expect(bibliotheque.nom, equals(randomBibliotheque.nom)); 
    }); 
 
    test("Select bibliotheques by attribute", () { 
      var randomBibliotheque = bibliotheques.random(); 
      var selectedBibliotheques = 
          bibliotheques.selectWhereAttribute("nom", randomBibliotheque.nom); 
      expect(selectedBibliotheques.isEmpty, isFalse); 
      selectedBibliotheques.forEach((se) => 
          expect(se.nom, equals(randomBibliotheque.nom))); 
 
      //selectedBibliotheques.display(title: "Select bibliotheques by nom"); 
    }); 
 
    test("Select bibliotheques by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Select bibliotheques by attribute, then add", () { 
      var randomBibliotheque = bibliotheques.random(); 
      var selectedBibliotheques = 
          bibliotheques.selectWhereAttribute("nom", randomBibliotheque.nom); 
      expect(selectedBibliotheques.isEmpty, isFalse); 
      expect(selectedBibliotheques.source.isEmpty, isFalse); 
      var bibliothequesCount = bibliotheques.length; 
 
      var bibliotheque = new Bibliotheque(bibliotheques.concept); 
      bibliotheque.idBibliotheque = 987; 
      bibliotheque.nom = 'ocean'; 
      bibliotheque.adresse = 'milk'; 
      bibliotheque.informations = 'slate'; 
      bibliotheque.horaires = 'vacation'; 
      var added = selectedBibliotheques.add(bibliotheque); 
      expect(added, isTrue); 
      expect(bibliotheques.length, equals(++bibliothequesCount)); 
 
      //selectedBibliotheques.display(title: 
      //  "Select bibliotheques by attribute, then add"); 
      //bibliotheques.display(title: "All bibliotheques"); 
    }); 
 
    test("Select bibliotheques by attribute, then remove", () { 
      var randomBibliotheque = bibliotheques.random(); 
      var selectedBibliotheques = 
          bibliotheques.selectWhereAttribute("nom", randomBibliotheque.nom); 
      expect(selectedBibliotheques.isEmpty, isFalse); 
      expect(selectedBibliotheques.source.isEmpty, isFalse); 
      var bibliothequesCount = bibliotheques.length; 
 
      var removed = selectedBibliotheques.remove(randomBibliotheque); 
      expect(removed, isTrue); 
      expect(bibliotheques.length, equals(--bibliothequesCount)); 
 
      randomBibliotheque.display(prefix: "removed"); 
      //selectedBibliotheques.display(title: 
      //  "Select bibliotheques by attribute, then remove"); 
      //bibliotheques.display(title: "All bibliotheques"); 
    }); 
 
    test("Sort bibliotheques", () { 
      bibliotheques.sort(); 
 
      //bibliotheques.display(title: "Sort bibliotheques"); 
    }); 
 
    test("Order bibliotheques", () { 
      var orderedBibliotheques = bibliotheques.order(); 
      expect(orderedBibliotheques.isEmpty, isFalse); 
      expect(orderedBibliotheques.length, equals(bibliotheques.length)); 
      expect(orderedBibliotheques.source.isEmpty, isFalse); 
      expect(orderedBibliotheques.source.length, equals(bibliotheques.length)); 
      expect(orderedBibliotheques, isNot(same(bibliotheques))); 
 
      //orderedBibliotheques.display(title: "Order bibliotheques"); 
    }); 
 
    test("Copy bibliotheques", () { 
      var copiedBibliotheques = bibliotheques.copy(); 
      expect(copiedBibliotheques.isEmpty, isFalse); 
      expect(copiedBibliotheques.length, equals(bibliotheques.length)); 
      expect(copiedBibliotheques, isNot(same(bibliotheques))); 
      copiedBibliotheques.forEach((e) => 
        expect(e, equals(bibliotheques.singleWhereOid(e.oid)))); 
      copiedBibliotheques.forEach((e) => 
        expect(e, isNot(same(bibliotheques.singleWhereId(e.id))))); 
 
      //copiedBibliotheques.display(title: "Copy bibliotheques"); 
    }); 
 
    test("True for every bibliotheque", () { 
      // no required attribute that is not id 
    }); 
 
    test("Random bibliotheque", () { 
      var bibliotheque1 = bibliotheques.random(); 
      expect(bibliotheque1, isNotNull); 
      var bibliotheque2 = bibliotheques.random(); 
      expect(bibliotheque2, isNotNull); 
 
      //bibliotheque1.display(prefix: "random1"); 
      //bibliotheque2.display(prefix: "random2"); 
    }); 
 
    test("Update bibliotheque id with try", () { 
      var randomBibliotheque = bibliotheques.random(); 
      var beforeUpdate = randomBibliotheque.idBibliotheque; 
      try { 
        randomBibliotheque.idBibliotheque = 3363; 
      } on UpdateError catch (e) { 
        expect(randomBibliotheque.idBibliotheque, equals(beforeUpdate)); 
      } 
    }); 
 
    test("Update bibliotheque id without try", () { 
      var randomBibliotheque = bibliotheques.random(); 
      var beforeUpdateValue = randomBibliotheque.idBibliotheque; 
      expect(() => randomBibliotheque.idBibliotheque = 5795, throws); 
      expect(randomBibliotheque.idBibliotheque, equals(beforeUpdateValue)); 
    }); 
 
    test("Update bibliotheque id with success", () { 
      var randomBibliotheque = bibliotheques.random(); 
      var afterUpdateEntity = randomBibliotheque.copy(); 
      var attribute = randomBibliotheque.concept.attributes.singleWhereCode("idBibliotheque"); 
      expect(attribute.update, isFalse); 
      attribute.update = true; 
      afterUpdateEntity.idBibliotheque = 4301; 
      expect(afterUpdateEntity.idBibliotheque, equals(4301)); 
      attribute.update = false; 
      var updated = bibliotheques.update(randomBibliotheque, afterUpdateEntity); 
      expect(updated, isTrue); 
 
      var entity = bibliotheques.singleWhereAttributeId("idBibliotheque", 4301); 
      expect(entity, isNotNull); 
      expect(entity.idBibliotheque, equals(4301)); 
 
      //bibliotheques.display("After update bibliotheque id"); 
    }); 
 
    test("Update bibliotheque non id attribute with failure", () { 
      var randomBibliotheque = bibliotheques.random(); 
      var beforeUpdateValue = randomBibliotheque.nom; 
      var afterUpdateEntity = randomBibliotheque.copy(); 
      afterUpdateEntity.nom = 'vessel'; 
      expect(afterUpdateEntity.nom, equals('vessel')); 
      // bibliotheques.update can only be used if oid, code or id is set. 
      expect(() => bibliotheques.update(randomBibliotheque, afterUpdateEntity), throws); 
    }); 
 
    test("Copy Equality", () { 
      var randomBibliotheque = bibliotheques.random(); 
      randomBibliotheque.display(prefix:"before copy: "); 
      var randomBibliothequeCopy = randomBibliotheque.copy(); 
      randomBibliothequeCopy.display(prefix:"after copy: "); 
      expect(randomBibliotheque, equals(randomBibliothequeCopy)); 
      expect(randomBibliotheque.oid, equals(randomBibliothequeCopy.oid)); 
      expect(randomBibliotheque.code, equals(randomBibliothequeCopy.code)); 
      expect(randomBibliotheque.idBibliotheque, equals(randomBibliothequeCopy.idBibliotheque)); 
      expect(randomBibliotheque.nom, equals(randomBibliothequeCopy.nom)); 
      expect(randomBibliotheque.adresse, equals(randomBibliothequeCopy.adresse)); 
      expect(randomBibliotheque.informations, equals(randomBibliothequeCopy.informations)); 
      expect(randomBibliotheque.horaires, equals(randomBibliothequeCopy.horaires)); 
 
      expect(randomBibliotheque.id, isNotNull); 
      expect(randomBibliothequeCopy.id, isNotNull); 
      expect(randomBibliotheque.id, equals(randomBibliothequeCopy.id)); 
 
      var idsEqual = false; 
      if (randomBibliotheque.id == randomBibliothequeCopy.id) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
 
      idsEqual = false; 
      if (randomBibliotheque.id.equals(randomBibliothequeCopy.id)) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
    }); 
 
    test("New bibliotheque action undo and redo", () { 
      var bibliothequeConcept = bibliotheques.concept; 
      var bibliothequeCount = bibliotheques.length; 
          var bibliotheque = new Bibliotheque(bibliotheques.concept); 
      bibliotheque.idBibliotheque = 4101; 
      bibliotheque.nom = 'plate'; 
      bibliotheque.adresse = 'month'; 
      bibliotheque.informations = 'mind'; 
      bibliotheque.horaires = 'milk'; 
      bibliotheques.add(bibliotheque); 
      expect(bibliotheques.length, equals(++bibliothequeCount)); 
      bibliotheques.remove(bibliotheque); 
      expect(bibliotheques.length, equals(--bibliothequeCount)); 
 
      var action = new AddAction(session, bibliotheques, bibliotheque); 
      action.doit(); 
      expect(bibliotheques.length, equals(++bibliothequeCount)); 
 
      action.undo(); 
      expect(bibliotheques.length, equals(--bibliothequeCount)); 
 
      action.redo(); 
      expect(bibliotheques.length, equals(++bibliothequeCount)); 
    }); 
 
    test("New bibliotheque session undo and redo", () { 
      var bibliothequeConcept = bibliotheques.concept; 
      var bibliothequeCount = bibliotheques.length; 
          var bibliotheque = new Bibliotheque(bibliotheques.concept); 
      bibliotheque.idBibliotheque = 2342; 
      bibliotheque.nom = 'accomodation'; 
      bibliotheque.adresse = 'girl'; 
      bibliotheque.informations = 'advisor'; 
      bibliotheque.horaires = 'sun'; 
      bibliotheques.add(bibliotheque); 
      expect(bibliotheques.length, equals(++bibliothequeCount)); 
      bibliotheques.remove(bibliotheque); 
      expect(bibliotheques.length, equals(--bibliothequeCount)); 
 
      var action = new AddAction(session, bibliotheques, bibliotheque); 
      action.doit(); 
      expect(bibliotheques.length, equals(++bibliothequeCount)); 
 
      session.past.undo(); 
      expect(bibliotheques.length, equals(--bibliothequeCount)); 
 
      session.past.redo(); 
      expect(bibliotheques.length, equals(++bibliothequeCount)); 
    }); 
 
    test("Bibliotheque update undo and redo", () { 
      var bibliotheque = bibliotheques.random(); 
      var action = new SetAttributeAction(session, bibliotheque, "nom", 'center'); 
      action.doit(); 
 
      session.past.undo(); 
      expect(bibliotheque.nom, equals(action.before)); 
 
      session.past.redo(); 
      expect(bibliotheque.nom, equals(action.after)); 
    }); 
 
    test("Bibliotheque action with multiple undos and redos", () { 
      var bibliothequeCount = bibliotheques.length; 
      var bibliotheque1 = bibliotheques.random(); 
 
      var action1 = new RemoveAction(session, bibliotheques, bibliotheque1); 
      action1.doit(); 
      expect(bibliotheques.length, equals(--bibliothequeCount)); 
 
      var bibliotheque2 = bibliotheques.random(); 
 
      var action2 = new RemoveAction(session, bibliotheques, bibliotheque2); 
      action2.doit(); 
      expect(bibliotheques.length, equals(--bibliothequeCount)); 
 
      //session.past.display(); 
 
      session.past.undo(); 
      expect(bibliotheques.length, equals(++bibliothequeCount)); 
 
      session.past.undo(); 
      expect(bibliotheques.length, equals(++bibliothequeCount)); 
 
      //session.past.display(); 
 
      session.past.redo(); 
      expect(bibliotheques.length, equals(--bibliothequeCount)); 
 
      session.past.redo(); 
      expect(bibliotheques.length, equals(--bibliothequeCount)); 
 
      //session.past.display(); 
    }); 
 
    test("Transaction undo and redo", () { 
      var bibliothequeCount = bibliotheques.length; 
      var bibliotheque1 = bibliotheques.random(); 
      var bibliotheque2 = bibliotheques.random(); 
      while (bibliotheque1 == bibliotheque2) { 
        bibliotheque2 = bibliotheques.random();  
      } 
      var action1 = new RemoveAction(session, bibliotheques, bibliotheque1); 
      var action2 = new RemoveAction(session, bibliotheques, bibliotheque2); 
 
      var transaction = new Transaction("two removes on bibliotheques", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      transaction.doit(); 
      bibliothequeCount = bibliothequeCount - 2; 
      expect(bibliotheques.length, equals(bibliothequeCount)); 
 
      bibliotheques.display(title:"Transaction Done"); 
 
      session.past.undo(); 
      bibliothequeCount = bibliothequeCount + 2; 
      expect(bibliotheques.length, equals(bibliothequeCount)); 
 
      bibliotheques.display(title:"Transaction Undone"); 
 
      session.past.redo(); 
      bibliothequeCount = bibliothequeCount - 2; 
      expect(bibliotheques.length, equals(bibliothequeCount)); 
 
      bibliotheques.display(title:"Transaction Redone"); 
    }); 
 
    test("Transaction with one action error", () { 
      var bibliothequeCount = bibliotheques.length; 
      var bibliotheque1 = bibliotheques.random(); 
      var bibliotheque2 = bibliotheque1; 
      var action1 = new RemoveAction(session, bibliotheques, bibliotheque1); 
      var action2 = new RemoveAction(session, bibliotheques, bibliotheque2); 
 
      var transaction = new Transaction( 
        "two removes on bibliotheques, with an error on the second", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      var done = transaction.doit(); 
      expect(done, isFalse); 
      expect(bibliotheques.length, equals(bibliothequeCount)); 
 
      //bibliotheques.display(title:"Transaction with an error"); 
    }); 
 
    test("Reactions to bibliotheque actions", () { 
      var bibliothequeConcept = bibliotheques.concept; 
      var bibliothequeCount = bibliotheques.length; 
 
      var reaction = new BibliothequeReaction(); 
      expect(reaction, isNotNull); 
 
      biblioDomain.startActionReaction(reaction); 
          var bibliotheque = new Bibliotheque(bibliotheques.concept); 
      bibliotheque.idBibliotheque = 2823; 
      bibliotheque.nom = 'sand'; 
      bibliotheque.adresse = 'flower'; 
      bibliotheque.informations = 'left'; 
      bibliotheque.horaires = 'yellow'; 
      bibliotheques.add(bibliotheque); 
      expect(bibliotheques.length, equals(++bibliothequeCount)); 
      bibliotheques.remove(bibliotheque); 
      expect(bibliotheques.length, equals(--bibliothequeCount)); 
 
      var session = biblioDomain.newSession(); 
      var addAction = new AddAction(session, bibliotheques, bibliotheque); 
      addAction.doit(); 
      expect(bibliotheques.length, equals(++bibliothequeCount)); 
      expect(reaction.reactedOnAdd, isTrue); 
 
      var setAttributeAction = new SetAttributeAction( 
        session, bibliotheque, "nom", 'wave'); 
      setAttributeAction.doit(); 
      expect(reaction.reactedOnUpdate, isTrue); 
      biblioDomain.cancelActionReaction(reaction); 
    }); 
 
  }); 
} 
 
class BibliothequeReaction implements ActionReactionApi { 
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
  var bibliotheques = reservationModel.bibliotheques; 
  testBiblioReservationBibliotheques(biblioDomain, reservationModel, bibliotheques); 
} 
 
