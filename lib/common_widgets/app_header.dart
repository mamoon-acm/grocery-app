import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/core/constant/app_color.dart';

class AppHeader extends StatelessWidget {
  final String? category;
  final IconData? icon;

  const AppHeader({super.key, this.category, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                  color: AppColors.textOnPrimary,
                ),
                onPressed: () => context.pop(),
              ),
              Text(
                category ?? 'All Categories',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.textOnPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(
                  icon ?? Icons.search,
                  color: AppColors.textOnPrimary,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
