 
// test/biblio/reservation/biblio_reservation_type_ouvrage_test.dart 
 
import "package:unittest/unittest.dart"; 
import "package:dartling/dartling.dart"; 
import "package:biblio_reservation/biblio_reservation.dart"; 
 
testBiblioReservationTypeOuvrages( 
    BiblioDomain biblioDomain, ReservationModel reservationModel, TypeOuvrages typeOuvrages) { 
  DomainSession session; 
  group("Testing Biblio.Reservation.TypeOuvrage", () { 
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
      expect(typeOuvrages.isEmpty, isFalse); 
    }); 
 
    test("Empty model", () { 
      reservationModel.clear(); 
      expect(reservationModel.isEmpty, isTrue); 
      expect(typeOuvrages.isEmpty, isTrue); 
      expect(typeOuvrages.errors.isEmpty, isTrue); 
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
      var json = reservationModel.fromEntryToJson("TypeOuvrage"); 
      expect(json, isNotNull); 
 
      print(json); 
      //reservationModel.displayEntryJson("TypeOuvrage"); 
      //reservationModel.displayJson(); 
      //reservationModel.display(); 
    }); 
 
    test("From JSON to model entry", () { 
      var json = reservationModel.fromEntryToJson("TypeOuvrage"); 
      typeOuvrages.clear(); 
      expect(typeOuvrages.isEmpty, isTrue); 
      reservationModel.fromJsonToEntry(json); 
      expect(typeOuvrages.isEmpty, isFalse); 
 
      typeOuvrages.display(title: "From JSON to model entry"); 
    }); 
 
    test("Add typeOuvrage required error", () { 
      // no required attribute that is not id 
    }); 
 
    test("Add typeOuvrage unique error", () { 
      var typeOuvrageConcept = typeOuvrages.concept; 
      var typeOuvrageCount = typeOuvrages.length; 
      var typeOuvrage = new TypeOuvrage(typeOuvrageConcept); 
      var randomTypeOuvrage = typeOuvrages.random(); 
      typeOuvrage.idType = randomTypeOuvrage.idType; 
      var added = typeOuvrages.add(typeOuvrage); 
      expect(added, isFalse); 
      expect(typeOuvrages.length, equals(typeOuvrageCount)); 
      expect(typeOuvrages.errors.length, greaterThan(0)); 
 
      typeOuvrages.errors.display(title: "Add typeOuvrage unique error"); 
    }); 
 
    test("Not found typeOuvrage by new oid", () { 
      var dartlingOid = new Oid.ts(1345648254063); 
      var typeOuvrage = typeOuvrages.singleWhereOid(dartlingOid); 
      expect(typeOuvrage, isNull); 
    }); 
 
    test("Find typeOuvrage by oid", () { 
      var randomTypeOuvrage = typeOuvrages.random(); 
      var typeOuvrage = typeOuvrages.singleWhereOid(randomTypeOuvrage.oid); 
      expect(typeOuvrage, isNotNull); 
      expect(typeOuvrage, equals(randomTypeOuvrage)); 
    }); 
 
    test("Find typeOuvrage by attribute id", () { 
      var randomTypeOuvrage = typeOuvrages.random(); 
      var typeOuvrage = 
          typeOuvrages.singleWhereAttributeId("idType", randomTypeOuvrage.idType); 
      expect(typeOuvrage, isNotNull); 
      expect(typeOuvrage.idType, equals(randomTypeOuvrage.idType)); 
    }); 
 
    test("Find typeOuvrage by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Find typeOuvrage by attribute", () { 
      var randomTypeOuvrage = typeOuvrages.random(); 
      var typeOuvrage = 
          typeOuvrages.firstWhereAttribute("type", randomTypeOuvrage.type); 
      expect(typeOuvrage, isNotNull); 
      expect(typeOuvrage.type, equals(randomTypeOuvrage.type)); 
    }); 
 
    test("Select typeOuvrages by attribute", () { 
      var randomTypeOuvrage = typeOuvrages.random(); 
      var selectedTypeOuvrages = 
          typeOuvrages.selectWhereAttribute("type", randomTypeOuvrage.type); 
      expect(selectedTypeOuvrages.isEmpty, isFalse); 
      selectedTypeOuvrages.forEach((se) => 
          expect(se.type, equals(randomTypeOuvrage.type))); 
 
      //selectedTypeOuvrages.display(title: "Select typeOuvrages by type"); 
    }); 
 
    test("Select typeOuvrages by required attribute", () { 
      // no required attribute that is not id 
    }); 
 
    test("Select typeOuvrages by attribute, then add", () { 
      var randomTypeOuvrage = typeOuvrages.random(); 
      var selectedTypeOuvrages = 
          typeOuvrages.selectWhereAttribute("type", randomTypeOuvrage.type); 
      expect(selectedTypeOuvrages.isEmpty, isFalse); 
      expect(selectedTypeOuvrages.source.isEmpty, isFalse); 
      var typeOuvragesCount = typeOuvrages.length; 
 
      var typeOuvrage = new TypeOuvrage(typeOuvrages.concept); 
      typeOuvrage.idType = 2078; 
      typeOuvrage.type = 'yellow'; 
      var added = selectedTypeOuvrages.add(typeOuvrage); 
      expect(added, isTrue); 
      expect(typeOuvrages.length, equals(++typeOuvragesCount)); 
 
      //selectedTypeOuvrages.display(title: 
      //  "Select typeOuvrages by attribute, then add"); 
      //typeOuvrages.display(title: "All typeOuvrages"); 
    }); 
 
    test("Select typeOuvrages by attribute, then remove", () { 
      var randomTypeOuvrage = typeOuvrages.random(); 
      var selectedTypeOuvrages = 
          typeOuvrages.selectWhereAttribute("type", randomTypeOuvrage.type); 
      expect(selectedTypeOuvrages.isEmpty, isFalse); 
      expect(selectedTypeOuvrages.source.isEmpty, isFalse); 
      var typeOuvragesCount = typeOuvrages.length; 
 
      var removed = selectedTypeOuvrages.remove(randomTypeOuvrage); 
      expect(removed, isTrue); 
      expect(typeOuvrages.length, equals(--typeOuvragesCount)); 
 
      randomTypeOuvrage.display(prefix: "removed"); 
      //selectedTypeOuvrages.display(title: 
      //  "Select typeOuvrages by attribute, then remove"); 
      //typeOuvrages.display(title: "All typeOuvrages"); 
    }); 
 
    test("Sort typeOuvrages", () { 
      typeOuvrages.sort(); 
 
      //typeOuvrages.display(title: "Sort typeOuvrages"); 
    }); 
 
    test("Order typeOuvrages", () { 
      var orderedTypeOuvrages = typeOuvrages.order(); 
      expect(orderedTypeOuvrages.isEmpty, isFalse); 
      expect(orderedTypeOuvrages.length, equals(typeOuvrages.length)); 
      expect(orderedTypeOuvrages.source.isEmpty, isFalse); 
      expect(orderedTypeOuvrages.source.length, equals(typeOuvrages.length)); 
      expect(orderedTypeOuvrages, isNot(same(typeOuvrages))); 
 
      //orderedTypeOuvrages.display(title: "Order typeOuvrages"); 
    }); 
 
    test("Copy typeOuvrages", () { 
      var copiedTypeOuvrages = typeOuvrages.copy(); 
      expect(copiedTypeOuvrages.isEmpty, isFalse); 
      expect(copiedTypeOuvrages.length, equals(typeOuvrages.length)); 
      expect(copiedTypeOuvrages, isNot(same(typeOuvrages))); 
      copiedTypeOuvrages.forEach((e) => 
        expect(e, equals(typeOuvrages.singleWhereOid(e.oid)))); 
      copiedTypeOuvrages.forEach((e) => 
        expect(e, isNot(same(typeOuvrages.singleWhereId(e.id))))); 
 
      //copiedTypeOuvrages.display(title: "Copy typeOuvrages"); 
    }); 
 
    test("True for every typeOuvrage", () { 
      // no required attribute that is not id 
    }); 
 
    test("Random typeOuvrage", () { 
      var typeOuvrage1 = typeOuvrages.random(); 
      expect(typeOuvrage1, isNotNull); 
      var typeOuvrage2 = typeOuvrages.random(); 
      expect(typeOuvrage2, isNotNull); 
 
      //typeOuvrage1.display(prefix: "random1"); 
      //typeOuvrage2.display(prefix: "random2"); 
    }); 
 
    test("Update typeOuvrage id with try", () { 
      var randomTypeOuvrage = typeOuvrages.random(); 
      var beforeUpdate = randomTypeOuvrage.idType; 
      try { 
        randomTypeOuvrage.idType = 7148; 
      } on UpdateError catch (e) { 
        expect(randomTypeOuvrage.idType, equals(beforeUpdate)); 
      } 
    }); 
 
    test("Update typeOuvrage id without try", () { 
      var randomTypeOuvrage = typeOuvrages.random(); 
      var beforeUpdateValue = randomTypeOuvrage.idType; 
      expect(() => randomTypeOuvrage.idType = 7714, throws); 
      expect(randomTypeOuvrage.idType, equals(beforeUpdateValue)); 
    }); 
 
    test("Update typeOuvrage id with success", () { 
      var randomTypeOuvrage = typeOuvrages.random(); 
      var afterUpdateEntity = randomTypeOuvrage.copy(); 
      var attribute = randomTypeOuvrage.concept.attributes.singleWhereCode("idType"); 
      expect(attribute.update, isFalse); 
      attribute.update = true; 
      afterUpdateEntity.idType = 9004; 
      expect(afterUpdateEntity.idType, equals(9004)); 
      attribute.update = false; 
      var updated = typeOuvrages.update(randomTypeOuvrage, afterUpdateEntity); 
      expect(updated, isTrue); 
 
      var entity = typeOuvrages.singleWhereAttributeId("idType", 9004); 
      expect(entity, isNotNull); 
      expect(entity.idType, equals(9004)); 
 
      //typeOuvrages.display("After update typeOuvrage id"); 
    }); 
 
    test("Update typeOuvrage non id attribute with failure", () { 
      var randomTypeOuvrage = typeOuvrages.random(); 
      var beforeUpdateValue = randomTypeOuvrage.type; 
      var afterUpdateEntity = randomTypeOuvrage.copy(); 
      afterUpdateEntity.type = 'electronic'; 
      expect(afterUpdateEntity.type, equals('electronic')); 
      // typeOuvrages.update can only be used if oid, code or id is set. 
      expect(() => typeOuvrages.update(randomTypeOuvrage, afterUpdateEntity), throws); 
    }); 
 
    test("Copy Equality", () { 
      var randomTypeOuvrage = typeOuvrages.random(); 
      randomTypeOuvrage.display(prefix:"before copy: "); 
      var randomTypeOuvrageCopy = randomTypeOuvrage.copy(); 
      randomTypeOuvrageCopy.display(prefix:"after copy: "); 
      expect(randomTypeOuvrage, equals(randomTypeOuvrageCopy)); 
      expect(randomTypeOuvrage.oid, equals(randomTypeOuvrageCopy.oid)); 
      expect(randomTypeOuvrage.code, equals(randomTypeOuvrageCopy.code)); 
      expect(randomTypeOuvrage.idType, equals(randomTypeOuvrageCopy.idType)); 
      expect(randomTypeOuvrage.type, equals(randomTypeOuvrageCopy.type)); 
 
      expect(randomTypeOuvrage.id, isNotNull); 
      expect(randomTypeOuvrageCopy.id, isNotNull); 
      expect(randomTypeOuvrage.id, equals(randomTypeOuvrageCopy.id)); 
 
      var idsEqual = false; 
      if (randomTypeOuvrage.id == randomTypeOuvrageCopy.id) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
 
      idsEqual = false; 
      if (randomTypeOuvrage.id.equals(randomTypeOuvrageCopy.id)) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
    }); 
 
    test("New typeOuvrage action undo and redo", () { 
      var typeOuvrageConcept = typeOuvrages.concept; 
      var typeOuvrageCount = typeOuvrages.length; 
          var typeOuvrage = new TypeOuvrage(typeOuvrages.concept); 
      typeOuvrage.idType = 651; 
      typeOuvrage.type = 'message'; 
      typeOuvrages.add(typeOuvrage); 
      expect(typeOuvrages.length, equals(++typeOuvrageCount)); 
      typeOuvrages.remove(typeOuvrage); 
      expect(typeOuvrages.length, equals(--typeOuvrageCount)); 
 
      var action = new AddAction(session, typeOuvrages, typeOuvrage); 
      action.doit(); 
      expect(typeOuvrages.length, equals(++typeOuvrageCount)); 
 
      action.undo(); 
      expect(typeOuvrages.length, equals(--typeOuvrageCount)); 
 
      action.redo(); 
      expect(typeOuvrages.length, equals(++typeOuvrageCount)); 
    }); 
 
    test("New typeOuvrage session undo and redo", () { 
      var typeOuvrageConcept = typeOuvrages.concept; 
      var typeOuvrageCount = typeOuvrages.length; 
          var typeOuvrage = new TypeOuvrage(typeOuvrages.concept); 
      typeOuvrage.idType = 505; 
      typeOuvrage.type = 'secretary'; 
      typeOuvrages.add(typeOuvrage); 
      expect(typeOuvrages.length, equals(++typeOuvrageCount)); 
      typeOuvrages.remove(typeOuvrage); 
      expect(typeOuvrages.length, equals(--typeOuvrageCount)); 
 
      var action = new AddAction(session, typeOuvrages, typeOuvrage); 
      action.doit(); 
      expect(typeOuvrages.length, equals(++typeOuvrageCount)); 
 
      session.past.undo(); 
      expect(typeOuvrages.length, equals(--typeOuvrageCount)); 
 
      session.past.redo(); 
      expect(typeOuvrages.length, equals(++typeOuvrageCount)); 
    }); 
 
    test("TypeOuvrage update undo and redo", () { 
      var typeOuvrage = typeOuvrages.random(); 
      var action = new SetAttributeAction(session, typeOuvrage, "type", 'teaching'); 
      action.doit(); 
 
      session.past.undo(); 
      expect(typeOuvrage.type, equals(action.before)); 
 
      session.past.redo(); 
      expect(typeOuvrage.type, equals(action.after)); 
    }); 
 
    test("TypeOuvrage action with multiple undos and redos", () { 
      var typeOuvrageCount = typeOuvrages.length; 
      var typeOuvrage1 = typeOuvrages.random(); 
 
      var action1 = new RemoveAction(session, typeOuvrages, typeOuvrage1); 
      action1.doit(); 
      expect(typeOuvrages.length, equals(--typeOuvrageCount)); 
 
      var typeOuvrage2 = typeOuvrages.random(); 
 
      var action2 = new RemoveAction(session, typeOuvrages, typeOuvrage2); 
      action2.doit(); 
      expect(typeOuvrages.length, equals(--typeOuvrageCount)); 
 
      //session.past.display(); 
 
      session.past.undo(); 
      expect(typeOuvrages.length, equals(++typeOuvrageCount)); 
 
      session.past.undo(); 
      expect(typeOuvrages.length, equals(++typeOuvrageCount)); 
 
      //session.past.display(); 
 
      session.past.redo(); 
      expect(typeOuvrages.length, equals(--typeOuvrageCount)); 
 
      session.past.redo(); 
      expect(typeOuvrages.length, equals(--typeOuvrageCount)); 
 
      //session.past.display(); 
    }); 
 
    test("Transaction undo and redo", () { 
      var typeOuvrageCount = typeOuvrages.length; 
      var typeOuvrage1 = typeOuvrages.random(); 
      var typeOuvrage2 = typeOuvrages.random(); 
      while (typeOuvrage1 == typeOuvrage2) { 
        typeOuvrage2 = typeOuvrages.random();  
      } 
      var action1 = new RemoveAction(session, typeOuvrages, typeOuvrage1); 
      var action2 = new RemoveAction(session, typeOuvrages, typeOuvrage2); 
 
      var transaction = new Transaction("two removes on typeOuvrages", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      transaction.doit(); 
      typeOuvrageCount = typeOuvrageCount - 2; 
      expect(typeOuvrages.length, equals(typeOuvrageCount)); 
 
      typeOuvrages.display(title:"Transaction Done"); 
 
      session.past.undo(); 
      typeOuvrageCount = typeOuvrageCount + 2; 
      expect(typeOuvrages.length, equals(typeOuvrageCount)); 
 
      typeOuvrages.display(title:"Transaction Undone"); 
 
      session.past.redo(); 
      typeOuvrageCount = typeOuvrageCount - 2; 
      expect(typeOuvrages.length, equals(typeOuvrageCount)); 
 
      typeOuvrages.display(title:"Transaction Redone"); 
    }); 
 
    test("Transaction with one action error", () { 
      var typeOuvrageCount = typeOuvrages.length; 
      var typeOuvrage1 = typeOuvrages.random(); 
      var typeOuvrage2 = typeOuvrage1; 
      var action1 = new RemoveAction(session, typeOuvrages, typeOuvrage1); 
      var action2 = new RemoveAction(session, typeOuvrages, typeOuvrage2); 
 
      var transaction = new Transaction( 
        "two removes on typeOuvrages, with an error on the second", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      var done = transaction.doit(); 
      expect(done, isFalse); 
      expect(typeOuvrages.length, equals(typeOuvrageCount)); 
 
      //typeOuvrages.display(title:"Transaction with an error"); 
    }); 
 
    test("Reactions to typeOuvrage actions", () { 
      var typeOuvrageConcept = typeOuvrages.concept; 
      var typeOuvrageCount = typeOuvrages.length; 
 
      var reaction = new TypeOuvrageReaction(); 
      expect(reaction, isNotNull); 
 
      biblioDomain.startActionReaction(reaction); 
          var typeOuvrage = new TypeOuvrage(typeOuvrages.concept); 
      typeOuvrage.idType = 114; 
      typeOuvrage.type = 'guest'; 
      typeOuvrages.add(typeOuvrage); 
      expect(typeOuvrages.length, equals(++typeOuvrageCount)); 
      typeOuvrages.remove(typeOuvrage); 
      expect(typeOuvrages.length, equals(--typeOuvrageCount)); 
 
      var session = biblioDomain.newSession(); 
      var addAction = new AddAction(session, typeOuvrages, typeOuvrage); 
      addAction.doit(); 
      expect(typeOuvrages.length, equals(++typeOuvrageCount)); 
      expect(reaction.reactedOnAdd, isTrue); 
 
      var setAttributeAction = new SetAttributeAction( 
        session, typeOuvrage, "type", 'time'); 
      setAttributeAction.doit(); 
      expect(reaction.reactedOnUpdate, isTrue); 
      biblioDomain.cancelActionReaction(reaction); 
    }); 
 
  }); 
} 
 
class TypeOuvrageReaction implements ActionReactionApi { 
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
  var typeOuvrages = reservationModel.typeOuvrages; 
  testBiblioReservationTypeOuvrages(biblioDomain, reservationModel, typeOuvrages); 
} 
 
