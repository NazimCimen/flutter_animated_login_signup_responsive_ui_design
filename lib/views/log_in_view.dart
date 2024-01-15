import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uidesign/constants/constants.dart';
import 'package:uidesign/views/sign_up_view.dart';
import 'package:uidesign/widgets/button.dart';
import 'package:uidesign/views/forgot_password_view.dart';
import 'package:uidesign/widgets/gradient_background.dart';
import 'package:uidesign/widgets/custom_textfield.dart';
import 'package:uidesign/widgets/password_textfield.dart';
import 'package:uidesign/views/home.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _isSecure = true;
  bool _afterLoginAnimate = false;
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
              const Spacer(flex: 20),
              Expanded(
                flex: 10,
                child: FittedBox(
                  child: FadeInRight(
                    child: buildText('Welcome!'),
                  ),
                ),
              ),
              const Spacer(flex: 3),
              Expanded(
                  flex: 5,
                  child: Center(
                    child: FractionallySizedBox(
                      heightFactor: 0.8,
                      widthFactor: 0.8,
                      child: FittedBox(
                        child: FadeInLeft(
                          child: buildText(
                              'Discover all the events that interest you!'),
                        ),
                      ),
                    ),
                  )),
              const Spacer(flex: 5),
              Expanded(
                  flex: 10,
                  child: FractionallySizedBox(
                      heightFactor: 0.8,
                      widthFactor: 0.8,
                      child: FadeInRight(
                          child: CustomTextField(
                        type: TextInputType.emailAddress,
                        hint: 'email',
                        icon: Icons.email_outlined,
                      )))),
              const Spacer(flex: 2),
              Expanded(
                  flex: 10,
                  child: FractionallySizedBox(
                      heightFactor: 0.8,
                      widthFactor: 0.8,
                      child: FadeInLeft(
                          child: PasswordTextField(
                        changeLoading: _changeLoading,
                        isSecure: _isSecure,
                      )))),
              const Spacer(flex: 2),
              Expanded(
                  flex: 3,
                  child: FadeInRight(
                      child: buildInkwellButton(context, 'Forget Password?'))),
              Expanded(
                flex: 15,
                child: FractionallySizedBox(
                    heightFactor: 0.5,
                    widthFactor: 0.8,
                    child: FadeInLeft(
                        child: MyButton(
                      text: 'Log in',
                      onPressed: () async {
                        _animateAfterLogin();
                        await Future.delayed(Duration(seconds: 5));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()));
                      },
                    ))),
              ),
              Expanded(
                  flex: 3,
                  child: FittedBox(
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: FittedBox(
                        child: buildVisibilityWidgetForAnimation(),
                      ),
                    ),
                  )),
              const Spacer(
                flex: 5,
              ),
              Expanded(
                  flex: 3, child: buildInkwellNavigateToSigupPage(context)),
              const Spacer(
                flex: 4,
              ),
            ],
          )
        ],
      ),
    );
  }

  InkWell buildInkwellNavigateToSigupPage(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => SignUpView())));
        },
        child: FittedBox(
            child: Row(
          children: [
            Text(
              'Do not have any account?',
              style: myTextStyle,
            ),
            Text(' Sign up',
                style: myTextStyle.copyWith(fontWeight: FontWeight.bold)),
          ],
        )));
  }

  Visibility buildVisibilityWidgetForAnimation() {
    return Visibility(
        visible: _afterLoginAnimate,
        child: _afterLoginAnimate == true
            ? SpinKitThreeBounce(
                color: myColorTxt5,
                size: 24,
              )
            : SizedBox(
                width: 2,
                height: 2,
              ));
  }

  Text buildText(String text) {
    return Text(
      text,
      style: myTextStyle,
    );
  }

  ///Forgot Password? button
  InkWell buildInkwellButton(BuildContext context, String text) {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ForgotPassword()));
        },
        child: FittedBox(
          child: Text(text, style: myTextStyle),
        ));
  }
}
