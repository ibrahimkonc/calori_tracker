import 'dart:async';
import 'package:calori_tracker/screens/home.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat();

  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(right: 55, bottom: 55, left: 55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Calori Tracker",
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(
              height: 70,
            ),
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (_, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * math.pi,
                    child: child,
                  );
                },
                child: Image.asset(
                  "assets/images/splashimage.png",
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Splash Screen Example")),
//       body: Center(
//           child: Text("Welcome to Home Page",
//               style: TextStyle(color: Colors.black, fontSize: 30))),
//     );
//   }
// }