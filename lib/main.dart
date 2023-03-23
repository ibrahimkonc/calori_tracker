import 'package:calori_tracker/providers/daily_my_foods.dart';
import 'package:calori_tracker/providers/search_provider.dart';
import 'package:calori_tracker/providers/system_provider.dart';
import 'package:calori_tracker/providers/theme_provider.dart';
import 'package:calori_tracker/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(
    providers: [
      ListenableProvider(create: (_) => SystemProvider()),
      ListenableProvider(create: (_) => ThemeChanger(4)),
      ChangeNotifierProvider(create: (_) => SearchProvider()),
      ChangeNotifierProvider(create: (_) => DailyMyFoods()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const LoginPage(),
    );
  }
}
