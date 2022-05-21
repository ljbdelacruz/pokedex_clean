import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/model/pokemon_model.dart';
import '../../domain/usecase/pokemon_usecase.dart';
import 'pokemon_di.dart';

class PokemonGlobalService {
  PokemonDIService dataC = Get.put(PokemonDIService());

  Future<Either<Failure, PokemonDatabaseModel>> fetchAllPokemons() async{
    var result = await dataC.getAllPokemonUseCase().call(NoParams());
    result.fold((l){
      //evaluate failure here
    }, (r) => null);
    return result;
  }
  Future<Either<Failure, PokemonDetailsModel>> fetchPokemonDetails(String name) async{
    var result = await dataC.getPokemonDetailUseCase().call(FetchPokemonDetailUseCaseParam(name: name));
    result.fold((l){
      //evaluate failure here
    }, (r) => null);
    return result;
  }
}