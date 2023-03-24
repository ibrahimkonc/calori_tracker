import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SliverProfilePage extends StatelessWidget {
  const SliverProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          _MainScroll(),
        ],
      ),
    ));
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    const _ListItem('Age', Colors.white, Icons.numbers),
    const _ListItem('Height', Colors.white, Icons.height),
    const _ListItem('Weight', Colors.white, Icons.line_weight),
    const _ListItem('Calories', Colors.white, Icons.local_restaurant_outlined),
    const _ListItem('Protein', Colors.white, Icons.local_restaurant_outlined),
    const _ListItem('Carbs', Colors.white, Icons.local_restaurant_outlined),
    const _ListItem('Fat', Colors.white, Icons.local_restaurant_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          floating: true,
          elevation: 0,
          backgroundColor: Colors.pink,
          title: Text('Calorie Tricker'),
        ),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            maxHeight: 170,
            minHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.scaffoldBackgroundColor,
              child: _Titulo(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(
              height: 100,
            )
          ]),
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => (minHeight > maxHeight) ? minHeight : maxHeight;
  // double get maxExtent => maxHeight;

  @override
  double get minExtent => (minHeight < maxHeight) ? minHeight : maxHeight;
  // double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'User X ',
            style: TextStyle(
                color: (appTheme.darkTheme)
                    ? Colors.white
                    : const Color(0xff532128),
                fontSize: 50),
          ),
        ),
        Stack(
          children: [
            const SizedBox(
              width: 100,
            ),
            Positioned(
              bottom: 8,
              child: Container(
                height: 7,
                width: 170,
                color: (appTheme.darkTheme)
                    ? Colors.white
                    : Color.fromARGB(255, 10, 10, 144),
              ),
            ),
            Text(
              'Profile',
              style: TextStyle(
                  color: appTheme.themeColor,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}

// ignore: unused_element

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;
  final IconData icon;

  const _ListItem(this.titulo, this.color, this.icon);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      height: 100,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: appTheme.themeColor, width: 4),
          color: color,
          // color: (appTheme.darkTheme) ? Colors.grey : color,
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            titulo,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
