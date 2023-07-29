import 'package:bitcoin_demo/infrastructure/commons/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BitCoinLogo extends StatelessWidget {
  const BitCoinLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
        ),
        Image.asset(
          ImageConstants.bitCoinLogo,
          height: 200.h,
          width: 200.h,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
