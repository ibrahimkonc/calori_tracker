import 'package:calori_tracker/providers/daily_my_foods.dart';
import 'package:calori_tracker/providers/news_provider.dart';
import 'package:calori_tracker/providers/home_provider.dart';
import 'package:calori_tracker/providers/system_provider.dart';
import 'package:calori_tracker/providers/theme_provider.dart';
import 'package:calori_tracker/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/bottom_navbar.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  //await prefs.remove('uid');
  String data = prefs.getString('uid') ?? "";
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(
    providers: [
      ListenableProvider(create: (_) => HomeProvider()),
      ListenableProvider(create: (_) => SystemProvider()),
      ListenableProvider(create: (_) => ThemeChanger(4)),
      ChangeNotifierProvider(create: (_) => DailyMyFoods()),
      ChangeNotifierProvider(create: (_) => NewsProvider()),
    ],
    child: MyApp(data: data),
  ));
}

Future initialization(BuildContext? context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? uid = prefs.getString('uid');
  await Future.delayed(const Duration(seconds: 1));
  if (uid != null) {
    await prefs.setString('uid', uid);
  }
}

class MyApp extends StatelessWidget {
  final String? data;
  const MyApp({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final systemProvider = Provider.of<SystemProvider>(context);
    if (data == "") {
      systemProvider.pageIndex = 0;
    } else {
      systemProvider.pageIndex = 2;
    }
    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: systemProvider.pageIndex == 0
          ? const LoginPage()
          : Scaffold(
              body: systemProvider.pages[systemProvider.pageIndex - 1],
              bottomNavigationBar: BottomNavbar(
                onTap: (int value) {
                  systemProvider.route(value);
                },
                pageIndex: systemProvider.pageIndex - 1,
              ),
            ),
    );
  }
}
