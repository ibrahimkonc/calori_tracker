import 'package:calori_tracker/providers/system_provider.dart';
import 'package:calori_tracker/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/theme_provider.dart';

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;
    final systemProvider = Provider.of<SystemProvider>(context);

    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: accentColor,
                child: const Text(
                  'CA',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          // Expanded(child: _ListaOpciones()),
          ListTile(
            leading: Icon(
              Icons.lightbulb_outline,
              color: accentColor,
            ),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: accentColor,
                onChanged: (value) => appTheme.darkTheme = value),
          ),
          SafeArea(
            top: false,
            left: false,
            right: false,
            bottom: true,
            child: ListTile(
              leading: Icon(
                Icons.add_to_home_screen,
                color: accentColor,
              ),
              title: const Text('Custom theme'),
              trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: accentColor,
                  onChanged: (value) => appTheme.customTheme = value),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: accentColor,
            ),
            trailing: Container(
              margin: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.arrow_right,
                color: accentColor,
              ),
            ),
            title: TextButton(
              onPressed: () {
                systemProvider.sessionExed();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              child: Row(
                children: const [
                  Text(
                    "Çıkış Yap",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
