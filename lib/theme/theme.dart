import 'package:academy/exporter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/utils.dart';

ThemeData get themeData => ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 54),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(padding)),
        ),
      ),
      scaffoldBackgroundColor: scaffolBackgroundColor,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          vertical: paddingLarge,
        ),
        filled: true,
        fillColor: scaffolBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(paddingLarge),
          borderSide: BorderSide.none,
        ),
        prefixIconColor: Colors.grey,
        suffixIconColor: Colors.grey,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
      ),
      fontFamily: "Roboto",
      useMaterial3: true,
      platform: TargetPlatform.iOS,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
      ),
    );

extension BuildContextExtension on BuildContext {
  TextStyle get headlineLarge => textTheme.headlineLarge!;
  TextStyle get headlineMedium => textTheme.headlineMedium!;

  TextStyle get headlineSmall => textTheme.headlineSmall!;

  TextStyle get titleLarge => textTheme.titleLarge!;

  TextStyle get titleMedium => textTheme.titleMedium!;

  TextStyle get bodyLarge => textTheme.bodyLarge!;

  TextStyle get labelLarge => textTheme.labelLarge!;

  TextStyle get bodyMedium => textTheme.bodyMedium!;

  TextStyle get bodySmall => textTheme.bodySmall!;
}

ButtonStyle get shrinkedButton => TextButton.styleFrom(
    minimumSize: const Size(0, 0),
    padding: EdgeInsets.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap);

setSystemOverlay() {
  if (kIsWeb) return;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
}

RoundedRectangleBorder bottomSheetShape() {
  return const RoundedRectangleBorder();
}
