import 'package:get/get.dart';
import 'core_style.dart';
import 'core_theme_color.dart';

class ThemeDependencies extends GetxController{
  CoreTextStyle _coreStyle;
  CoreTextStyle getCoreStyle(){
    return _coreStyle;
  }
  CoreThemeColor _coreThemeColor;
  CoreThemeColor getCoreThemeColor(){
    return _coreThemeColor;
  }

  ThemeDependencies(){
    this._coreStyle = new CoreTextStyle();
    this._coreThemeColor= new CoreThemeColor();
  }


}