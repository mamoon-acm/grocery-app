import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/core/constant/app_color.dart';
import 'package:grocery_app/view_model/home_viewModel.dart';
import 'package:grocery_app/model/grocery_item.dart';
import 'package:provider/provider.dart';

class CategoryGridItem extends StatelessWidget {
  final String category;

  const CategoryGridItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to category products screen
        context.push('/category/$category');
      },
      child: Container(
        decoration: BoxDecoration(color: AppColors.primaryContainer),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<HomeViewmodel>(
              builder: (context, viewModel, child) {
                // Find the first product in this category to use its image
                final firstProduct = viewModel.groceryItems.firstWhere(
                  (product) => product.category == category,
                  orElse: () => Product(
                    id: 0,
                    title: '',
                    price: 0.0,
                    description: '',
                    category: '',
                    image: '',
                    rating: Rating(rate: 0.0, count: 0),
                  ),
                );

                return Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceVariant,
                    // shape: BoxShape.circle,
                    image: firstProduct.image.isNotEmpty
                        ? DecorationImage(
                            image: NetworkImage(firstProduct.image),
                            fit: BoxFit.fill,
                          )
                        : null,
                  ),
                  child: firstProduct.image.isEmpty
                      ? Icon(Icons.category, color: AppColors.primary, size: 30)
                      : null,
                );
              },
            ),
            const SizedBox(height: 12),
            Text(
              category,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
