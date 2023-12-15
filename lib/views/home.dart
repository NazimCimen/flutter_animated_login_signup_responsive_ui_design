import 'package:flutter/material.dart';
import 'package:uidesign/widgets/gradient_background.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackgroundContainer(),
    );
  }
}
