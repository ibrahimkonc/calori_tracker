import 'package:calori_tracker/components/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/drawer.dart';
import '../providers/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appTheme.colorScheme.secondary,
          title: const Text('Calori Tracker'),
        ),
        drawer: const MenuPrincipal(),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 20),
                color: Colors.grey,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const RadialProgress(
                          porcentaje: 80,
                          colorPrimario: Colors.green,
                          colorSecundario: Colors.white,
                          height: 150,
                          width: 150,
                          text: "Calories",
                          textColor: Colors.white,
                        ),
                        Row(
                          children: const [
                            RadialProgress(
                              porcentaje: 10,
                              colorPrimario: Colors.red,
                              colorSecundario: Colors.white,
                              text: "Protein",
                              textColor: Colors.white,
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            RadialProgress(
                              porcentaje: 60,
                              colorPrimario: Colors.red,
                              colorSecundario: Colors.white,
                              text: "Carbs",
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                        const RadialProgress(
                          porcentaje: 60,
                          colorPrimario: Colors.red,
                          colorSecundario: Colors.white,
                          text: "Fat",
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ));
  }
}
