import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'styles.dart';

ThemeData get lightTheme => ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: AppColors.darkGunmetal,
        foregroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: AppTextStyle.bodyMedium,
        centerTitle: true,
      ),
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'DMSans',
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ).copyWith(surface: Colors.white),
    );
