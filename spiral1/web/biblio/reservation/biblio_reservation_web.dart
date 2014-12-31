 
// web/biblio/reservation/biblio_reservation_web.dart 
 
import "dart:html"; 
 
import "package:dartling_default_app/dartling_default_app.dart"; 
import "package:biblio_reservation/biblio_reservation.dart"; 
 
initData(Repository repository) { 
   var biblioDomain = repository.getDomainModels("Biblio"); 
   var reservationModel = biblioDomain.getModelEntries("Reservation"); 
   reservationModel.init(); 
   //reservationModel.display(); 
} 
 
showData(Repository repository) { 
   var mainView = new View(document, "main"); 
   mainView.repo = repository; 
   new RepoMainSection(mainView); 
} 
 
void main() { 
  var repository = new Repository(); 
  initData(repository); 
  showData(repository); 
} 
 
