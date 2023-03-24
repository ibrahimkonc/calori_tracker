import 'package:calori_tracker/providers/daily_my_foods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SetupAlertDialoadContainer extends StatefulWidget {
  final String title;
  const SetupAlertDialoadContainer({super.key, required this.title});

  @override
  State<SetupAlertDialoadContainer> createState() =>
      _SetupAlertDialoadContainerState();
}

class _SetupAlertDialoadContainerState
    extends State<SetupAlertDialoadContainer> {
  @override
  Widget build(BuildContext context) {
    DailyMyFoods dailyMyFoods = Provider.of<DailyMyFoods>(context);
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return dailyMyFoods.dailyMyFoods.isNotEmpty
        ? SizedBox(
            height: 300.0, // Change as per your requirement
            width: 300.0, // Change as per your requirement
            child: ListView.builder(
              itemCount: dailyMyFoods.dailyMyFoods.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: appTheme.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('${dailyMyFoods.dailyMyFoods[index]!.name}'),
                              Text(
                                  "${dailyMyFoods.dailyMyFoods[index]!.calories} kcal"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ))
        : const SizedBox(
            height: 300.0, // Change as per your requirement
            width: 300.0,
            child: Center(
              child: Text(
                "There are no foods in the list",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          );
  }
}
