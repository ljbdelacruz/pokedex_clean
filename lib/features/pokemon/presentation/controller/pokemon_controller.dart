




import 'package:get/get.dart';
import 'package:pokedex_clean/core/usecase/usecase.dart';
import 'package:pokedex_clean/features/pokemon/domain/entity/pokemon_entity.dart';
import 'package:pokedex_clean/features/pokemon/domain/usecase/pokemon_usecase.dart';
import 'package:pokedex_clean/features/pokemon/presentation/controller/pokemon_di.dart';



class DisplayPokemonDetailsOrgController extends GetxController{
  int subPageTemplate = 0;

  updateSubPageTemp(int v){
    this.subPageTemplate = v;
    update();
  }

  toAboutEvent(){
    this.updateSubPageTemp(0);
  }
  toBaseStats(){
    this.updateSubPageTemp(1);
  }
  toEvolution(){
    this.updateSubPageTemp(2);
  }
  toMoves(){
    this.updateSubPageTemp(3);
  }

}

class DisplayPokemonInfoTemplateController extends GetxController{
  PokemonDetailsEntity pokemonDetail;
  PokemonPageManagementTemplateController pageMngr = Get.put(PokemonPageManagementTemplateController());
  PokemonDIService service = Get.put(PokemonDIService());

  bool isProcessing = false;
  updateIsProcessing(bool v){
    this.isProcessing = v;
    update();
  }

  backEvent(){
    print("Back event");
    pageMngr.toPokemonListTemp();
  }


  selectedPokemon(PokemonDetailsEntity detail) async{
    this.updateIsProcessing(true);
    var result = await service.getPokemonDetailUseCase().call(FetchPokemonDetailUseCaseParam(name: detail.name));
    pageMngr.toPokemonDetailsTemp();
    result.fold((l) {
      
    }, (r){
      this.pokemonDetail = r;
      this.updateIsProcessing(false);
    });
  }

}


class DisplayPokemonListOrgController extends GetxController{
  PokemonDIService service = Get.put(PokemonDIService());
  PokemonDatabaseEntity pokemons;
  DisplayPokemonListOrgController(){
    fetchPokemons();
  }
  bool isProcessing=false;
  updateIsProcessing(bool v){
    isProcessing=v;
    update();
  }


  fetchPokemons() async{
    try{
      this.updateIsProcessing(true);
      var result = await service.getAllPokemonUseCase().call(NoParams());
      result.fold((l){
        print(l);
        this.updateIsProcessing(false);
      }, (r){
        this.pokemons = r;
        this.updateIsProcessing(false);
      });
    }catch(e){
      print("ERROR");
      print(e);
    }
  }
}


class DisplayPokemonListTemplate extends GetxController{

}


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