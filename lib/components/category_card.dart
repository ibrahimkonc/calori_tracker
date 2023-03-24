import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onPressedAdd;
  final Function() onPressedEye;
  final String image;
  const CategoryCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressedAdd,
      required this.onPressedEye,
      required this.image});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Stack(
      children: [
        Card(
          color: Colors.white,
          margin: const EdgeInsets.only(top: 10),
          child: Container(
            decoration: _boxDecoration(image),
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Stack(
              children: [
                Center(
                  child: OutlinedButton(
                    onPressed: onPressedAdd,
                    // ignore: sort_child_properties_last
                    child: const Icon(
                      Icons.add,
                      color: Color.fromARGB(160, 0, 0, 0),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.green.shade200),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    icon,
                    color: Color.fromARGB(160, 0, 0, 0),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: onPressedEye,
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Color.fromARGB(160, 0, 0, 0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              color: appTheme.colorScheme.secondary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.transparent,
                  spreadRadius: 10,
                  blurRadius: 0.5,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration _boxDecoration(String url) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(url),
        colorFilter: ColorFilter.mode(
            Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
            BlendMode.dstATop),
        fit: BoxFit.cover,
      ),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 10,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    );
  }
}
