import 'package:polymer/polymer.dart';
 



@CustomTag('main-content')
class MainContentElement extends PolymerElement {
  
  
  @published bool importBiblioClicked;
  @published bool importOuvrageClicked;
  @published bool importtypOuvrClicked;
  @published bool importUsagerClicked;
  @published bool ajoutBiblioClicked;
  @published bool ajoutUsagerClicked;
  @published bool ajoutOuvrageClicked;
  @published bool ajoutTouvrageClicked;

  
  
  MainContentElement.created() : super.created() {
    print("je suis dans main content");
    
  }
  
  
  
  
}