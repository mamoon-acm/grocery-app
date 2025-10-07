// Device Type Enum
import 'package:flutter/material.dart';
import 'package:grocery_app/core/constant/app_color.dart';

enum DeviceType { mobile, tablet, desktop }

// Responsive Text Theme Helper
class ResponsiveTextTheme {
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return DeviceType.mobile;
    } else if (width < 1200) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  static TextTheme getTextTheme(BuildContext context) {
    final deviceType = getDeviceType(context);
    
    switch (deviceType) {
      case DeviceType.mobile:
        return _mobileTextTheme;
      case DeviceType.tablet:
        return _tabletTextTheme;
      case DeviceType.desktop:
        return _desktopTextTheme;
    }
  }

  // Mobile Text Theme (< 600px)
  static const TextTheme _mobileTextTheme = TextTheme(
    // Display - Extra Large Headlines
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      height: 1.2,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      height: 1.2,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      height: 1.3,
    ),
    
    // Headline - Section Headers
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.3,
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.3,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.4,
    ),
    
    // Title - Card Headers, List Titles
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.4,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.4,
    ),
    
    // Body - Main Content
    bodyLarge: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
      height: 1.5,
    ),
    bodySmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: AppColors.textTertiary,
      height: 1.5,
    ),
    
    // Label - Buttons, Chips, Small Text
    labelLarge: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      height: 1.3,
    ),
    labelMedium: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
      height: 1.3,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.textTertiary,
      height: 1.3,
    ),
  );

  // Tablet Text Theme (600px - 1199px)
  static const TextTheme _tabletTextTheme = TextTheme(
    // Display
    displayLarge: TextStyle(
      fontSize: 44,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      height: 1.2,
    ),
    displayMedium: TextStyle(
      fontSize: 38,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      height: 1.2,
    ),
    displaySmall: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      height: 1.3,
    ),
    
    // Headline
    headlineLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.3,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.3,
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.4,
    ),
    
    // Title
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.4,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.4,
    ),
    
    // Body
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
      height: 1.6,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
      height: 1.6,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textTertiary,
      height: 1.6,
    ),
    
    // Label
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      height: 1.3,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
      height: 1.3,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.textTertiary,
      height: 1.3,
    ),
  );

  // Desktop Text Theme (>= 1200px)
  static const TextTheme _desktopTextTheme = TextTheme(
    // Display
    displayLarge: TextStyle(
      fontSize: 56,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      height: 1.2,
    ),
    displayMedium: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      height: 1.2,
    ),
    displaySmall: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      height: 1.3,
    ),
    
    // Headline
    headlineLarge: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.3,
    ),
    headlineMedium: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.3,
    ),
    headlineSmall: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.4,
    ),
    
    // Title
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.4,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      height: 1.4,
    ),
    
    // Body
    bodyLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
      height: 1.6,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
      height: 1.6,
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.textTertiary,
      height: 1.6,
    ),
    
    // Label
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
      height: 1.3,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
      height: 1.3,
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.textTertiary,
      height: 1.3,
    ),
  );
}

// Light Theme Configuration
class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    
    // Color Scheme
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.textOnPrimary,
      primaryContainer: AppColors.primaryContainer,
      secondary: AppColors.accent,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      error: AppColors.error,
      background: AppColors.background,
    ),
    
    // Scaffold Background
    scaffoldBackgroundColor: AppColors.background,
    
    // AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textOnPrimary,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.iconOnPrimary,
        size: 24,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.textOnPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    
    // Card Theme
    cardTheme: CardThemeData(
      color: AppColors.cardBackground,
      elevation: 2,
      shadowColor: AppColors.shadowLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    ),
    
    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.searchBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.searchBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.searchBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      hintStyle: const TextStyle(
        color: AppColors.searchHint,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    
    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        elevation: 2,
        shadowColor: AppColors.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    
    // Floating Action Button Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textOnPrimary,
      elevation: 4,
      shape: CircleBorder(),
    ),
    
    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.bottomNavBackground,
      selectedItemColor: AppColors.bottomNavSelected,
      unselectedItemColor: AppColors.bottomNavUnselected,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
    
    // Icon Theme
    iconTheme: const IconThemeData(
      color: AppColors.iconPrimary,
      size: 24,
    ),
    
    // Default Text Theme (Mobile - will be overridden by MediaQuery)
    textTheme: ResponsiveTextTheme._mobileTextTheme,
    
    // Divider Theme
    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
      space: 1,
    ),
    
    // Chip Theme
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.primaryContainer,
      selectedColor: AppColors.primary,
      labelStyle: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}

// Extension to easily access responsive text theme
extension ResponsiveText on BuildContext {
  TextTheme get responsiveTextTheme => ResponsiveTextTheme.getTextTheme(this);
  DeviceType get deviceType => ResponsiveTextTheme.getDeviceType(this);
}