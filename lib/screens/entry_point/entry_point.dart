import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/bottom_naviagtion_bar.dart';
import 'package:grocery_app/view_model/bottom_navigation_view_model.dart';
import 'package:provider/provider.dart';

class AppEntryPoint extends StatelessWidget {
  const AppEntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavigationProvider>(
        builder: (context, navProvider, child) {
          return navProvider.screens[navProvider.currentIndex];
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
