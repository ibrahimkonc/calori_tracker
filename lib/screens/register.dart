import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../providers/system_provider.dart';
import 'login.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final systemProvider = Provider.of<SystemProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.grey,
            Colors.white,
            Colors.grey,
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 15),
                  child: SizedBox(
                    child:
                        LottieBuilder.asset("assets/lottie/login_lottie.json"),
                    width: 200,
                    height: 200,
                  ),
                ),
                Container(
                  decoration: _boxDecoration(Colors.black),
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  padding: const EdgeInsets.all(10),
                  height: 450,
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Kayıt Ol",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 20),
                        _textfiled(systemProvider.usernameController, "Email",
                            TextInputType.emailAddress),
                        _textfiled(systemProvider.passwordController,
                            "Password", TextInputType.text),
                        _textfiled(systemProvider.firstLastNameController,
                            "First and Last Name", TextInputType.text),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: _textfiled(systemProvider.ageController,
                                    "Age", TextInputType.number)),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 1,
                                child: _textfiled(
                                    systemProvider.heightController,
                                    "Height",
                                    TextInputType.number)),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 1,
                                child: _textfiled(
                                    systemProvider.weightController,
                                    "Weight",
                                    TextInputType.number)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _button(() async {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          try {
                            UserCredential credential =
                                await auth.createUserWithEmailAndPassword(
                                    email:
                                        systemProvider.usernameController.text,
                                    password:
                                        systemProvider.passwordController.text);
                            //  print(credential);
                            systemProvider
                                .userRegisterPost(credential.user!.uid);
                            Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const LoginPage(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin = Offset(0.0, 1.0);
                                    const end = Offset.zero;
                                    final tween = Tween(begin: begin, end: end);
                                    final offsetAnimation =
                                        animation.drive(tween);

                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                ));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(
                                children: const [
                                  Icon(Icons.check, color: Colors.white),
                                  Text(' Kullanıcı kayıt edildi.'),
                                ],
                              ),
                            ));
                          } catch (e) {
                            print(e.toString());
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Row(
                                children: const [
                                  Icon(Icons.error, color: Colors.white),
                                  Text(" Hata !!!"),
                                ],
                              ),
                            ));
                          }
                        }, "Kayıt", Colors.black, Colors.white),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Hesabınız Varsa",
                                style: TextStyle(color: Colors.black)),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            const LoginPage(),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          const begin = Offset(0.0, 1.0);
                                          const end = Offset.zero;
                                          final tween =
                                              Tween(begin: begin, end: end);
                                          final offsetAnimation =
                                              animation.drive(tween);

                                          return SlideTransition(
                                            position: offsetAnimation,
                                            child: child,
                                          );
                                        },
                                      ));
                                },
                                child: const Text("Giriş Yap!")),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textfiled(
          TextEditingController controller, String label, TextInputType type) =>
      TextField(
        keyboardType: type,
        style: TextStyle(color: Colors.black),
        controller: controller,
        decoration: InputDecoration(
            labelText: label, labelStyle: TextStyle(color: Colors.black)),
      );

  Widget _button(
      Function() onPressed, String text, Color bgColor, Color fgColor) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
      ),
    );
  }

  BoxDecoration _boxDecoration(Color colors) {
    return BoxDecoration(
      border: Border.all(color: colors, width: 3),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: colors,
          spreadRadius: 0,
          blurRadius: 0,
          offset: const Offset(7, 7), // changes position of shadow
        ),
      ],
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)),
    );
  }
}
