




import 'package:pokedex_clean/core/network/network_info.dart';
import 'package:pokedex_clean/features/pokemon/data/datasource/pokemon_local_datasource.dart';
import 'package:pokedex_clean/features/pokemon/data/datasource/pokemon_remote_datasource.dart';
import 'package:pokedex_clean/features/pokemon/data/model/pokemon_model.dart';
import 'package:pokedex_clean/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_clean/features/pokemon/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository{
  
  final NetworkInfo networkInfo;
  PokemonRemoteDatasource remoteDS;
  PokemonLocalDatasource localDS;
  PokemonRepositoryImpl({this.remoteDS, this.networkInfo, this.localDS});



  @override
  Future<Either<Failure, PokemonDetailsModel>> fetchPokemonDetail({String name = ""}) async{
    // TODO: implement fetchPokemonDetail
    try{
      if(await networkInfo.isConnected){
        var result = await remoteDS.fetchPokemonDetail(name:name);
        return result;
      }else{
        var result = await localDS.fetchPokemonDetail(name:name);
        if(result.isLeft()){
          return Left(NoInternetFailure());
        }else{
          return result;
        }
      }
    }catch(e){
      return Left(RepositoryFailure());
    }
  }

  @override
  Future<Either<Failure, PokemonDatabaseModel>> fetchAllPokemons() async{
    // TODO: implement fetchAllPokemons
    try{
      if(await networkInfo.isConnected){
        var result = await remoteDS.fetchPokemonList();
        return result;
      }else{
        var result = await localDS.fetchPokemonList();
        if(result.isLeft()){
          return Left(NoInternetFailure());
        }else{
          return result;
        }
      }
    }catch(e){
      return Left(RepositoryFailure());
    }
  }
  
}