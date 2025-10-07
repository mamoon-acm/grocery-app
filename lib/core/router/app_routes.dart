import 'package:go_router/go_router.dart';
import 'package:grocery_app/screens/detail/grocery_detail_screen.dart';
import 'package:grocery_app/screens/entry_point/entry_point.dart';
import 'package:grocery_app/screens/home/home_screen.dart';
import 'package:grocery_app/screens/category_products/category_products_screen.dart';
import 'package:grocery_app/screens/all_categories/all_categories_screen.dart';

class AppRoutes {
  AppRoutes._();
  static const String entryPoint = '/';
  static const String home = '/home';
  static const String productDetails = '/details';
  static const String categoryProducts = '/category-products';
  static const String allCategories = '/all-categories';

  static final GoRouter _router = GoRouter(
    initialLocation: entryPoint,
    routes: [
      GoRoute(
        path: entryPoint,
        name: 'entryPoint',
        builder: (context, state) => const AppEntryPoint(),
      ),
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/detail/:id',
        name: 'groceryDetail',
        builder: (context, state) {
          final productId = state.pathParameters['id'] ?? '';
          return GroceryDetailScreen(productId: productId);
        },
      ),
      GoRoute(
        path: '/category/:category',
        name: 'categoryProducts',
        builder: (context, state) {
          final category = state.pathParameters['category'] ?? '';
          return CategoryProductsScreen(category: category);
        },
      ),
      GoRoute(
        path: '/all-categories',
        name: 'allCategories',
        builder: (context, state) => const AllCategoriesScreen(),
      ),
    ],
  );

  static GoRouter get router => _router;
}
