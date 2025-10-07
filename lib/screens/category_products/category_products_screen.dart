import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/common_widgets/app_header.dart';
import 'package:grocery_app/common_widgets/loading_indicator.dart';
import 'package:grocery_app/common_widgets/no_data_found_widget.dart';
import 'package:grocery_app/core/constant/app_color.dart';
import 'package:grocery_app/model/grocery_item.dart';
import 'package:grocery_app/view_model/home_viewModel.dart';
import 'package:grocery_app/screens/category_products/widgets/product_grid_item.dart';
import 'package:provider/provider.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String category;

  const CategoryProductsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary,
        child: SafeArea(
          child: Column(
            children: [
              AppHeader(category: category),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Consumer<HomeViewmodel>(
                    builder: (context, viewModel, child) {
                      // Filter products by category
                      final categoryProducts = viewModel.groceryItems
                          .where((product) => product.category == category)
                          .toList();

                      if (viewModel.isLoading) {
                        return const LoadingIndicator();
                      }

                      if (categoryProducts.isEmpty) {
                        return const NoDataFoundWidget();
                      }

                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 0.7,
                              ),
                          itemCount: categoryProducts.length,
                          itemBuilder: (context, index) {
                            return ProductGridItem(
                              product: categoryProducts[index],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class _HeaderSection extends StatelessWidget {
//   final String category;

//   const _HeaderSection({required this.category});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 icon: const Icon(
//                   Icons.arrow_back_ios,
//                   size: 16,
//                   color: AppColors.textOnPrimary,
//                 ),
//                 onPressed: () => context.pop(),
//               ),
//               Text(
//                 category,
//                 style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                   color: AppColors.textOnPrimary,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.search, color: AppColors.textOnPrimary),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
