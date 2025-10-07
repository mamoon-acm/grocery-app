import 'package:grocery_app/view_model/bottom_navigation_view_model.dart';
import 'package:grocery_app/view_model/home_viewModel.dart';
import 'package:provider/provider.dart';

class AppProviders {
  static List<ChangeNotifierProvider> get providers => [
    ChangeNotifierProvider<NavigationProvider>(
      create: (_) => NavigationProvider(),
    ),

    ChangeNotifierProvider<HomeViewmodel>(create: (_) => HomeViewmodel()),
  ];
}
