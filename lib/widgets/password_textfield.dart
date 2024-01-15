import 'package:flutter/material.dart';
import 'package:uidesign/constants/constants.dart';

class PasswordTextField extends StatelessWidget {
  final bool isSecure;
  final VoidCallback changeLoading;
  const PasswordTextField(
      {super.key, required this.isSecure, required this.changeLoading});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofillHints: const [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: isSecure,
      cursorColor: myColorTxt5,
      style: myTextStyle.copyWith(color: myColorTxt5, fontSize: 20),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: myColorTxt5, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 2, color: myColorTxt5)),
        labelText: 'password',
        labelStyle: TextStyle(color: myColorTxt5, fontSize: 18),
        prefixIcon: Icon(Icons.lock_outlined, color: myColorTxt5),
        suffixIcon: IconButton(
            onPressed: changeLoading,
            icon: Icon(
                isSecure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: myColorTxt5)),
      ),
    );
  }
}
