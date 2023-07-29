import 'package:bitcoin_demo/infrastructure/commons/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyText extends StatelessWidget {
  final String price;
  const CurrencyText({super.key,required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      price,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontSize: 30.sp, color: ColorConstants.accent),
    );
  }
}
