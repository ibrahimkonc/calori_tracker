import 'package:calori_tracker/components/radial_progress.dart';
import 'package:calori_tracker/components/widget/radial_progress_widget.dart';
import 'package:calori_tracker/providers/system_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/bottom_navbar.dart';
import '../components/drawer.dart';
import '../providers/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final systemProvider = Provider.of<SystemProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appTheme.colorScheme.secondary,
        title: const Text('Calori Tracker'),
      ),
      //drawer: const MenuPrincipal(),
      body: systemProvider.pages[systemProvider.pageIndex],
      bottomNavigationBar: BottomNavbar(
        onTap: (int value) {
          systemProvider.route(value);
        },
        pageIndex: systemProvider.pageIndex,
      ),
    );
  }
}
