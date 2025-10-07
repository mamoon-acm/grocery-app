import 'package:flutter/material.dart';
import 'package:grocery_app/core/providers/app_providers.dart';
import 'package:grocery_app/core/router/app_routes.dart';
import 'package:grocery_app/core/theme/app_theme.dart';
import 'package:provider/provider.dart'; 

void main() {

  runApp(
    MultiProvider(
      providers: AppProviders.providers,
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Grocery App',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.router,
    );
  }
}
