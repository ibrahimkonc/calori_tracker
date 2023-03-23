// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool userGender = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: userGender == true
          ? AppBar(
              centerTitle: true,
              title: Text("Profile Page"),
              backgroundColor: Colors.blue,
            )
          : AppBar(
              centerTitle: true,
              title: Text("Profile Page"),
              backgroundColor: Colors.pink,
            ),
      body: Column(
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  userGender = !userGender;
                });
              },
              icon: Icon(Icons.change_circle_outlined)),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                userGender == true
                    ? Image.asset(
                        "assets/images/men.png",
                        width: 250,
                        height: 250,
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        "assets/images/women.png",
                        width: 250,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                Text(
                  "Age: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Height: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Weight: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
