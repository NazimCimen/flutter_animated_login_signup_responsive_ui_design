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
      cursorColor: Color(0xff994D1C),
      style: myTextStyle.copyWith(color: myColorTxt5, fontSize: 20),
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff994D1C), width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 2, color: Color(0xff994D1C))),
        labelText: 'password',
        labelStyle: const TextStyle(color: Color(0xff994D1C), fontSize: 18),
        prefixIcon: const Icon(Icons.lock_outlined, color: Color(0xff994D1C)),
        suffixIcon: IconButton(
            onPressed: changeLoading,
            icon: Icon(
                isSecure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: Color(0xff994D1C))),
      ),
    );
  }
}
