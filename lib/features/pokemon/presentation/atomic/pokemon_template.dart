





import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_clean/core/theme/core_molecules.dart';
import 'package:pokedex_clean/core/theme/core_theme.dart';
import 'package:pokedex_clean/features/pokemon/presentation/atomic/pokemon_mol.dart';
import 'package:pokedex_clean/features/pokemon/presentation/controller/pokemon_route_controller.dart';

import 'pokemon_atom.dart';
import 'pokemon_org.dart';

class PokemonDetailsTemplate extends StatelessWidget {
  final PokemonPageManagementTemplateController templateMngr = Get.put(PokemonPageManagementTemplateController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CoreThemeBackground(
      ListView(children:[
        Text("Pokemon Details here"),
        DisplayPokemonDetailsMol(),
      ]),
      header: CoreHeaderMol(
        header:"Pokemon Details",
        height:MediaQuery.of(context).size.height * 0.1,
        event: (){
          templateMngr.toPokemonListTemp();
        },
      ),
      headerHeight:MediaQuery.of(context).size.height * 0.1,
    );
  }
  
}



class PokemonListTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CoreThemeBackground(
      ListView(children:[
        Text("Pokemon List here"),
        PokemonListOrg()
      ]),
    );
  }
  
}



class PokemonTemplateMngr extends StatelessWidget{
  final PokemonPageManagementTemplateController controller = Get.put(PokemonPageManagementTemplateController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<PokemonPageManagementTemplateController>(builder:(_){
      switch(_.pageTemplate){
        case 1:
          return PokemonDetailsTemplate();
        default:
          return PokemonListTemplate();
      }
    });
  }
  
}


