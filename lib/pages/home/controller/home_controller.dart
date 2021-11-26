




import 'package:get/get.dart';



class HomeFooterOrgController extends GetxController{
  final HomePageController homeMngr = Get.put(HomePageController());

  toHomeEvent(){
    homeMngr.toHome();
  }
  toPokemonList(){
    homeMngr.toPokedexList();
  }
}


class HomePageController extends GetxController{
  int pageTemplate = 0;
  updatePageTemplate(int v){
    pageTemplate=v;
    update();
  }
  toHome(){
    this.updatePageTemplate(0);
  }
  toPokedexList(){
    this.updatePageTemplate(1);
  }
}