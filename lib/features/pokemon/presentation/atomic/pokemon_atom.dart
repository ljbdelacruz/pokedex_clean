



import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pokedex_clean/core/theme/core_atom.dart';

import '../../data/model/pokemon_model.dart';
import '../controller/pokemon_controller.dart';

class DisplaySelectedPokemonTextAtom extends StatelessWidget{
  final TextStyle style;
  DisplaySelectedPokemonTextAtom(this.style);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<PokemonCellsMolController>(builder:(_){
      return Text(_.selectedPokemon.name, style: style);
    });
  }
}


class PokemonTypeCellAtom extends StatelessWidget{
  final PokemonTypeModel type;
  PokemonTypeCellAtom(this.type);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawMaterialAtom(content: Text(type.name));
  }
  
}