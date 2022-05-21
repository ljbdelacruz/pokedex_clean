








import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pokedex_clean/core/theme/core_atom.dart';
import 'package:pokedex_clean/core/theme/core_theme.dart';
import 'package:pokedex_clean/core/theme/theme_di.dart';
import 'package:pokedex_clean/features/pokemon/presentation/atomic/pokemon_template.dart';
import 'package:pokedex_clean/features/pokemon/presentation/controller/pokemon_di.dart';
import 'package:pokedex_clean/pages/home/controller/home_controller.dart';



//organisms
class HomeFooterOrg extends StatelessWidget{

  final HomeFooterOrgController controller = Get.put(HomeFooterOrgController());
  final ThemeDependencies themeDI = Get.put(ThemeDependencies());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var padding = MediaQuery.of(context).size.width * 0.08;
    var fontSize = MediaQuery.of(context).size.height * 0.05;
    return Container(
      color: themeDI.getCoreThemeColor().primaryColor,
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      padding:EdgeInsets.only(left: padding, right: padding),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          IconButtonAtom(icon: Icons.home, size: fontSize, iconColor: themeDI.getCoreThemeColor().textColor, event: (){
            controller.toHomeEvent();
          }),
          IconButtonAtom(icon: Icons.list, size: fontSize, iconColor: themeDI.getCoreThemeColor().textColor, event:(){
            controller.toPokemonList();
          })
      ])
    );
  }
  
}


//template



class HomePageTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}



class HomePage extends StatefulWidget {
  final PokemonDIService service = Get.put(PokemonDIService());
  HomePage();
  @override
  HomePageState createState(){
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final HomePageController controller = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CoreThemeImageBackground(pages(),
    bgImage:"assets/pokedexbg.png",
    footer: HomeFooterOrg(),
    );
  }

  Widget pages(){
    return GetBuilder<HomePageController>(
      builder:(_){
        switch(_.pageTemplate){
          case 1:
            return PokemonTemplateMngr();
          default:
            return HomePageTemplate();
        }
      }
    );
  }
  
}