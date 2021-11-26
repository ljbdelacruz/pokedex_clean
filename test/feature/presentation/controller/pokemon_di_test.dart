



import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:pokedex_clean/features/pokemon/presentation/controller/pokemon_di.dart';

void main(){
  PokemonDIService pokemonDI;

  setUp((){
    pokemonDI = Get.put(PokemonDIService());
  });



  group("testing di", (){
    test("testing fetching use case", (){
      var result = pokemonDI.getAllPokemonUseCase();
      print("Fetching pokemon all use case");
      print(result);
      expect(result, isNotNull);
    });
  });
}