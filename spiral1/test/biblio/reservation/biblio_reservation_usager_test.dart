 
// test/biblio/reservation/biblio_reservation_usager_test.dart 
 
import "package:unittest/unittest.dart"; 
import "package:dartling/dartling.dart"; 
import "package:biblio_reservation/biblio_reservation.dart"; 
 
testBiblioReservationUsagers( 
    BiblioDomain biblioDomain, ReservationModel reservationModel, Usagers usagers) { 
  DomainSession session; 
  group("Testing Biblio.Reservation.Usager", () { 
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
      expect(usagers.isEmpty, isFalse); 
    }); 
 
    test("Empty model", () { 
      reservationModel.clear(); 
      expect(reservationModel.isEmpty, isTrue); 
      expect(usagers.isEmpty, isTrue); 
      expect(usagers.errors.isEmpty, isTrue); 
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
      var json = reservationModel.fromEntryToJson("Usager"); 
      expect(json, isNotNull); 
 
      print(json); 
      //reservationModel.displayEntryJson("Usager"); 
      //reservationModel.displayJson(); 
      //reservationModel.display(); 
    }); 
 
    test("From JSON to model entry", () { 
      var json = reservationModel.fromEntryToJson("Usager"); 
      usagers.clear(); 
      expect(usagers.isEmpty, isTrue); 
      reservationModel.fromJsonToEntry(json); 
      expect(usagers.isEmpty, isFalse); 
 
      usagers.display(title: "From JSON to model entry"); 
    }); 
 
    test("Add usager required error", () { 
      // no required attribute that is not id 
    }); 
 
    test("Add usager unique error", () { 
      var usagerConcept = usagers.concept; 
      var usagerCount = usagers.length; 
      var usager = new Usager(usagerConcept); 
      var randomUsager = usagers.random(); 
      usager.idusager = randomUsager.idusager; 
      var added = usagers.add(usager); 
      expect(added, isFalse); 
      expect(usagers.length, equals(usagerCount)); 
      expect(usagers.errors.length, greaterThan(0)); 
 
      usagers.errors.display(title: "Add usager unique error"); 
    }); 
 
    test("Not found usager by new oid", () { 
      var dartlingOid = new Oid.ts(1345648254063); 
      var usager = usagers.singleWhereOid(dartlingOid); 
      expect(usager, isNull); 
    }); 
 
    test("Find usager by oid", () { 
      var randomUsager = usagers.random(); 
      var usager = usagers.singleWhereOid(randomUsager.oid); 
      expect(usager, isNotNull); 
      expect(usager, equals(randomUsager)); 
    }); 
 
    test("Find usager by attribute id", () { 
      var randomUsager = usagers.random(); 
      var usager = 
          usagers.singleWhereAttributeId("idusager", randomUsager.idusager); 
      expect(usager, isNotNull); 
      expect(usager.idusager, equals(randomUsager.idusager)); 
    }); 
 
    test("Find usager by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Find usager by attribute", () { 
      var randomUsager = usagers.random(); 
      var usager = 
          usagers.firstWhereAttribute("nom", randomUsager.nom); 
      expect(usager, isNotNull); 
      expect(usager.nom, equals(randomUsager.nom)); 
    }); 
 
    test("Select usagers by attribute", () { 
      var randomUsager = usagers.random(); 
      var selectedUsagers = 
          usagers.selectWhereAttribute("nom", randomUsager.nom); 
      expect(selectedUsagers.isEmpty, isFalse); 
      selectedUsagers.forEach((se) => 
          expect(se.nom, equals(randomUsager.nom))); 
 
      //selectedUsagers.display(title: "Select usagers by nom"); 
    }); 
 
    test("Select usagers by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Select usagers by attribute, then add", () { 
      var randomUsager = usagers.random(); 
      var selectedUsagers = 
          usagers.selectWhereAttribute("nom", randomUsager.nom); 
      expect(selectedUsagers.isEmpty, isFalse); 
      expect(selectedUsagers.source.isEmpty, isFalse); 
      var usagersCount = usagers.length; 
 
      var usager = new Usager(usagers.concept); 
      usager.idusager = 'milk'; 
      usager.nom = 'circle'; 
      usager.adresse = 'beer'; 
      usager.tel = 'call'; 
      usager.courriel = 'accident'; 
      usager.dateInscription = new DateTime.now(); 
      usager.motPasse = 'objective'; 
      var added = selectedUsagers.add(usager); 
      expect(added, isTrue); 
      expect(usagers.length, equals(++usagersCount)); 
 
      //selectedUsagers.display(title: 
      //  "Select usagers by attribute, then add"); 
      //usagers.display(title: "All usagers"); 
    }); 
 
    test("Select usagers by attribute, then remove", () { 
      var randomUsager = usagers.random(); 
      var selectedUsagers = 
          usagers.selectWhereAttribute("nom", randomUsager.nom); 
      expect(selectedUsagers.isEmpty, isFalse); 
      expect(selectedUsagers.source.isEmpty, isFalse); 
      var usagersCount = usagers.length; 
 
      var removed = selectedUsagers.remove(randomUsager); 
      expect(removed, isTrue); 
      expect(usagers.length, equals(--usagersCount)); 
 
      randomUsager.display(prefix: "removed"); 
      //selectedUsagers.display(title: 
      //  "Select usagers by attribute, then remove"); 
      //usagers.display(title: "All usagers"); 
    }); 
 
    test("Sort usagers", () { 
      usagers.sort(); 
 
      //usagers.display(title: "Sort usagers"); 
    }); 
 
    test("Order usagers", () { 
      var orderedUsagers = usagers.order(); 
      expect(orderedUsagers.isEmpty, isFalse); 
      expect(orderedUsagers.length, equals(usagers.length)); 
      expect(orderedUsagers.source.isEmpty, isFalse); 
      expect(orderedUsagers.source.length, equals(usagers.length)); 
      expect(orderedUsagers, isNot(same(usagers))); 
 
      //orderedUsagers.display(title: "Order usagers"); 
    }); 
 
    test("Copy usagers", () { 
      var copiedUsagers = usagers.copy(); 
      expect(copiedUsagers.isEmpty, isFalse); 
      expect(copiedUsagers.length, equals(usagers.length)); 
      expect(copiedUsagers, isNot(same(usagers))); 
      copiedUsagers.forEach((e) => 
        expect(e, equals(usagers.singleWhereOid(e.oid)))); 
      copiedUsagers.forEach((e) => 
        expect(e, isNot(same(usagers.singleWhereId(e.id))))); 
 
      //copiedUsagers.display(title: "Copy usagers"); 
    }); 
 
    test("True for every usager", () { 
      // no required attribute that is not id 
    }); 
 
    test("Random usager", () { 
      var usager1 = usagers.random(); 
      expect(usager1, isNotNull); 
      var usager2 = usagers.random(); 
      expect(usager2, isNotNull); 
 
      //usager1.display(prefix: "random1"); 
      //usager2.display(prefix: "random2"); 
    }); 
 
    test("Update usager id with try", () { 
      var randomUsager = usagers.random(); 
      var beforeUpdate = randomUsager.idusager; 
      try { 
        randomUsager.idusager = 'wheat'; 
      } on UpdateError catch (e) { 
        expect(randomUsager.idusager, equals(beforeUpdate)); 
      } 
    }); 
 
    test("Update usager id without try", () { 
      var randomUsager = usagers.random(); 
      var beforeUpdateValue = randomUsager.idusager; 
      expect(() => randomUsager.idusager = 'chairman', throws); 
      expect(randomUsager.idusager, equals(beforeUpdateValue)); 
    }); 
 
    test("Update usager id with success", () { 
      var randomUsager = usagers.random(); 
      var afterUpdateEntity = randomUsager.copy(); 
      var attribute = randomUsager.concept.attributes.singleWhereCode("idusager"); 
      expect(attribute.update, isFalse); 
      attribute.update = true; 
      afterUpdateEntity.idusager = 'school'; 
      expect(afterUpdateEntity.idusager, equals('school')); 
      attribute.update = false; 
      var updated = usagers.update(randomUsager, afterUpdateEntity); 
      expect(updated, isTrue); 
 
      var entity = usagers.singleWhereAttributeId("idusager", 'school'); 
      expect(entity, isNotNull); 
      expect(entity.idusager, equals('school')); 
 
      //usagers.display("After update usager id"); 
    }); 
 
    test("Update usager non id attribute with failure", () { 
      var randomUsager = usagers.random(); 
      var beforeUpdateValue = randomUsager.nom; 
      var afterUpdateEntity = randomUsager.copy(); 
      afterUpdateEntity.nom = 'drink'; 
      expect(afterUpdateEntity.nom, equals('drink')); 
      // usagers.update can only be used if oid, code or id is set. 
      expect(() => usagers.update(randomUsager, afterUpdateEntity), throws); 
    }); 
 
    test("Copy Equality", () { 
      var randomUsager = usagers.random(); 
      randomUsager.display(prefix:"before copy: "); 
      var randomUsagerCopy = randomUsager.copy(); 
      randomUsagerCopy.display(prefix:"after copy: "); 
      expect(randomUsager, equals(randomUsagerCopy)); 
      expect(randomUsager.oid, equals(randomUsagerCopy.oid)); 
      expect(randomUsager.code, equals(randomUsagerCopy.code)); 
      expect(randomUsager.idusager, equals(randomUsagerCopy.idusager)); 
      expect(randomUsager.nom, equals(randomUsagerCopy.nom)); 
      expect(randomUsager.adresse, equals(randomUsagerCopy.adresse)); 
      expect(randomUsager.tel, equals(randomUsagerCopy.tel)); 
      expect(randomUsager.courriel, equals(randomUsagerCopy.courriel)); 
      expect(randomUsager.dateInscription, equals(randomUsagerCopy.dateInscription)); 
      expect(randomUsager.motPasse, equals(randomUsagerCopy.motPasse)); 
 
      expect(randomUsager.id, isNotNull); 
      expect(randomUsagerCopy.id, isNotNull); 
      expect(randomUsager.id, equals(randomUsagerCopy.id)); 
 
      var idsEqual = false; 
      if (randomUsager.id == randomUsagerCopy.id) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
 
      idsEqual = false; 
      if (randomUsager.id.equals(randomUsagerCopy.id)) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
    }); 
 
    test("New usager action undo and redo", () { 
      var usagerConcept = usagers.concept; 
      var usagerCount = usagers.length; 
          var usager = new Usager(usagers.concept); 
      usager.idusager = 'agreement'; 
      usager.nom = 'sin'; 
      usager.adresse = 'house'; 
      usager.tel = 'bank'; 
      usager.courriel = 'training'; 
      usager.dateInscription = new DateTime.now(); 
      usager.motPasse = 'college'; 
      usagers.add(usager); 
      expect(usagers.length, equals(++usagerCount)); 
      usagers.remove(usager); 
      expect(usagers.length, equals(--usagerCount)); 
 
      var action = new AddAction(session, usagers, usager); 
      action.doit(); 
      expect(usagers.length, equals(++usagerCount)); 
 
      action.undo(); 
      expect(usagers.length, equals(--usagerCount)); 
 
      action.redo(); 
      expect(usagers.length, equals(++usagerCount)); 
    }); 
 
    test("New usager session undo and redo", () { 
      var usagerConcept = usagers.concept; 
      var usagerCount = usagers.length; 
          var usager = new Usager(usagers.concept); 
      usager.idusager = 'edition'; 
      usager.nom = 'future'; 
      usager.adresse = 'cardboard'; 
      usager.tel = 'brad'; 
      usager.courriel = 'house'; 
      usager.dateInscription = new DateTime.now(); 
      usager.motPasse = 'theme'; 
      usagers.add(usager); 
      expect(usagers.length, equals(++usagerCount)); 
      usagers.remove(usager); 
      expect(usagers.length, equals(--usagerCount)); 
 
      var action = new AddAction(session, usagers, usager); 
      action.doit(); 
      expect(usagers.length, equals(++usagerCount)); 
 
      session.past.undo(); 
      expect(usagers.length, equals(--usagerCount)); 
 
      session.past.redo(); 
      expect(usagers.length, equals(++usagerCount)); 
    }); 
 
    test("Usager update undo and redo", () { 
      var usager = usagers.random(); 
      var action = new SetAttributeAction(session, usager, "nom", 'wife'); 
      action.doit(); 
 
      session.past.undo(); 
      expect(usager.nom, equals(action.before)); 
 
      session.past.redo(); 
      expect(usager.nom, equals(action.after)); 
    }); 
 
    test("Usager action with multiple undos and redos", () { 
      var usagerCount = usagers.length; 
      var usager1 = usagers.random(); 
 
      var action1 = new RemoveAction(session, usagers, usager1); 
      action1.doit(); 
      expect(usagers.length, equals(--usagerCount)); 
 
      var usager2 = usagers.random(); 
 
      var action2 = new RemoveAction(session, usagers, usager2); 
      action2.doit(); 
      expect(usagers.length, equals(--usagerCount)); 
 
      //session.past.display(); 
 
      session.past.undo(); 
      expect(usagers.length, equals(++usagerCount)); 
 
      session.past.undo(); 
      expect(usagers.length, equals(++usagerCount)); 
 
      //session.past.display(); 
 
      session.past.redo(); 
      expect(usagers.length, equals(--usagerCount)); 
 
      session.past.redo(); 
      expect(usagers.length, equals(--usagerCount)); 
 
      //session.past.display(); 
    }); 
 
    test("Transaction undo and redo", () { 
      var usagerCount = usagers.length; 
      var usager1 = usagers.random(); 
      var usager2 = usagers.random(); 
      while (usager1 == usager2) { 
        usager2 = usagers.random();  
      } 
      var action1 = new RemoveAction(session, usagers, usager1); 
      var action2 = new RemoveAction(session, usagers, usager2); 
 
      var transaction = new Transaction("two removes on usagers", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      transaction.doit(); 
      usagerCount = usagerCount - 2; 
      expect(usagers.length, equals(usagerCount)); 
 
      usagers.display(title:"Transaction Done"); 
 
      session.past.undo(); 
      usagerCount = usagerCount + 2; 
      expect(usagers.length, equals(usagerCount)); 
 
      usagers.display(title:"Transaction Undone"); 
 
      session.past.redo(); 
      usagerCount = usagerCount - 2; 
      expect(usagers.length, equals(usagerCount)); 
 
      usagers.display(title:"Transaction Redone"); 
    }); 
 
    test("Transaction with one action error", () { 
      var usagerCount = usagers.length; 
      var usager1 = usagers.random(); 
      var usager2 = usager1; 
      var action1 = new RemoveAction(session, usagers, usager1); 
      var action2 = new RemoveAction(session, usagers, usager2); 
 
      var transaction = new Transaction( 
        "two removes on usagers, with an error on the second", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      var done = transaction.doit(); 
      expect(done, isFalse); 
      expect(usagers.length, equals(usagerCount)); 
 
      //usagers.display(title:"Transaction with an error"); 
    }); 
 
    test("Reactions to usager actions", () { 
      var usagerConcept = usagers.concept; 
      var usagerCount = usagers.length; 
 
      var reaction = new UsagerReaction(); 
      expect(reaction, isNotNull); 
 
      biblioDomain.startActionReaction(reaction); 
          var usager = new Usager(usagers.concept); 
      usager.idusager = 'understanding'; 
      usager.nom = 'head'; 
      usager.adresse = 'crisis'; 
      usager.tel = 'selfdo'; 
      usager.courriel = 'cup'; 
      usager.dateInscription = new DateTime.now(); 
      usager.motPasse = 'accident'; 
      usagers.add(usager); 
      expect(usagers.length, equals(++usagerCount)); 
      usagers.remove(usager); 
      expect(usagers.length, equals(--usagerCount)); 
 
      var session = biblioDomain.newSession(); 
      var addAction = new AddAction(session, usagers, usager); 
      addAction.doit(); 
      expect(usagers.length, equals(++usagerCount)); 
      expect(reaction.reactedOnAdd, isTrue); 
 
      var setAttributeAction = new SetAttributeAction( 
        session, usager, "nom", 'course'); 
      setAttributeAction.doit(); 
      expect(reaction.reactedOnUpdate, isTrue); 
      biblioDomain.cancelActionReaction(reaction); 
    }); 
 
  }); 
} 
 
class UsagerReaction implements ActionReactionApi { 
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
  var usagers = reservationModel.usagers; 
  testBiblioReservationUsagers(biblioDomain, reservationModel, usagers); 
} 
 
