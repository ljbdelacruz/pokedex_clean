



import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get/get.dart';
import 'package:pokedex_clean/core/network/network_info.dart';
import 'package:pokedex_clean/core/network/rest_client.dart';
import 'package:pokedex_clean/core/test/config.dart';
import 'package:pokedex_clean/features/pokemon/data/datasource/pokemon_local_datasource.dart';
import 'package:pokedex_clean/features/pokemon/data/datasource/pokemon_remote_datasource.dart';
import 'package:pokedex_clean/features/pokemon/data/repository/pokemon_repository_impl.dart';
import 'package:pokedex_clean/features/pokemon/domain/repository/pokemon_repository.dart';
import 'package:pokedex_clean/features/pokemon/domain/usecase/pokemon_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonDIService extends GetxController {
  PokemonRemoteDatasource _remoteDS;
  MyConfig _config;
  RestClient _restClient;
  PokemonRepository _repo;
  DataConnectionChecker _dcChecker;
  NetworkInfo _networkInfo;
  FetchPokemonDetailUseCase _fetchPokemonDetailUseCase;
  PokemonLocalDatasource _localDS;
  SharedPreferences _sharedPref;

  
  FetchPokemonDetailUseCase getPokemonDetailUseCase(){
    return _fetchPokemonDetailUseCase;
  }
  FetchAllPokemonUseCase _fetchAllPokemonUseCase;
  FetchAllPokemonUseCase getAllPokemonUseCase(){
    if( _fetchAllPokemonUseCase != null){
      return _fetchAllPokemonUseCase;
    }else{
      print("Use case is null");
      return _fetchAllPokemonUseCase;
    }
  }

  PokemonDIService(){
    setup();
  }
  setup() async{
    this._config = new MyConfig();
    _restClient = new RestClient();
    _dcChecker = new DataConnectionChecker();
    this._sharedPref = await SharedPreferences.getInstance();
    _localDS = PokemonLocalDatasourceImpl(sharedPref: _sharedPref);
    print("LOCAL DS Initialized");
    _networkInfo = new NetworkInfoImpl(_dcChecker);
    _remoteDS = new PokemonRemoteDatasourceImpl(baseUrl: _config.apiUrl, header:{}, dio: _restClient.dio, localDS: _localDS);
    _repo = new PokemonRepositoryImpl(remoteDS: _remoteDS, networkInfo: _networkInfo, localDS:_localDS);
    print("Initializing usecase ");
    _fetchPokemonDetailUseCase = FetchPokemonDetailUseCase(_repo);
    _fetchAllPokemonUseCase=FetchAllPokemonUseCase(_repo);
    print("Complete initialization");
  }
}