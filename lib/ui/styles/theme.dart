import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData get lightTheme => ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.dodgerBlue,
        elevation: 0,
      ),
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'DMSans',
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ).copyWith(surface: Colors.white),
    );
