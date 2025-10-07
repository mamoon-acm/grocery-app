import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_header.dart';
import 'package:grocery_app/view_model/home_viewModel.dart';
import 'package:grocery_app/core/constant/app_color.dart';
import 'package:grocery_app/model/grocery_item.dart';
import 'package:grocery_app/screens/detail/widgets/product_details.dart';
import 'package:provider/provider.dart';

class GroceryDetailScreen extends StatelessWidget {
  final String productId;

  const GroceryDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary,
        child: SafeArea(
          child: Consumer<HomeViewmodel>(
            builder: (context, viewModel, child) {
              // Find the product by ID
              final product = viewModel.groceryItems.firstWhere(
                (item) => item.id.toString() == productId,
                orElse: () => Product(
                  id: 0,
                  title: 'Product not found',
                  price: 0.0,
                  description: 'The requested product could not be found.',
                  category: 'Unknown',
                  image: '',
                  rating: Rating(rate: 0.0, count: 0),
                ),
              );

              return Column(
                children: [
                  // DetailHeader(product: product),
                  AppHeader(
                    category: product.category,
                    icon: Icons.shopping_cart,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: ProductDetails(product: product),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
