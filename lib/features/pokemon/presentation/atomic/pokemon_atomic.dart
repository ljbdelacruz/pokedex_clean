import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_clean/core/theme/core_atom.dart';
import 'package:pokedex_clean/core/theme/core_molecules.dart';
import 'package:pokedex_clean/core/theme/theme_di.dart';
import 'package:pokedex_clean/features/pokemon/domain/entity/pokemon_entity.dart';
import 'package:pokedex_clean/features/pokemon/presentation/controller/pokemon_controller.dart';


//atom

class ListViewBuilderAtom extends StatelessWidget{
  final List<Widget> widgets;
  ListViewBuilderAtom({this.widgets});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: widgets.length,
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context,int i){
          return widgets[i];
        });
  }
}
//molecules


class PokemonListDetailsMol extends StatelessWidget{
  final String lbl;
  final ThemeDependencies themeDI = Get.put(ThemeDependencies());
  final Function event;
  PokemonListDetailsMol({this.lbl="", this.event});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var paddingVertical = MediaQuery.of(context).size.height * 0.05;
    var paddingHorizontal = MediaQuery.of(context).size.width * 0.05;
    return InkWell(onTap:(){
      if(event != null){
        event();
      }
    }, child: Container(
      color: themeDI.getCoreThemeColor().primaryColor,
      width:MediaQuery.of(context).size.width,
      padding:EdgeInsets.only(top:paddingVertical, bottom:paddingVertical, left: paddingHorizontal, right:paddingHorizontal),
      child: Text(lbl, style: themeDI.getCoreStyle().textBold(fontSz: 12, tColor: themeDI.getCoreThemeColor().textColor))
    ));
  }
}







//organisms


class PokemonHeaderOrg extends StatelessWidget{
  final ThemeDependencies themeDI = Get.put(ThemeDependencies());
  final Function event;
  PokemonHeaderOrg({this.event});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var iconSize = MediaQuery.of(context).size.height * 0.04;
    return Container(
      width:MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height * 0.1,
      child:Row(children:[
        IconButtonAtom(icon:Icons.arrow_back, size: iconSize, iconColor: themeDI.getCoreThemeColor().textColor, event:(){
          if(event != null){
            event();
          }
        })
      ])
    );
  }

  
}


class DisplayPokemonListOrg extends StatelessWidget {
  final DisplayPokemonListOrgController controller = Get.put(DisplayPokemonListOrgController());
  final DisplayPokemonInfoTemplateController pokemonInfoC = Get.put(DisplayPokemonInfoTemplateController());

  @override
  Widget build(BuildContext context) {
    return displayPokemonList(context);
  }

  Widget displayPokemonList(BuildContext context) {
    return GetBuilder<DisplayPokemonListOrgController>(
      builder:(_){
        List<Widget> items = [];
        if(_.isProcessing){
          return Center(child:ProgressIndicatorOrg(
            width:MediaQuery.of(context).size.width * 0.5,
            height:MediaQuery.of(context).size.width * 0.5,
          ));
        }else{
          if(_.pokemons != null){
            _.pokemons.pokemons.forEach((e){
              items.add(PokemonListDetailsMol(lbl:e.name.toUpperCase(), event:(){
                pokemonInfoC.selectedPokemon(e);
              }));
            });
            return ListViewBuilderAtom(widgets:items);
          }else{
            return Container(child: Text("No Pokemons Available"));
          }
        }
      }
    );
  }

}







//molecules

class PokemonTypeDisplayMol extends StatelessWidget{
  final String type;
  final Color color;
  PokemonTypeDisplayMol({this.type="", this.color = Colors.white});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var paddingHoriz = MediaQuery.of(context).size.height * 0.01;
    var paddingVert = MediaQuery.of(context).size.width * 0.01;
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      padding:EdgeInsets.only(left:paddingHoriz, right: paddingHoriz, top: paddingVert, bottom:paddingVert),
      child: Text(type)
    );
  }
}








//pokemon details org


