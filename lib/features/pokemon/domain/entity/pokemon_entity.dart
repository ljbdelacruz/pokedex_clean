





import 'package:equatable/equatable.dart';




class PokemonDatabaseEntity extends Equatable{
  final List<PokemonDetailsEntity> pokemons;
  PokemonDatabaseEntity({this.pokemons});
}


class PokemonDetailsEntity extends Equatable{
  final List<PokemonAbilityEntity> abilities;
  final double height;
  final String name;
  final List<PokemonTypeEntity> type;


  PokemonDetailsEntity({this.abilities, this.height = 0, this.name="", this.type});
}


class PokemonAbilityEntity extends Equatable{
  final String name;
  final String details;
  final bool isHidden;
  PokemonAbilityEntity({this.name="", this.details="", this.isHidden=false});
}


class PokemonTypeEntity extends Equatable{
  final String name;
  PokemonTypeEntity({this.name});
}