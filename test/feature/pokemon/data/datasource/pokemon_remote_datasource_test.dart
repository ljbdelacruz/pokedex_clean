import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_clean/core/network/rest_client.dart';
import 'package:pokedex_clean/core/test/test_config.dart';
import 'package:pokedex_clean/features/pokemon/data/datasource/pokemon_local_datasource.dart';
import 'package:pokedex_clean/features/pokemon/data/datasource/pokemon_remote_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){

  PokemonRemoteDatasourceImpl remoteDS;
  TestConfig testConfig;
  RestClient restClient;
  PokemonLocalDatasource localDS;
  SharedPreferences sharedPref;

  setUp(() async{
    testConfig = TestConfig();
    restClient = RestClient();
    sharedPref=await SharedPreferences.getInstance();
    localDS = PokemonLocalDatasourceImpl(sharedPref: sharedPref);
    remoteDS = PokemonRemoteDatasourceImpl(baseUrl: testConfig.apiUrl, header: {}, dio:restClient.getDioDebugging(), localDS:localDS);
  });

  group("testing fetching all pokemon list", (){
    test("success", () async{
      var result = await remoteDS.fetchPokemonList();
      result.fold((l){
        print("ERROR");
        print(l);
      }, (r) {
        print("POkemons");
        print(r.pokemons.length);
      });
    });
  });

  group("testing fetching pokemon details", (){

    test("success bulbasaur", () async{
      var result = await remoteDS.fetchPokemonDetail(name:"bulbasaur");
      result.fold((l){
        print("ERROR");
        print(l);
      }, (r) {
        print(r.name);
        print(r.height);
        print(r.abilities.length);
        print(r.type.length);
        expect(r.name, "bulbasaur");
      });
    });

    test("failure empty string", () async{
      var result = await remoteDS.fetchPokemonDetail(name:"");
      result.fold((l){
        print("ERROR test");
        print(l);
      }, (r) => null);
    });


  });
}