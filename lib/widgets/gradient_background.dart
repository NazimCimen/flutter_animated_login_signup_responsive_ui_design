import 'package:flutter/material.dart';
import 'package:uidesign/constants/constants.dart';

class GradientBackgroundContainer extends StatelessWidget {
  const GradientBackgroundContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            myColor1,
            myColor2,
            myColor3,
            myColor4,
          ])),
    );
  }
}
