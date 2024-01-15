import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uidesign/constants/constants.dart';
import 'package:uidesign/widgets/button.dart';
import 'package:uidesign/widgets/gradient_background.dart';
import 'package:uidesign/widgets/custom_textfield.dart';
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
                      child: buildText(),
                    ),
                  )),
              const Spacer(flex: 2),
              Expanded(
                  flex: 10,
                  child: FractionallySizedBox(
                    heightFactor: 0.8,
                    widthFactor: 0.8,
                    child: FadeInLeft(
                        child: const CustomTextField(
                      type: TextInputType.name,
                      hint: 'Name Surname',
                      icon: Icons.person_outlined,
                    )),
                  )),
              const Spacer(flex: 2),
              Expanded(
                  flex: 10,
                  child: FractionallySizedBox(
                      heightFactor: 0.8,
                      widthFactor: 0.8,
                      child: FadeInRight(
                          child: const CustomTextField(
                        type: TextInputType.emailAddress,
                        hint: 'email',
                        icon: Icons.email_outlined,
                      )))),
              const Spacer(flex: 3),
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
              const Spacer(flex: 2),
              Expanded(
                  flex: 5,
                  child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FadeInRight(
                        child: buildRowForPrivacyPolicy(),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 15,
                  child: FractionallySizedBox(
                    heightFactor: 0.5,
                    widthFactor: 0.8,
                    child: FadeInLeft(
                      child: MyButton(
                          text: 'Sign Up',
                          onPressed: () async {
                            _animateAfterLogin();
                            await Future.delayed(const Duration(seconds: 3));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          }),
                    ),
                  )),
              const Spacer(flex: 2),
              Expanded(flex: 4, child: buildVisibilityWidgerForAnimation()),
              const Spacer(flex: 18)
            ],
          ),
        ],
      ),
    );
  }

  Visibility buildVisibilityWidgerForAnimation() {
    return Visibility(
        visible: _afterLoginAnimate,
        child: _afterLoginAnimate == true
            ? SpinKitThreeBounce(
                color: myColorTxt5,
                size: 24,
              )
            : const SizedBox.shrink());
  }

  Row buildRowForPrivacyPolicy() {
    return Row(
      children: [
        Checkbox(
          activeColor: myColorTxt5,
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
    );
  }

  Text buildText() {
    return Text(
      'Please sign up first\n to discover events',
      style: myTextStyle,
    );
  }
}
