import 'package:flutter/material.dart';
import 'package:planner_app/src/config/styles/app_colors.dart';
import 'package:planner_app/src/config/styles/palette.dart';

class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      textTheme: _textTheme,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      colorScheme: _DarkTheme.colorScheme,
      //elevatedButtonTheme: _DarkTheme.elevatedButtonTheme,
      outlinedButtonTheme: _DarkTheme.outlinedButtonThemeData,
      textButtonTheme: _DarkTheme.textButtonThemeData,
      appBarTheme: _DarkTheme.appBarTheme,
      //inputDecorationTheme: _DarkTheme.inputDecorationTheme,
      //toggleButtonsTheme: _DarkTheme.toggleButtonsThemeData,
      bottomNavigationBarTheme: _DarkTheme.bottomNavigationBarThemeData,
      switchTheme: _DarkTheme.switchThemeData,
      floatingActionButtonTheme: _DarkTheme.floatingActionButtonThemeData,
      iconTheme: _DarkTheme.iconThemeData,
      timePickerTheme: _DarkTheme.timePickerThemeData,
      tabBarTheme: _DarkTheme.tabBarTheme,
      listTileTheme: _DarkTheme.listTileThemeData,
      //drawerTheme: _DarkTheme.drawerThemeData,
      //checkboxTheme: _DarkTheme.checkboxThemeData,
    );
  }

  static TextTheme get _textTheme {
    return const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 20,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        // color: AppColors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontSize: 12,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontSize: 10,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
      ),

      /// TextField style
      bodyLarge: TextStyle(
        fontSize: 12,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    );
  }
}

class _DarkTheme {
  static ColorScheme get colorScheme {
    return const ColorScheme.dark(
      primary: AppColors.black,
      outline: Palette.selected,
      background: Palette.backgroundColor,
      surface: Colors.black,
      primaryContainer: Palette.tileColor,
      onPrimaryContainer: Colors.black,
    );
  }

  // static ElevatedButtonThemeData get elevatedButtonTheme {
  //   return ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: AppColors.primary,
  //       foregroundColor: AppColors.tertiary,
  //       textStyle: const TextStyle(
  //         fontSize: 12,
  //         fontWeight: FontWeight.w400,
  //         fontFamily: 'Poppins',
  //       ),
  //     ),
  //   );
  // }

  static OutlinedButtonThemeData get outlinedButtonThemeData {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  static TextButtonThemeData get textButtonThemeData {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  static AppBarTheme get appBarTheme {
    return const AppBarTheme(
      backgroundColor: Palette.navBarColor,
      surfaceTintColor: Colors.transparent,
    );
  }

  // static InputDecorationTheme get inputDecorationTheme {
  //   return const InputDecorationTheme(
  //     filled: true,
  //     fillColor: AppColors.inputFieldBackground,
  //     contentPadding: EdgeInsets.all(Constants.textFieldPadding),
  //     border: OutlineInputBorder(
  //       borderSide: BorderSide.none,
  //       borderRadius:
  //           BorderRadius.all(Radius.circular(Constants.textFieldRadius)),
  //     ),
  //     hintStyle: TextStyle(
  //       fontSize: 12,
  //       fontWeight: FontWeight.w400,
  //       fontFamily: 'Poppins',
  //       color: AppColors.inputFieldHint,
  //     ),
  //     suffixIconColor: AppColors.inputFieldHint,
  //     prefixIconColor: AppColors.black,
  //   );
  // }

  // static ToggleButtonsThemeData get toggleButtonsThemeData {
  //   return ToggleButtonsThemeData(
  //     selectedBorderColor: AppColors.primary,
  //     borderColor: AppColors.primary,
  //     selectedColor: AppColors.black,
  //     color: AppColors.black,
  //     fillColor: AppColors.primary,
  //     borderRadius: BorderRadius.circular(Constants.toggleButtonsRadius),
  //     textStyle: const TextStyle(
  //       fontSize: 12,
  //       fontFamily: 'Poppins',
  //       fontWeight: FontWeight.w400,
  //     ),
  //   );
  // }

  static BottomNavigationBarThemeData get bottomNavigationBarThemeData {
    return const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Palette.navBarColor,
      unselectedItemColor: AppColors.white,
      selectedItemColor: Palette.selected,
      unselectedLabelStyle: TextStyle(
        fontSize: 10,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
      selectedLabelStyle: TextStyle(
        fontSize: 10,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static SwitchThemeData get switchThemeData {
    return SwitchThemeData(thumbColor: MaterialStateProperty.all(Colors.white));
  }

  static FloatingActionButtonThemeData get floatingActionButtonThemeData {
    return const FloatingActionButtonThemeData(
      foregroundColor: Palette.tileColor,
    );
  }

  static IconThemeData get iconThemeData {
    return const IconThemeData(color: AppColors.white);
  }

  static TimePickerThemeData get timePickerThemeData {
    return const TimePickerThemeData(backgroundColor: Palette.navBarColor);
  }

  static TabBarTheme get tabBarTheme {
    return const TabBarTheme(
      labelStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static ListTileThemeData get listTileThemeData {
    return const ListTileThemeData(
      contentPadding: EdgeInsets.zero,
      style: ListTileStyle.drawer,
      titleTextStyle: TextStyle(
        fontSize: 12,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  // static DrawerThemeData get drawerThemeData {
  //   return const DrawerThemeData(backgroundColor: AppColors.blueGray900);
  // }

  // static CheckboxThemeData get checkboxThemeData {
  //   return const CheckboxThemeData(
  //     checkColor: MaterialStatePropertyAll(Colors.white),
  //     fillColor: MaterialStatePropertyAll(AppColors.primary),
  //   );
  // }
}
