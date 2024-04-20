import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ReusableLoadingIndicator extends StatelessWidget {
  const ReusableLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset("assets/animations/Animation - 1713508997982.json",),);
  }
}