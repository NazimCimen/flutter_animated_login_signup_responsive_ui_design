import 'package:flutter/material.dart';
import 'package:uidesign/constants/constants.dart';

class MyButtons extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const MyButtons({super.key, required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: myColorBtn1,
            elevation: 8,
            shadowColor: Colors.grey,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        onPressed: onPressed,
        child: Text(
          text,
          style: myTextStyle,
        ));
  }
}
