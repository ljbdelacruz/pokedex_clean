






import 'package:dartz/dartz.dart';
import 'package:pokedex_clean/core/error/failures.dart';
import 'package:pokedex_clean/features/pokemon/domain/entity/pokemon_entity.dart';

abstract class PokemonRepository{
  Future<Either<Failure, PokemonDetailsEntity>> fetchAllPokemons();
  Future<Either<Failure, PokemonDetailsEntity>> fetchPokemonDetail({String name=""});
}