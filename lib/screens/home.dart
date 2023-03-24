import 'package:calori_tracker/components/category_card.dart';
import 'package:calori_tracker/providers/home_provider.dart';
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
    final dailyFoodProvider = Provider.of<DailyMyFoods>(context);
    final homeProvider = Provider.of<HomeProvider>(context);
    homeProvider.getProgressData();

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
                    RadialProgress(
                      grosorPrimario: 20,
                      grosorSecundario: 21,
                      tipoBordes: StrokeCap.round,
                      porcentaje: homeProvider.homeProcress.calories! /
                          homeProvider.dailyLimit,
                      colorPrimario: Colors.green,
                      colorSecundario: Colors.white,
                      height: 150,
                      width: 150,
                      text: "Calories",
                      textColor: Colors.white,
                      porcentajeText: (double.parse(homeProvider
                              .homeProcress.calories!
                              .toStringAsFixed(2)))
                          .toString(),
                    ),
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RadialProgress(
                              grosorPrimario: 8,
                              grosorSecundario: 11,
                              porcentaje: homeProvider.homeProcress.protein_g! /
                                  homeProvider.dailyLimit,
                              colorPrimario: Colors.red,
                              colorSecundario: Colors.white,
                              text: "Protein",
                              textColor: Colors.white,
                              porcentajeText: (double.parse(homeProvider
                                      .homeProcress.protein_g!
                                      .toStringAsFixed(2)))
                                  .toString(),
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            RadialProgress(
                              grosorPrimario: 12,
                              grosorSecundario: 8,
                              tipoBordes: StrokeCap.round,
                              porcentaje: homeProvider
                                      .homeProcress.carbohydrates_total_g! /
                                  homeProvider.dailyLimit,
                              colorPrimario: Colors.red,
                              colorSecundario: Colors.white,
                              text: "Carbs",
                              textColor: Colors.white,
                              porcentajeText: (double.parse(homeProvider
                                      .homeProcress.carbohydrates_total_g!
                                      .toStringAsFixed(2)))
                                  .toString(),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: RadialProgress(
                            grosorPrimario: 12,
                            grosorSecundario: 12,
                            tipoBordes: StrokeCap.round,
                            porcentaje: homeProvider.homeProcress.fat_total_g! /
                                homeProvider.dailyLimit,
                            colorPrimario: Colors.red,
                            colorSecundario: Colors.white,
                            text: "Fat",
                            textColor: Colors.white,
                            porcentajeText: (double.parse(homeProvider
                                    .homeProcress.fat_total_g!
                                    .toStringAsFixed(2)))
                                .toString(),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () {
                            homeProvider.getProgressData();
                            homeProvider.isGetProcress = false;
                          },
                        )
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
                      dailyFoodProvider.isActive = false;
                    },
                    onPressedEye: () {
                      dailyFoodProvider.isActive = false;
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
                    image: 'assets/images/breakfast.png',
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
                        dailyFoodProvider.isActive = false;
                      },
                      onPressedEye: () {
                        dailyFoodProvider.isActive = false;
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
                      image: 'assets/images/lunch.png'),
                  CategoryCard(
                    title: "Dinner",
                    icon: Icons.dinner_dining,
                    onPressedAdd: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen(
                                    title: 'Dinner',
                                    category: 3,
                                  )));
                      dailyFoodProvider.isActive = false;
                    },
                    onPressedEye: () {
                      dailyFoodProvider.isActive = false;
                      dailyFoodProvider.getDailyMyFoods(3);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              //title: Text('Breakfast List'),
                              content:
                                  SetupAlertDialoadContainer(title: "Dinner"),
                            );
                          });
                    },
                    image: 'assets/images/dinner.png',
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
                      dailyFoodProvider.isActive = false;
                    },
                    onPressedEye: () {
                      dailyFoodProvider.isActive = false;
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
                    image: 'assets/images/snacks.png',
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
