part of biblio_reservation; 
 
// lib/gen/biblio/models.dart 
 
class BiblioModels extends DomainModels { 
 
  BiblioModels(Domain domain) : super(domain) { 
    // fromJsonToModel function from dartling/lib/domain/model/transfer.json.dart 
 
    Model model = fromJsonToModel(biblioReservationModelJson, domain, "Reservation"); 
    ReservationModel reservationModel = new ReservationModel(model); 
    add(reservationModel); 
 
  } 
 
} 
 
