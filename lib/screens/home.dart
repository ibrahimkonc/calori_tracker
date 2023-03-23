import 'package:calori_tracker/components/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calori_tracker/components/radial_progress.dart';
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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 20, top: 20),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const RadialProgress(
                      grosorPrimario: 20,
                      grosorSecundario: 21,
                      tipoBordes: StrokeCap.round,
                      porcentaje: 80,
                      colorPrimario: Colors.green,
                      colorSecundario: Colors.white,
                      height: 150,
                      width: 150,
                      text: "Calories",
                      textColor: Colors.white,
                    ),
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            RadialProgress(
                              grosorPrimario: 8,
                              grosorSecundario: 11,
                              porcentaje: 60,
                              colorPrimario: Colors.red,
                              colorSecundario: Colors.white,
                              text: "Protein",
                              textColor: Colors.white,
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            RadialProgress(
                              grosorPrimario: 12,
                              grosorSecundario: 8,
                              tipoBordes: StrokeCap.round,
                              porcentaje: 60,
                              colorPrimario: Colors.red,
                              colorSecundario: Colors.white,
                              text: "Carbs",
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: const RadialProgress(
                            grosorPrimario: 12,
                            grosorSecundario: 12,
                            tipoBordes: StrokeCap.round,
                            porcentaje: 60,
                            colorPrimario: Colors.red,
                            colorSecundario: Colors.white,
                            text: "Fat",
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  // ignore: sort_child_properties_last
                  children: [
                    CategoryCard(
                      title: "Brakfast",
                      icon: Icons.coffee_outlined,
                      onPressedAdd: () {},
                      onPressedEye: () {},
                    ),
                    CategoryCard(
                      title: "Lunch",
                      icon: Icons.local_restaurant_outlined,
                      onPressedAdd: () {},
                      onPressedEye: () {},
                    ),
                    CategoryCard(
                      title: "Diner",
                      icon: Icons.dinner_dining,
                      onPressedAdd: () {},
                      onPressedEye: () {},
                    ),
                    CategoryCard(
                      title: "Snacks",
                      icon: Icons.fastfood_outlined,
                      onPressedAdd: () {},
                      onPressedEye: () {},
                    )
                  ],
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 150,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
