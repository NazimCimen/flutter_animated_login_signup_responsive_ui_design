import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:uidesign/constants/constants.dart';
import 'package:uidesign/widgets/button.dart';
import 'package:uidesign/widgets/gradient_background.dart';
import 'package:uidesign/views/log_in_view.dart';
import 'package:uidesign/widgets/custom_textfield.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          GradientBackgroundContainer(),
          Column(
            children: [
              const Spacer(flex: 17),
              Expanded(
                flex: 10,
                child: FittedBox(
                  child: FadeInRight(
                    child: buildCircleAvatar(),
                  ),
                ),
              ),
              const Spacer(flex: 5),
              Expanded(
                flex: 13,
                child: FittedBox(
                  child: FadeInLeft(
                    child: buildText(),
                  ),
                ),
              ),
              const Spacer(flex: 3),
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
              const Spacer(flex: 1),
              Expanded(
                  flex: 15,
                  child: Center(
                    child: FractionallySizedBox(
                        heightFactor: 0.5,
                        widthFactor: 0.8,
                        child: FadeInLeft(
                            child: MyButton(
                          text: 'Send Email',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LogIn()));
                          },
                        ))),
                  )),
              const Spacer(flex: 5),
              Expanded(
                flex: 10,
                child: FittedBox(
                  child: FadeInRight(
                    child: buildTextButton(context),
                  ),
                ),
              ),
              const Spacer(flex: 11),
            ],
          ),
        ],
      ),
    );
  }

  TextButton buildTextButton(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LogIn()));
        },
        child: Row(
          children: [
            Icon(Icons.chevron_left_outlined, color: myColorTxt5),
            FittedBox(
                child: Text('back to Log in',
                    style: myTextStyle.copyWith(fontSize: 14))),
          ],
        ));
  }

  Text buildText() {
    return Text(
        style: myTextStyle,
        'Just give us the email address\nyou used to create your account\n and we will send you an email\n to make a new password.');
  }

  CircleAvatar buildCircleAvatar() {
    return CircleAvatar(
      backgroundColor: myColor3,
      child: Icon(
        Icons.question_mark_outlined,
        color: myColorTxt5,
      ),
    );
  }
}
