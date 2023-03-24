import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SliverProfilePage extends StatelessWidget {
  const SliverProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
    const _ListItem('Age', Colors.white),
    const _ListItem('Height', Colors.white),
    const _ListItem('Weight', Colors.white),
    const _ListItem('Calories', Colors.white),
    const _ListItem('Protein', Colors.white),
    const _ListItem('Carbs', Colors.white),
    const _ListItem('Fat', Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: Text('Hola Mundo'),
        // ),
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
                    ? Colors.grey
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
                height: 8,
                width: 150,
                color: (appTheme.darkTheme)
                    ? Color.fromARGB(255, 240, 240, 240)
                    : const Color(0xfff7cdd5),
              ),
            ),
            const Text(
              'Profile',
              style: TextStyle(
                  color: Colors.pink,
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
class _ListaTareas extends StatelessWidget {
  final items = [
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      height: 100,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color,
          // color: (appTheme.darkTheme) ? Colors.grey : color,
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        titulo,
        style: TextStyle(
            color: (appTheme.darkTheme) ? Colors.black87 : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      // child: ,
    );
  }
}

// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   bool userGender = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: userGender == true
//           ? AppBar(
//               centerTitle: true,
//               title: Text("Profile Page"),
//               backgroundColor: Colors.blue,
//             )
//           : AppBar(
//               centerTitle: true,
//               title: Text("Profile Page"),
//               backgroundColor: Colors.pink,
//             ),
//       body: Column(
//         children: [
//           IconButton(
//               onPressed: () {
//                 setState(() {
//                   userGender = !userGender;
//                 });
//               },
//               icon: Icon(Icons.change_circle_outlined)),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 userGender == true
//                     ? Image.asset(
//                         "assets/images/men.png",
//                         width: 250,
//                         height: 250,
//                         fit: BoxFit.fill,
//                       )
//                     : Image.asset(
//                         "assets/images/women.png",
//                         width: 250,
//                         height: 250,
//                         fit: BoxFit.fill,
//                       ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }