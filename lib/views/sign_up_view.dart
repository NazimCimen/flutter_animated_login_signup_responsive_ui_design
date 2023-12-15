import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uidesign/constants/constants.dart';
import 'package:uidesign/widgets/button.dart';
import 'package:uidesign/widgets/gradient_background.dart';
import 'package:uidesign/widgets/mail_textfield.dart';
import 'package:uidesign/widgets/password_textfield.dart';
import 'package:uidesign/views/home.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool _checkBoxStatus = false;
  bool _afterLoginAnimate = false;
  bool _isSecure = true;
  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  void _animateAfterLogin() {
    setState(() {
      _afterLoginAnimate = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const GradientBackgroundContainer(),
          Column(
            children: [
              const Spacer(flex: 8),
              Expanded(
                  flex: 9,
                  child: FittedBox(
                    child: FadeInRight(
                      child: Text(
                        'Please sign up first\n to discover events',
                         style: myTextStyle,
                      ),
                    ),
                  )),
              const Spacer(flex: 2),
              Expanded(
                  flex: 10,
                  child: FractionallySizedBox(
                    heightFactor: 0.8,
                    widthFactor: 0.8,
                    child: FadeInLeft(
                      child: TextField(
                        autofillHints: [AutofillHints.name],
                        keyboardType: TextInputType.name,
                        cursorColor: myColorTxt5,
                            style: myTextStyle.copyWith(
                            color: myColorTxt5, fontSize: 20),
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff994D1C), width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xff994D1C))),
                            focusColor: Colors.black,
                            labelText: 'Name Surname',
                            labelStyle: TextStyle(
                                color: Color(0xff994D1C), fontSize: 18),
                            prefixIcon: Icon(Icons.person_outlined,
                                color: Color(0xff994D1C))),
                      ),
                    ),
                  )),
              Spacer(flex: 2),
              Expanded(
                  flex: 10,
                  child: FractionallySizedBox(
                      heightFactor: 0.8,
                      widthFactor: 0.8,
                      child: FadeInRight(child: EmailTextField()))),
              Spacer(
                flex: 3,
              ),
              Expanded(
                  flex: 10,
                  child: FractionallySizedBox(
                      heightFactor: 0.8,
                      widthFactor: 0.8,
                      child: FadeInLeft(
                        child: PasswordTextField(
                          changeLoading: _changeLoading,
                          isSecure: _isSecure,
                        ),
                      ))),
              Spacer(
                flex: 2,
              ),
              Expanded(
                  flex: 5,
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FadeInRight(
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: Color(0xff994D1C),
                              value: _checkBoxStatus,
                              onChanged: (bool? value) {
                                setState(() {
                                  _checkBoxStatus = value ?? false;
                                });
                              },
                            ),
                            InkWell(
                              onTap: () {
                                ///sözleşme ve gizlilik onayları için sayfaya yönlendirilecek
                              },
                              child: Text(
                                'By signing up, I agree to Terms of Use & Privacy Policy',
                                 style: myTextStyle.copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: myColorTxt5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 15,
                  child: FractionallySizedBox(
                    heightFactor: 0.5,
                    widthFactor: 0.8,
                    child: FadeInLeft(
                      child: MyButtons(
                          text: 'SignUp',
                          onPressed: () async {
                            _animateAfterLogin();
                            await Future.delayed(Duration(seconds: 3));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          }),
                    ),
                  )),
              const Spacer(flex: 2),
              Expanded(
                  flex: 4,
                  child: Center(
                    child: FittedBox(
                      child: SizedBox(
                        width: 755,
                        height: 755,
                        child: FittedBox(
                          child: Visibility(
                              visible: _afterLoginAnimate,
                              child: _afterLoginAnimate == true
                                  ? SpinKitThreeBounce(
                                      color: Color(0xff994D1C),
                                      size: 24,
                                    )
                                  : SizedBox(
                                      width: 2,
                                      height: 2,
                                    )),
                        ),
                      ),
                    ),
                  )),
              const Spacer(flex: 18)
            ],
          ),
        ],
      ),
    );
  }
}
