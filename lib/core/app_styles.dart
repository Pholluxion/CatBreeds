import 'package:flutter/material.dart';

/// Colores de la aplicación
class AppColors {
  AppColors._();

  // Color primario de la app
  static const primary = Color(0xFF6A3DE8);

  // Colores de texto
  static const textPrimary = Color(0xFF000000);
  static const textSecondary = Color(0xFF757575);
  static const textOnDark = Color(0xFFFFFFFF);

  // Colores de fondo
  static const background = Color(0xFFF5F5F5);
  static const cardBackground = Color(0xFFFFFFFF);
  static const overlayDark = Color.fromARGB(200, 0, 0, 0);

  // Colores de borde
  static const border = Color.fromRGBO(0, 0, 0, 0.1);
  static const borderDark = Color(0xFF000000);
}

/// Estilos de texto de la aplicación
class AppTextStyles {
  AppTextStyles._();

  // Títulos
  static const headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
  );

  static const headlineMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
  );

  static const headlineSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );

  // Cuerpo de texto
  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
  );

  static const bodyMedium = TextStyle(fontSize: 16, fontFamily: 'Montserrat');

  static const bodySmall = TextStyle(fontSize: 14, fontFamily: 'Montserrat');

  // Estilos con colores específicos
  static const headlineLargeOnDark = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textOnDark,
    fontFamily: 'Montserrat',
  );

  static const headlineMediumOnDark = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textOnDark,
    fontFamily: 'Montserrat',
  );

  static const bodyLargeOnDark = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textOnDark,
    fontFamily: 'Montserrat',
  );

  static const bodySmallOnDark = TextStyle(
    fontSize: 14,
    color: AppColors.textOnDark,
    fontFamily: 'Montserrat',
  );
}

/// Espaciados y paddings de la aplicación
class AppSpacing {
  AppSpacing._();

  // Valores de espaciado base
  static const double xs = 2.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;

  // EdgeInsets predefinidos
  static const paddingXS = EdgeInsets.all(xs);
  static const paddingSM = EdgeInsets.all(sm);
  static const paddingMD = EdgeInsets.all(md);
  static const paddingLG = EdgeInsets.all(lg);
  static const paddingXL = EdgeInsets.all(xl);
}

/// Border radius de la aplicación
class AppBorderRadius {
  AppBorderRadius._();

  static const double sm = 8.0;
  static const double md = 12.0;

  static final small = BorderRadius.circular(sm);
  static final medium = BorderRadius.circular(md);

  static const verticalTop = BorderRadius.vertical(top: Radius.circular(md));

  static const verticalBottom = BorderRadius.vertical(
    bottom: Radius.circular(md),
  );
}

/// Decoraciones comunes de la aplicación
class AppDecorations {
  AppDecorations._();

  static final cardDecoration = BoxDecoration(
    borderRadius: AppBorderRadius.medium,
    border: Border.all(color: AppColors.border),
  );

  static final overlayTopDecoration = const BoxDecoration(
    color: AppColors.overlayDark,
    borderRadius: AppBorderRadius.verticalTop,
  );

  static final overlayBottomDecoration = const BoxDecoration(
    color: AppColors.overlayDark,
    borderRadius: AppBorderRadius.verticalBottom,
  );
}
