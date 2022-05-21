



import 'package:get/get.dart';
import 'package:pokedex_clean/features/pokemon/data/model/pokemon_model.dart';
import 'package:pokedex_clean/features/pokemon/presentation/controller/pokemon_route_controller.dart';

import 'pokemon_global_controller.dart';

class PokemonListOrgController extends GetxController{
  PokemonGlobalService service = PokemonGlobalService();
  List<PokemonDetailsModel> pokemons = [];

  fetchAllPokemons() async{
    if(this.pokemons.length <= 0){
      var result = await service.fetchAllPokemons();
      result.fold((l) => null, (r){
        this.pokemons=r.pokemons.toList();
        update();
      });
    }
  }
}

class PokemonCellsMolController extends GetxController{
  PokemonDetailsModel selectedPokemon;
  final PokemonPageManagementTemplateController templateMngr= Get.put(PokemonPageManagementTemplateController());
  selectedPokemonEvent(PokemonDetailsModel pokemon){
    this.selectedPokemon=pokemon;
    templateMngr.toPokemonDetailsTemp();
  }
}

class DisplayPokemonDetailsMolController extends GetxController{
  PokemonDetailsModel details;
  PokemonGlobalService service = PokemonGlobalService();

  fetchPokemonDetails(String name) async{
    var result = await service.fetchPokemonDetails(name);
    result.fold((l) => null, (r){
      this.details=r;
      update();
    });
  }

}