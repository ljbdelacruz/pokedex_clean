



import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex_clean/core/error/failures.dart';
import 'package:pokedex_clean/core/usecase/usecase.dart';
import 'package:pokedex_clean/features/pokemon/domain/entity/pokemon_entity.dart';
import 'package:pokedex_clean/features/pokemon/domain/repository/pokemon_repository.dart';

class FetchPokemonDetailUseCase implements UseCase<PokemonDetailsEntity, FetchPokemonDetailUseCaseParam>{
  // final BillersRepository repo;
  // FetchMergedBillersUseCase(this.repo);
  final PokemonRepository repo;
  FetchPokemonDetailUseCase(this.repo);

  @override
  Future<Either<Failure, PokemonDetailsEntity>> call(FetchPokemonDetailUseCaseParam param) async{
    // TODO: implement call
    var result = await repo.fetchPokemonDetail(name: param.name);
    return result;
  }
}

class FetchPokemonDetailUseCaseParam extends Equatable{
  final String name;
  FetchPokemonDetailUseCaseParam({this.name=""});
}


class FetchAllPokemonUseCase implements UseCase<PokemonDatabaseEntity, NoParams>{
  final PokemonRepository repo;
  FetchAllPokemonUseCase(this.repo);
  @override
  Future<Either<Failure, PokemonDatabaseEntity>> call(NoParams param) async{
    // TODO: implement call
    return await repo.fetchAllPokemons();

  }


}




