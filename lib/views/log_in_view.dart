import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uidesign/constants/constants.dart';
import 'package:uidesign/views/sign_up_view.dart';
import 'package:uidesign/widgets/button.dart';
import 'package:uidesign/views/forgot_password_view.dart';
import 'package:uidesign/widgets/gradient_background.dart';
import 'package:uidesign/widgets/mail_textfield.dart';
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
                    child: Text(
                      'Welcome!',
                      style: myTextStyle,
                    ),
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
                          child: Text(
                              'Discover all the events that interest you!',
                              style: myTextStyle),
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
                      child: FadeInRight(child: EmailTextField()))),
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
                        child: MyButtons(
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
                        child: Visibility(
                            visible: _afterLoginAnimate,
                            child: _afterLoginAnimate == true
                                ? SpinKitThreeBounce(
                                    color: myColorTxt5,
                                    size: 24,
                                  )
                                : SizedBox(
                                    width: 2,
                                    height: 2,
                                  )),
                      ),
                    ),
                  )),
              const Spacer(
                flex: 5,
              ),
              Expanded(
                  flex: 3,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SignUpView())));
                      },
                      child: FittedBox(
                          child: Row(
                        children: [
                          Text(
                            'Do not have any account?',
                            style: myTextStyle,
                          ),
                          Text(' Sign up', style: myTextStyle),
                        ],
                      )))),
              const Spacer(
                flex: 4,
              ),
            ],
          )
        ],
      ),
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
