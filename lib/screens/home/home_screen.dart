import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/loading_indicator.dart';
import 'package:grocery_app/common_widgets/no_data_found_widget.dart';
import 'package:grocery_app/core/constant/app_color.dart';
import 'package:grocery_app/screens/home/widgets/categoriest_section.dart';
import 'package:grocery_app/screens/home/widgets/discount_banner.dart';
import 'package:grocery_app/screens/home/widgets/headers.dart';
import 'package:grocery_app/screens/home/widgets/poular_deals.dart';
import 'package:grocery_app/view_model/home_viewModel.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app/model/grocery_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary,
        child: SafeArea(
          child: Column(
            children: [
              const HeaderSection(),
              Consumer<HomeViewmodel>(
                builder: (context, viewModel, child) {
                  return Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: viewModel.isLoading
                          ? const LoadingIndicator()
                          : viewModel.groceryItems.isEmpty
                          ? const NoDataFoundWidget()
                          : SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  CategoriesSection(
                                    categories: _extractCategories(
                                      viewModel.groceryItems,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const DiscountBanner(),
                                  const SizedBox(height: 20),
                                  PopularDealsSection(
                                    products: viewModel.groceryItems
                                        .take(6)
                                        .toList(),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> _extractCategories(List<Product> products) {
    final categories = <String>{};
    for (var product in products) {
      categories.add(product.category);
    }
    return categories.take(6).toList();
  }
}
