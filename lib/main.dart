import 'package:calori_tracker/providers/daily_my_foods.dart';
import 'package:calori_tracker/providers/system_provider.dart';
import 'package:calori_tracker/providers/theme_provider.dart';
import 'package:calori_tracker/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/bottom_navbar.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //await prefs.remove('uid');
  String data = prefs.getString('uid') ?? "";
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(
    providers: [
      ListenableProvider(create: (_) => SystemProvider()),
      ListenableProvider(create: (_) => ThemeChanger(4)),
      ChangeNotifierProvider(create: (_) => DailyMyFoods()),
    ],
    child: MyApp(data: data),
  ));

  WidgetsFlutterBinding.ensureInitialized();
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
                pageIndex: systemProvider.pageIndex,
              ),
            ),
    );
  }
}
