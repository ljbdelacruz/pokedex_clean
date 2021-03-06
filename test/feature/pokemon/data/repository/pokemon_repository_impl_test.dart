



import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_clean/core/network/network_info.dart';
import 'package:pokedex_clean/core/network/rest_client.dart';
import 'package:pokedex_clean/core/test/test_config.dart';
import 'package:pokedex_clean/features/pokemon/data/datasource/pokemon_local_datasource.dart';
import 'package:pokedex_clean/features/pokemon/data/datasource/pokemon_remote_datasource.dart';
import 'package:pokedex_clean/features/pokemon/data/repository/pokemon_repository_impl.dart';
import 'package:pokedex_clean/features/pokemon/domain/repository/pokemon_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/fixtures/fixture_reader.dart';

class MockNetworkInfo extends Mock implements NetworkInfo{

}

class MockSharedPref extends Mock implements SharedPreferences{

}


void main(){
  MockNetworkInfo networkInfo;
  PokemonRepository repo;
  PokemonRemoteDatasource remoteDS;
  PokemonLocalDatasource localDS;
  MockSharedPref sharedPref;
  TestConfig testConfig;
  RestClient restClient;

  setUp((){
    testConfig = new TestConfig();
    restClient = new RestClient();
    networkInfo = new MockNetworkInfo();
    sharedPref = MockSharedPref();
    localDS = PokemonLocalDatasourceImpl(sharedPref: sharedPref);
    remoteDS = PokemonRemoteDatasourceImpl(baseUrl:testConfig.apiUrl, header:{}, dio: restClient.getDioDebugging(), localDS: localDS);
    repo = PokemonRepositoryImpl(remoteDS: remoteDS, networkInfo: networkInfo, localDS: localDS);
  });


  group("testing repository pokemon list", (){
    test("success no internet", () async{
      when(networkInfo.isConnected).thenAnswer((realInvocation) => Future.value(false));
      when(sharedPref.getString(any)).thenAnswer((_) => fixture("test/core/fixtures/pokemon/pokemonlist.json"));
      var result = await repo.fetchAllPokemons();
      result.fold((l){
        print("ERROR");
        print(l);
      }, (r) {
        print("Success");
        print(r.pokemons.length);
      });
    });
  });


  group("testing repository pokemon details", (){
    test("success", () async{
      when(networkInfo.isConnected).thenAnswer((realInvocation) => Future.value(true));
      var result = await repo.fetchPokemonDetail(name:"bulbasaur");
      result.fold((l){
        print("ERROR");
        print(l);
      }, (r) {
        print("Success");
        print(r.name);
      });
    });
    test("success no internet", () async{
      when(networkInfo.isConnected).thenAnswer((realInvocation) => Future.value(false));
      when(sharedPref.getString(any)).thenAnswer((_) => fixture("test/core/fixtures/pokemon/pokemondetails_bulbasaur.json"));
      var result = await repo.fetchPokemonDetail(name:"zapdos");
      result.fold((l){
        print("ERROR");
        print(l);
      }, (r) {
        print("Success");
        print(r.name);
      });
    });
  });
}