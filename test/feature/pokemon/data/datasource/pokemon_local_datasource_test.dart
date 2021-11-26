




import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_clean/features/pokemon/data/datasource/pokemon_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/fixtures/fixture_reader.dart';


class MockSharedPref extends Mock implements SharedPreferences{

}

void main(){
  PokemonLocalDatasource localDS;
  MockSharedPref mockLocalDS;


  setUp((){
    mockLocalDS = MockSharedPref();
    localDS = PokemonLocalDatasourceImpl(sharedPref: mockLocalDS);
  });

  group("get pokemon local data source ", (){
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


  group("cache pokemon details local data source", (){
    test("success pokemon details", () async{
      when(mockLocalDS.setString(any, any)).thenAnswer((_) => Future.value(true));
      var data = jsonDecode(fixture("test/core/fixtures/pokemon/pokemondetails_bulbasaur.json"));
      var result = await localDS.cachePokemonDetails("zapdos", data);
      verify(mockLocalDS.setString(any, any));
      result.fold((l) => null, (r){
        print("Success caching data");
        print(r);
        expect(true, r);
      });
    });

    test("failed pokemon details", () async{
      when(mockLocalDS.setString(any, any)).thenAnswer((_) => Future.value(false));
      var data = jsonDecode(fixture("test/core/fixtures/pokemon/pokemondetails_bulbasaur.json"));
      var result = await localDS.cachePokemonDetails("zapdos", data);
      verify(mockLocalDS.setString(any, any));
      result.fold((l) {
        print("ERROR");
        print(l);
      }, (r){
        print("Success caching data");
        print(r);
        expect(false, r);
      });
    });
  });



}