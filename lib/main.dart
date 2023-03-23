import 'package:calori_tracker/providers/system_provider.dart';
import 'package:calori_tracker/screens/home.dart';
import 'package:calori_tracker/providers/theme_provider.dart';
import 'package:calori_tracker/screens/login.dart';
import 'package:calori_tracker/screens/test_home.dart';
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
      //  theme: currentTheme,
      // debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}
