
import 'package:caldal/data/provider/categories_provider.dart';
import 'package:caldal/data/provider/flash_sales_provider.dart';
import 'package:caldal/data/provider/fresh_vegetables_provider.dart';
import 'package:caldal/data/provider/popular_provider.dart';
import 'package:caldal/data/provider/story_provider.dart';
import 'package:caldal/view/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'data/provider/allmeds_provider.dart';
import 'data/provider/pharmacy_categories_provider.dart';
import 'data/provider/self_sugar_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<StoryProvider>(create: (change) => StoryProvider()),
      ChangeNotifierProvider<CategoriesProvider>(create: (change) => CategoriesProvider()),
      ChangeNotifierProvider<AllMedsProvider>(create: (change) => AllMedsProvider()),
      ChangeNotifierProvider<PharmacyCategoriesProvider>(create: (change) => PharmacyCategoriesProvider()),
      ChangeNotifierProvider<PopularProvider>(create: (change) => PopularProvider()),
      ChangeNotifierProvider<FlashSalesProvider>(create: (change) => FlashSalesProvider()),
      ChangeNotifierProvider<FreshVegetablesProvider>(create: (change) => FreshVegetablesProvider()),
      ChangeNotifierProvider<SeltSugarProvider>(create: (change) => SeltSugarProvider()),
    ],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

