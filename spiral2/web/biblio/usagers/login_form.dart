import 'dart:html';
import 'package:polymer/polymer.dart';
import "package:biblio_reservation/biblio_reservation.dart"; 
 

@CustomTag('login-form')
class LoginFormElement extends PolymerElement {
  
  
  @published Usager usager;
  
  @observable String errorMessage = ''; 
  
  
  
  LoginFormElement.created() : super.created() {}
  
  void newUsagerToAdd(Event e, var detail, Node target){
    dispatchEvent(new CustomEvent('newusageratoadd'));
  }
  
  loginUsager(Event event, Object detail, Node sender) {
  
    if ((usager.motPasse.length > 0) && (usager.courriel.length > 0)){

      dispatchEvent(new CustomEvent('usagerauthentified',
          detail: {'usager': usager}));
      
    }
    
    
    

    
    
  }
  
  
}