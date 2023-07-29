import 'package:bitcoin_demo/infrastructure/commons/constants/color_constants.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: ColorConstants.accent,
      ),
    );
  }
}
