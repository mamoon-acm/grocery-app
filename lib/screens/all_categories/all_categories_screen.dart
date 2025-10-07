import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_header.dart';
import 'package:grocery_app/core/constant/app_color.dart';
import 'package:grocery_app/view_model/home_viewModel.dart';
import 'package:grocery_app/screens/all_categories/widgets/category_grid_item.dart';
import 'package:provider/provider.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary,
        child: SafeArea(
          child: Column(
            children: [
              AppHeader(),
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
                      // Extract unique categories
                      final categories = <String>{};
                      for (var product in viewModel.groceryItems) {
                        categories.add(product.category);
                      }
                      final categoryList = categories.toList();

                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 1.2,
                              ),
                          itemCount: categoryList.length,
                          itemBuilder: (context, index) {
                            return CategoryGridItem(
                              category: categoryList[index],
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
