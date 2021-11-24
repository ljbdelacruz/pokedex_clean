



import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex_clean/core/error/failures.dart';
import 'package:pokedex_clean/core/usecase/usecase.dart';
import 'package:pokedex_clean/features/pokemon/domain/entity/pokemon_entity.dart';

class FetchPokemonDetailUseCase implements UseCase<PokemonDatabaseEntity, FetchPokemonDetailUseCaseParam>{
  // final BillersRepository repo;
  // FetchMergedBillersUseCase(this.repo);
  @override
  Future<Either<Failure, PokemonDatabaseEntity>> call(FetchPokemonDetailUseCaseParam param) async{
    // TODO: implement call
    // var result = await repo.fetchMergedBillers();
    // return result;
  }
}

class FetchPokemonDetailUseCaseParam extends Equatable{
  final String name;
  FetchPokemonDetailUseCaseParam({this.name=""});

}

