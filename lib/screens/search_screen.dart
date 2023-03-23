import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    //searchProvider.getSearch("apple and banana and orange");
    return Scaffold(
        body: Column(
      children: [
        TextField(
          onSubmitted: (value) {
            searchProvider.getSearch(value);
          },
          decoration: const InputDecoration(
            hintText: "Search",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: searchProvider.searchList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(searchProvider.searchList[index].name.toString()),
              );
            },
          ),
        )
      ],
    ));
  }
}
