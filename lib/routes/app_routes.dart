import 'package:flutter/widgets.dart';
import 'package:mvp/screens/splash_screen.dart';
import 'package:mvp/screens/home_fridge_screen.dart';
import 'package:mvp/screens/home_recipe_screen.dart';
import 'package:mvp/screens/home_order_screen.dart';
import 'package:mvp/screens/my_fridge_screen.dart';
import 'package:mvp/screens/my_fridge_stock_screen.dart';
import 'package:mvp/screens/consumer_report_screen.dart';
import 'package:mvp/screens/lifehacks_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String fridgeScreen = '/home_fridge_screen';
  static const String recipeScreen = '/home_recipe_screen';
  static const String orderScreen = '/home_order_screen';
  static const String myFridgeScreen = '/my_fridge_screen';
  static const String myFridgeStockScreen = '/my_fridge_stock_screen';
  static const String consumerReportScreen = '/consumer_report_screen';
  static const String lifehacksScreen = '/lifehacks_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    fridgeScreen: (context) => HomeFridgeScreen(),
    recipeScreen: (context) => const HomeRecipeScreen(),
    orderScreen: (context) => HomeOrderScreen(),
    myFridgeScreen: (context) => MyFridgeScreen(),
    myFridgeStockScreen: (context) => MyFridgeStockScreen(),
    consumerReportScreen: (context) => ConsumerReportScreen(),
    lifehacksScreen: (context) => LifeHacksScreen(),
  };
}
