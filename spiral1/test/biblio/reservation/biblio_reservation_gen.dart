 
// test/biblio/reservation/biblio_reservation_gen.dart 
 
import "package:biblio_reservation/biblio_reservation.dart"; 
 
genCode(Repository repository) { 
  repository.gen("biblio_reservation"); 
} 
 
initData(Repository repository) { 
   var biblioDomain = repository.getDomainModels("Biblio"); 
   var reservationModel = biblioDomain.getModelEntries("Reservation"); 
   reservationModel.init(); 
   //reservationModel.display(); 
} 
 
void main() { 
  var repository = new Repository(); 
  genCode(repository); 
  //initData(repository); 
} 
 
