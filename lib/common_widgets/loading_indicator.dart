import 'package:flutter/material.dart';
import 'package:grocery_app/core/constant/app_constant.dart';
import 'package:grocery_app/core/theme/app_theme.dart';
import 'package:lottie/lottie.dart';

class LoadingIndicator extends StatelessWidget {
  final String? message;

  const LoadingIndicator({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Lottie.asset(AppConstant.loading, width: 100, height: 100),
        ),

        Text('Loading... ', style: context.responsiveTextTheme.bodyLarge),
      ],
    );
  }
}
