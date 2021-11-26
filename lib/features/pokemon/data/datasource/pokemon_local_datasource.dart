


import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:pokedex_clean/core/error/failures.dart';
import 'package:pokedex_clean/features/pokemon/data/model/pokemon_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class PokemonLocalDatasource{
  Future<Either<Failure, PokemonDetailsModel>> fetchPokemonDetail({String name});
  Future<Either<Failure, PokemonDatabaseModel>> fetchPokemonList();

  Future<Either<Failure, bool>> cachePokemonList(dynamic data);
  Future<Either<Failure, bool>> cachePokemonDetails(String name, dynamic data);
}


class PokemonLocalDatasourceImpl extends PokemonLocalDatasource{
  final SharedPreferences sharedPref;

  PokemonLocalDatasourceImpl({this.sharedPref});
  @override
  Future<Either<Failure, bool>> cachePokemonDetails(String name, dynamic data) async{
      // TODO: implement cachePokemonDetails
    try{
      return Right(await sharedPref.setString("detail_"+name, jsonEncode(data)));
    }catch(e){
      return Left(CacheFailure());
    }
  }
  
    @override
    Future<Either<Failure, bool>> cachePokemonList(dynamic data) async{
      // TODO: implement cachePokemonList
      try{
        return Right(await sharedPref.setString("pklist", jsonEncode(data)));
      }catch(e){
        return Left(CacheFailure());
      }
    }
  
    @override
    Future<Either<Failure, PokemonDetailsModel>> fetchPokemonDetail({String name}) async{
    // TODO: implement fetchPokemonDetail
      try{
        var result = jsonDecode(sharedPref.getString("detail_"+name));
        return Right(PokemonDetailsModel.toMap(result));
      }catch(e){
        return Left(CacheFailure());
      }
    }

  @override
  Future<Either<Failure, PokemonDatabaseModel>> fetchPokemonList() async{
    // TODO: implement fetchPokemonList
      try{
        var result = jsonDecode(sharedPref.getString("pklist"));
        return Right(PokemonDatabaseModel.toMap(result));
      }catch(e){
        return Left(CacheFailure());
      }
  }

  
}