import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class BottomNavbar extends StatelessWidget {
  final int pageIndex;
  final Function(int value) onTap;
  const BottomNavbar({super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CustomPaint(
          size: Size(size.width, 80),
          painter: BNBCustomePainter(),
        ),
        Center(
          heightFactor: 0.6,
          child: FloatingActionButton(
            onPressed: () => onTap(2),
            backgroundColor: appTheme.themeColor,
            child: Icon(Icons.home),
            elevation: 0.1,
          ),
        ),
        SizedBox(
          width: size.width,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () => onTap(1),
                  icon: Icon(Icons.add),
                  color: Colors.black87),
              Container(
                width: size.width * .20,
              ),
              IconButton(
                  onPressed: () => onTap(3),
                  icon: Icon(Icons.person),
                  color: Colors.black87),
            ],
          ),
        )
      ],
    );
  }
}

class BNBCustomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * .20, 0, size.width * .35, 0);
    path.quadraticBezierTo(size.width * .40, 0, size.width * .40, 20);
    path.arcToPoint(Offset(size.width * .60, 20),
        radius: Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(size.width * .60, 0, size.width * .65, 0);
    path.quadraticBezierTo(size.width * .80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black, 5, true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
