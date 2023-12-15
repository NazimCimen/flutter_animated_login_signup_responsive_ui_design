import 'package:flutter/material.dart';
import 'package:uidesign/constants/constants.dart';
class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofillHints: const [AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
      cursorColor: Color(0xff994D1C),
      style:myTextStyle
          .copyWith(color:myColorTxt5, fontSize: 20),
      textInputAction: TextInputAction.next,
      decoration:  const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff994D1C), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 2, color: Color(0xff994D1C))),
          focusColor: Colors.black,
          labelText: 'email',
          labelStyle: TextStyle(color: Color(0xff994D1C), fontSize: 18),
          prefixIcon: Icon(Icons.email_outlined, color: Color(0xff994D1C))),
    );
  }
}