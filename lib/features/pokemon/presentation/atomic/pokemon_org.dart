import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../controller/pokemon_controller.dart';
import 'pokemon_mol.dart';

class PokemonListOrg extends StatelessWidget{
  PokemonListOrgController controller = Get.put(PokemonListOrgController());
  PokemonListOrg(){
    controller.fetchAllPokemons();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<PokemonListOrgController>(builder:(_){
      List<Widget> cells = [];
      _.pokemons.forEach((element) { 
        cells.add(Container(
          width:MediaQuery.of(context).size.width,
          child:PokemonCellsMol(element)));
      });
      return ListView(
        shrinkWrap: true,
        children:cells);
    });
  }
  
}