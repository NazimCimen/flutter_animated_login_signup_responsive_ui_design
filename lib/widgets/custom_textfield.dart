import 'package:flutter/material.dart';
import 'package:uidesign/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType type;
  final String hint;
  final IconData icon;
  const CustomTextField(
      {super.key, required this.type, required this.hint, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofillHints: const [AutofillHints.email],
      keyboardType: type,
      cursorColor: myColorTxt5,
      style: myTextStyle.copyWith(color: myColorTxt5, fontSize: 20),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: myColorTxt5, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 2, color: myColorTxt5)),
          focusColor: Colors.black,
          labelText: hint,
          labelStyle: TextStyle(color: myColorTxt5, fontSize: 18),
          prefixIcon: Icon(icon, color: myColorTxt5)),
    );
  }
}
