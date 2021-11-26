




import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_clean/features/pokemon/data/datasource/pokemon_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/fixtures/fixture_reader.dart';


class MockPokemonLocalDatasource extends Mock implements SharedPreferences{

}

void main(){
  PokemonLocalDatasource localDS;
  MockPokemonLocalDatasource mockLocalDS;


  setUp((){
    mockLocalDS = MockPokemonLocalDatasource();
    localDS = PokemonLocalDatasourceImpl(sharedPref: mockLocalDS);
  });

  group("pokemon local data source ", (){
    test("test success list", () async{
      when(mockLocalDS.getString(any)).thenAnswer((_) => fixture("test/core/fixtures/pokemon/pokemonlist.json"));
      var result = await localDS.fetchPokemonList();
      verify(mockLocalDS.getString(any));
      result.fold((l) => null, (r){
        print("POkemons list");
        print(r.pokemons.length);
      });
    });
    test("test success details", () async{
      when(mockLocalDS.getString(any)).thenAnswer((_) => fixture("test/core/fixtures/pokemon/pokemondetails_bulbasaur.json"));
      var result = await localDS.fetchPokemonDetail(name:"zapdos");
      verify(mockLocalDS.getString(any));
      expect(result, isNot(null));
      result.fold((l) => null, (r){
        print("Success pokemon details");
        print(r.name);
      });
    });
  });



}