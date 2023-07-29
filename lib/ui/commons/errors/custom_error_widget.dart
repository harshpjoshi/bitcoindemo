import 'package:bitcoin_demo/infrastructure/commons/constants/app_constants.dart';
import 'package:bitcoin_demo/infrastructure/commons/constants/color_constants.dart';
import 'package:bitcoin_demo/infrastructure/commons/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onPressed;

  const CustomErrorWidget(
      {super.key, required this.errorMessage, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageConstants.noInternet,
            width: 200.h,
            height: 200.h,
            fit: BoxFit.fill,
          ),
          Text(
            errorMessage,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontSize: 24.sp, color: ColorConstants.accent),
          ),
          SizedBox(
            height: 20.h,
          ),
          ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(ColorConstants.accent),
              fixedSize: MaterialStateProperty.all(
                Size(150.w, 30.h),
              ),
            ),
            child: Text(
              AppConstants.retry,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 16.sp,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
