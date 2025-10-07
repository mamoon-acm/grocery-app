import 'package:flutter/material.dart';
import 'package:grocery_app/core/constant/app_constant.dart';
import 'package:grocery_app/core/theme/app_theme.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppConstant.noDataFoundImage),
        Text('No Data Found...', style: context.responsiveTextTheme.bodyLarge),
      ],
    );
  }
}