class AboutPokemonDetailsOrg extends StatelessWidget{
  final DisplayPokemonInfoTemplateController controller = Get.put(DisplayPokemonInfoTemplateController());
  final ThemeDependencies themeDI = Get.put(ThemeDependencies());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var textFontSz = MediaQuery.of(context).size.height * 0.02;
    return GetBuilder<DisplayPokemonInfoTemplateController>(builder:(_){
      return Column(children:[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
          Text("Height", style: themeDI.getCoreStyle().textBold(fontSz: textFontSz, tColor: themeDI.getCoreThemeColor().textColor)),
          Text(_.pokemonDetail.height.toString(), style: themeDI.getCoreStyle().textBold(fontSz: textFontSz, tColor: themeDI.getCoreThemeColor().textColor))
        ])
      ]);
    });
  }
}




class DisplayPokemonDetailsOrg extends StatelessWidget{

  DisplayPokemonDetailsOrg();
  final DisplayPokemonDetailsOrgController controller = Get.put(DisplayPokemonDetailsOrgController());
  final ThemeDependencies themeDI = Get.put(ThemeDependencies());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var paddingVert = MediaQuery.of(context).size.height * 0.05;
    var paddingHoriz = MediaQuery.of(context).size.width * 0.1;
    return Container(
      decoration:BoxDecoration(
        color:themeDI.getCoreThemeColor().primaryColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
      ),
      width:MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      padding:EdgeInsets.only(left: paddingHoriz, right: paddingHoriz, top: paddingVert, bottom:paddingVert),
      child: Column(children:[

        subPages()
      ])
    );
  }

  Widget subPages(){
    return GetBuilder<DisplayPokemonDetailsOrgController>(builder:(_){
      switch(_.subPageTemplate){
        default:
          return AboutPokemonDetailsOrg();
      }
    });
  }

  
}





//templates


class DisplayPokemonInfoTemplate extends StatelessWidget{

  final ThemeDependencies themeDI = Get.put(ThemeDependencies());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children:[
      displayPokemonInfo(context),
      DisplayPokemonDetailsOrg(),
    ]);
  }

  Widget displayPokemonInfo(BuildContext context){
    return GetBuilder<DisplayPokemonInfoTemplateController>(
      builder:(_){
        var loaderSize = MediaQuery.of(context).size.width * 0.5;
        var titleFontSz = MediaQuery.of(context).size.height * 0.02;
        var padding = MediaQuery.of(context).size.width * 0.05;
        var imageSize = MediaQuery.of(context).size.width * 0.5;

        if(_.isProcessing){
          return Center(child:ProgressIndicatorOrg(
            width:loaderSize,
            height:loaderSize,
          ));
        }else{
          if(_.pokemonDetail != null){
            List<Widget> typesDisplay = [];
            _.pokemonDetail.type.forEach((element) { 
              print("TYPE");
              print(element.name);
              typesDisplay.add(PokemonTypeDisplayMol(type: element.name));
            });
            return Column(children:[
              PokemonHeaderOrg(event:(){
                _.backEvent();
              }),
              SizedBox(height:MediaQuery.of(context).size.height * 0.05),
              Container(
                width:MediaQuery.of(context).size.width,
                // height:MediaQuery.of(context).size.height * 0.1,
                padding:EdgeInsets.only(left: padding, right: padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[

                  Text(_.pokemonDetail.name, style: themeDI.getCoreStyle().textBold(fontSz: titleFontSz, tColor: themeDI.getCoreThemeColor().textColor)),
                  SizedBox(height:MediaQuery.of(context).size.height * 0.05),
                  Row(children: typesDisplay)
                ])
              ),
              CachedNetworkImage(imageUrl: _.pokemonDetail.image, width:imageSize, height:imageSize)
            ]);
          }else{
            return Container(child:Text("No Pokemon Data Available"));
          }
        }
      }
    );
  }
  
}

class DisplayPokemonListTemplate extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children:[
      Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height * 0.851,
        child:DisplayPokemonListOrg()
      )
    ]);
  }

}



class PokemonPageManagementTemplate extends StatelessWidget{
  final PokemonPageManagementTemplateController controller = Get.put(PokemonPageManagementTemplateController());
  


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<PokemonPageManagementTemplateController>(
      builder:(_){
        switch(_.pageTemplate){
          case 1:
            return DisplayPokemonInfoTemplate();
          default:
            return DisplayPokemonListTemplate();
        }
      }
    );
  }
}




//pages