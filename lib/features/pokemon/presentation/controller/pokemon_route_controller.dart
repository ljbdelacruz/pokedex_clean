



import 'package:get/get.dart';

class PokemonPageManagementTemplateController extends GetxController{
  int pageTemplate = 0;

  updatePageTemplate(int v){
    this.pageTemplate = v;
    update();
  }

  toPokemonListTemp(){
    this.updatePageTemplate(0);
  }
  toPokemonDetailsTemp(){
    this.updatePageTemplate(1);
  }
}