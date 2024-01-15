import 'package:flutter/material.dart';
import 'package:uidesign/constants/constants.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: myColorBtn1,
            elevation: 8,
            shadowColor: myGrey,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        onPressed: onPressed,
        child: Text(
          text,
          style: myTextStyle,
        ));
  }
}
