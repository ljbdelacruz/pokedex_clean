




import 'package:pokedex_clean/features/pokemon/domain/entity/pokemon_entity.dart';

class PokemonDatabaseModel extends PokemonDatabaseEntity{
  PokemonDatabaseModel({List<PokemonDetailsModel> pokemons}):super(pokemons:pokemons);
  factory PokemonDatabaseModel.toMap(dynamic map){
    List<PokemonDetailsModel> pokemons = [];
    map["results"].forEach((e){
      pokemons.add(PokemonDetailsModel.toMapList(e));
    });
    return PokemonDatabaseModel(
      pokemons: pokemons
    );
  }

}


class PokemonDetailsModel extends PokemonDetailsEntity{

  PokemonDetailsModel({List<PokemonAbilityModel> abilities, double height=0, String name="", List<PokemonTypeModel> types, String image}):super(abilities: abilities, height: height, name:name, type: types);

  factory PokemonDetailsModel.toMap(dynamic map){
    List<PokemonAbilityModel> abilities = [];
    print(map["abilities"].toString());
    map["abilities"].forEach((e){
      abilities.add(PokemonAbilityModel.toMap(e));
    });
    List<PokemonTypeModel> types = [];
    map["types"].forEach((e){
      types.add(PokemonTypeModel.toMap(e["type"]));
    });
    return PokemonDetailsModel(
      abilities: abilities,
      height: double.parse(map["height"].toString()) ?? 0,
      name: map["name"] ?? "",
      types: types,
      image: map["sprites"]["front_default"] ?? ""
    );
  }

  factory PokemonDetailsModel.toMapList(dynamic map){
    return PokemonDetailsModel(
      name: map["name"] ?? "",
    );
  }


}

class PokemonAbilityModel extends PokemonAbilityEntity{
  PokemonAbilityModel({String name="", String details="", bool isHidden=false }):super(name:name, details: details, isHidden:isHidden);
  factory PokemonAbilityModel.toMap(dynamic map){
    return PokemonAbilityModel(
      name: map["name"] ?? "",
      details: map["details"] ?? "",
      isHidden: map["is_hidden"] ?? false
    );
  }
}


class PokemonTypeModel extends PokemonTypeEntity{
  PokemonTypeModel({String name=""}):super(name:name);
  factory PokemonTypeModel.toMap(dynamic map){
    return PokemonTypeModel(
      name: map["name"] ?? ""
    );
  }

}