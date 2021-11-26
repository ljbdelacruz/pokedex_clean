



import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get/get.dart';
import 'package:pokedex_clean/core/network/network_info.dart';
import 'package:pokedex_clean/core/network/rest_client.dart';
import 'package:pokedex_clean/core/test/config.dart';
import 'package:pokedex_clean/features/pokemon/data/datasource/pokemon_remote_datasource.dart';
import 'package:pokedex_clean/features/pokemon/data/repository/pokemon_repository_impl.dart';
import 'package:pokedex_clean/features/pokemon/domain/repository/pokemon_repository.dart';
import 'package:pokedex_clean/features/pokemon/domain/usecase/pokemon_usecase.dart';

class PokemonDIService extends GetxController {
  PokemonRemoteDatasource _remoteDS;
  MyConfig _config;
  RestClient _restClient;
  PokemonRepository _repo;
  DataConnectionChecker _dcChecker;
  NetworkInfo _networkInfo;
  FetchPokemonDetailUseCase _fetchPokemonDetailUseCase;
  
  FetchPokemonDetailUseCase getPokemonDetailUseCase(){
    return _fetchPokemonDetailUseCase;
  }
  FetchAllPokemonUseCase _fetchAllPokemonUseCase;
  FetchAllPokemonUseCase getAllPokemonUseCase(){
    return _fetchAllPokemonUseCase;
  }



  PokemonDIService(){
    this._config = new MyConfig();
    _restClient = new RestClient();
    _dcChecker = new DataConnectionChecker();
    _networkInfo = new NetworkInfoImpl(_dcChecker);
    _remoteDS = new PokemonRemoteDatasourceImpl(baseUrl: _config.apiUrl, header:{}, dio: _restClient.dio);
    _repo = new PokemonRepositoryImpl(remoteDS: _remoteDS, networkInfo: _networkInfo);
    _fetchPokemonDetailUseCase = FetchPokemonDetailUseCase(_repo);
    _fetchAllPokemonUseCase=FetchAllPokemonUseCase(_repo);
  }
}