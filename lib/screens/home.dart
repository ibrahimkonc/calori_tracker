import 'package:calori_tracker/components/category_card.dart';
import 'package:calori_tracker/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calori_tracker/components/radial_progress.dart';
import '../components/drawer.dart';
import '../components/history_alertdialog.dart';
import '../providers/daily_my_foods.dart';
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
            child: Center(
              child: GridView(
                // physics: const NeverScrollableScrollPhysics(),
                // shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                // ignore: sort_child_properties_last
                children: [
                  CategoryCard(
                    title: "Breakfast",
                    icon: Icons.coffee_outlined,
                    onPressedAdd: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen(
                                    title: 'Breakfast',
                                    category: 1,
                                  )));
                    },
                    onPressedEye: () {
                      final dailyFoodProvider =
                          Provider.of<DailyMyFoods>(context, listen: false);
                      dailyFoodProvider.getDailyMyFoods(1);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              //title: Text('Breakfast List'),
                              content: SetupAlertDialoadContainer(
                                  title: "Breakfast List"),
                            );
                          });
                    },
                  ),
                  CategoryCard(
                    title: "Lunch",
                    icon: Icons.local_restaurant_outlined,
                    onPressedAdd: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen(
                                    title: 'Lunch',
                                    category: 2,
                                  )));
                    },
                    onPressedEye: () {
                      final dailyFoodProvider =
                          Provider.of<DailyMyFoods>(context, listen: false);
                      dailyFoodProvider.getDailyMyFoods(2);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              //title: Text('Breakfast List'),
                              content:
                                  SetupAlertDialoadContainer(title: "Lunch"),
                            );
                          });
                    },
                  ),
                  CategoryCard(
                    title: "Diner",
                    icon: Icons.dinner_dining,
                    onPressedAdd: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen(
                                    title: 'Diner',
                                    category: 3,
                                  )));
                    },
                    onPressedEye: () {
                      final dailyFoodProvider =
                          Provider.of<DailyMyFoods>(context, listen: false);
                      dailyFoodProvider.getDailyMyFoods(3);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              //title: Text('Breakfast List'),
                              content:
                                  SetupAlertDialoadContainer(title: "Diner"),
                            );
                          });
                    },
                  ),
                  CategoryCard(
                    title: "Snacks",
                    icon: Icons.fastfood_outlined,
                    onPressedAdd: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen(
                                    title: 'Snacks',
                                    category: 4,
                                  )));
                    },
                    onPressedEye: () {
                      final dailyFoodProvider =
                          Provider.of<DailyMyFoods>(context, listen: false);
                      dailyFoodProvider.getDailyMyFoods(4);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              //title: Text('Breakfast List'),
                              content:
                                  SetupAlertDialoadContainer(title: "Snacks"),
                            );
                          });
                    },
                  )
                ],
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 20,
                  mainAxisExtent: MediaQuery.of(context).size.height * 0.16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
