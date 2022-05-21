import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../data/model/pokemon_model.dart';
import '../controller/pokemon_controller.dart';
import 'pokemon_atom.dart';
class PokemonCellsMol extends StatelessWidget{
  final PokemonCellsMolController controller = Get.put(PokemonCellsMolController());
  final PokemonDetailsModel pokemon;
  final DisplayPokemonDetailsMolController detailsC= Get.put(DisplayPokemonDetailsMolController());
  PokemonCellsMol(this.pokemon);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var paddingVert = MediaQuery.of(context).size.height * 0.02;
    return InkWell(onTap:(){
      detailsC.fetchPokemonDetails(pokemon.name);
      controller.selectedPokemonEvent(pokemon);
    }, child: Container(
      width:MediaQuery.of(context).size.width,
      padding:EdgeInsets.only(top:paddingVert, bottom: paddingVert),
      child: Row(children:[
        Text(pokemon.name, style: TextStyle(fontSize: 12, color: Colors.black))
      ])
    ));
  }
}


class DisplayPokemonDetailsMol extends StatelessWidget{
  final DisplayPokemonDetailsMolController controller = Get.put(DisplayPokemonDetailsMolController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var imageSize=MediaQuery.of(context).size.width * 0.05;
    return GetBuilder<DisplayPokemonDetailsMolController>(builder:(_){
      if(_.details != null){
        return 
        Column(children:[
          Row(children:[
            // Image.network(_.details.image, width: imageSize, height: imageSize),
            DisplaySelectedPokemonTextAtom(TextStyle(fontSize: 30, color: Colors.black))
          ]),
          DisplayPokemonTypeMol()
        ]);
      }else{
        return Container(child: Text("No Details Available"));
      }
    });
  }
}

class DisplayPokemonTypeMol extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<DisplayPokemonDetailsMolController>(builder:(_){
      List<Widget> contents = [];
      _.details.type.forEach((element) { 
        contents.add(PokemonTypeCellAtom(element));
      });
      return Row(children:contents);
    });
  }
  
}