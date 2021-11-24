








import 'package:flutter/widgets.dart';
import 'package:pokedex_clean/core/theme/core_theme.dart';

class HomePage extends StatefulWidget {
  HomePage();
  @override
  HomePageState createState(){
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CoreThemeImageBackground(Container(
      
    ),
    bgImage:"assets/pokedexbg.png",

    );
  }
  
}