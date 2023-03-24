import 'package:flutter/material.dart';

class SetupAlertDialoadContainer extends StatefulWidget {
  const SetupAlertDialoadContainer({super.key});

  @override
  State<SetupAlertDialoadContainer> createState() =>
      _SetupAlertDialoadContainerState();
}

class _SetupAlertDialoadContainerState
    extends State<SetupAlertDialoadContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300.0, // Change as per your requirement
        width: 300.0, // Change as per your requirement
        child: Text("ekleme"));
    ;
  }
}
