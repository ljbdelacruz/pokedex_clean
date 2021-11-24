


import 'package:get/get.dart';
import 'package:pokedex_clean/pages/home/atomic/home_atomic.dart';

const String introPageRoute="/";
const String homePageRoute="/home";


List<GetPage> getPages = [
  GetPage(name: introPageRoute, page: () => HomePage()),
  GetPage(name: homePageRoute, page: () => HomePage()),
];
