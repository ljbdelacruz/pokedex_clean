




import 'package:pokedex_clean/features/pokemon/domain/entity/pokemon_entity.dart';
import 'package:pokedex_clean/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_clean/features/pokemon/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository{
  

  @override
  Future<Either<Failure, PokemonDetailsEntity>> fetchPokemonDetail({String name = ""}) {
    // TODO: implement fetchPokemonDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PokemonDetailsEntity>> fetchAllPokemons() {
    // TODO: implement fetchAllPokemons
    throw UnimplementedError();
  }
  
}