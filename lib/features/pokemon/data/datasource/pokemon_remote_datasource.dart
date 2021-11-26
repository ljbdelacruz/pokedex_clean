


import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokedex_clean/core/error/failures.dart';
import 'package:pokedex_clean/features/pokemon/data/model/pokemon_model.dart';

import 'pokemon_local_datasource.dart';

abstract class PokemonRemoteDatasource{
  Future<Either<Failure, PokemonDetailsModel>> fetchPokemonDetail({String name});
  Future<Either<Failure, PokemonDatabaseModel>> fetchPokemonList();
}


class PokemonRemoteDatasourceImpl extends PokemonRemoteDatasource{
  final String baseUrl;
  final Map<String, dynamic> header;
  final Dio dio;
  final PokemonLocalDatasource localDS;

  PokemonRemoteDatasourceImpl({this.baseUrl="", this.header, this.dio, this.localDS});

  @override
  Future<Either<Failure, PokemonDetailsModel>> fetchPokemonDetail({String name}) async{
    // TODO: implement fetchPokemonDetail
    try{
      var response = await dio.get(baseUrl+'pokemon/'+name, options: Options(headers: header, contentType: "application/json"));
      if(response.statusCode == 200){
        localDS.cachePokemonDetails(name, response.data);
        return Right(PokemonDetailsModel.toMap(response.data));
      }else if(response.statusCode == 502){
        return Left(BadGatewayFailure());
      }
    }on DioError catch (e) {
      print("Dio Error");
      print(e);
      if(e.response.statusCode == 401){
        return Left(UnauthorizedFailure());
      }else{
        return Left(ServerFailure());
      }
    }catch(e){
      print("Error");
      print(e);
      return Left(MappingFailure());
    }

  }

  @override
  Future<Either<Failure, PokemonDatabaseModel>> fetchPokemonList() async{
    // TODO: implement fetchPokemonList
    try{
      var response = await dio.get(baseUrl+'pokemon', options: Options(headers: header, contentType: "application/json"));
      if(response.statusCode == 200){
        localDS.cachePokemonList(response.data);
        return Right(PokemonDatabaseModel.toMap(response.data));
      }else if(response.statusCode == 502){
        return Left(BadGatewayFailure());
      }
    }on DioError catch (e) {
      print("Dio Error");
      print(e);
      if(e.response.statusCode == 401){
        return Left(UnauthorizedFailure());
      }else{
        return Left(ServerFailure());
      }
    }catch(e){
      print("Error");
      print(e);
      return Left(MappingFailure());
    }
  }

  
}