import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/network_image.dart';
import 'package:grocery_app/core/constant/app_color.dart';
import 'package:grocery_app/core/theme/app_theme.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: AppColors.primary),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hey 👋',
                      style: context.responsiveTextTheme.headlineMedium
                          ?.copyWith(color: AppColors.textOnPrimary),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Lets search your grocery food.',
                      style: context.responsiveTextTheme.bodyMedium?.copyWith(
                        color: AppColors.textOnPrimary,
                      ),
                    ),
                  ],
                ),

                NetworkImageWithLoader(
                  url: 'https://i.pravatar.cc/150?img=12',
                  isCircular: true,
                  height: 50,
                  width: 50,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: AppColors.searchBackground,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.searchBorder),
              ),
              child: TextField(
                style: context.responsiveTextTheme.bodyMedium,
                decoration: InputDecoration(
                  hintText: 'Search your daily grocery food...',
                  hintStyle: context.responsiveTextTheme.bodyMedium?.copyWith(
                    color: AppColors.searchHint,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.searchHint,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
