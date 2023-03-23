import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/daily_my_foods.dart';
import '../providers/search_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    final dailyFoodProvider = Provider.of<DailyMyFoods>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey,
          title: const Text("Breakfast"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.left,
                  onSubmitted: (value) {
                    searchProvider.getSearch(value);
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    hintText: "apple and banana and orange",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.green,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.green)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: dailyFoodProvider.dailyMyFoods.isNotEmpty
                      ? dailyFoodProvider.dailyMyFoods.length < 5
                          ? dailyFoodProvider.dailyMyFoods.length * 80
                          : 250
                      : 0,
                  child: dailyFoodProvider.dailyMyFoods.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: dailyFoodProvider.dailyMyFoods.length,
                            itemBuilder: (context, index) => Dismissible(
                              key: UniqueKey(),
                              onDismissed: (direction) {
                                dailyFoodProvider.removeFood(
                                    dailyFoodProvider.dailyMyFoods[index]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      dailyFoodProvider.dailyMyFoods[index].name
                                          .toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
            dailyFoodProvider.dailyMyFoods.isNotEmpty
                ? const Divider(
                    color: Colors.black,
                    thickness: 1,
                    endIndent: 3,
                    indent: 3,
                  )
                : Container(),
            Expanded(
              child: ListView.builder(
                itemCount: searchProvider.searchList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Expanded(flex: 1, child: Icon(Icons.food_bank)),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FittedBox(
                                  child: Text(
                                    searchProvider.searchList[index].name
                                        .toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "Cal: ${searchProvider.searchList[index].calories}"),
                              ],
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                            endIndent: 3,
                            indent: 3,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "Prot: ${searchProvider.searchList[index].protein_g} "),
                              ],
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                            endIndent: 3,
                            indent: 3,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "Fat:  ${searchProvider.searchList[index].fat_total_g} "),
                              ],
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                            endIndent: 3,
                            indent: 3,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "Carb:  ${searchProvider.searchList[index].carbohydrates_total_g} "),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      dailyFoodProvider.addFood(
                                          searchProvider.searchList[index]);
                                    },
                                    icon: const Icon(Icons.add)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
