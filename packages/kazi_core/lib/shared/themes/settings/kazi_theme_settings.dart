import 'package:flutter/material.dart';
import 'package:kazi_core/shared/themes/themes.dart';

abstract class KaziThemeSettings {
  static const pageTransitionsTheme = PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.fuchsia: NoAnimationPageTransitionsBuilder(),
      TargetPlatform.linux: NoAnimationPageTransitionsBuilder(),
      TargetPlatform.macOS: NoAnimationPageTransitionsBuilder(),
      TargetPlatform.windows: NoAnimationPageTransitionsBuilder(),
    },
  );

  static ShapeBorder get defaultShape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(KaziInsets.md),
      );

  static ThemeData light() {
    final colors = _getColorScheme(Brightness.light);

    return ThemeData.light().copyWith(
      pageTransitionsTheme: pageTransitionsTheme,
      colorScheme: colors,
      appBarTheme: _appBarTheme(colors),
      cardTheme: _cardTheme(),
      listTileTheme: _listTileTheme(colors),
      bottomAppBarTheme: _bottomAppBarTheme(colors),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(colors),
      bottomSheetTheme: _bottomSheetTheme(colors),
      floatingActionButtonTheme: _floatingActionButtonTheme(colors),
      dividerTheme: _dividerTheme(colors),
      navigationRailTheme: _navigationRailTheme(colors),
      tabBarTheme: _tabBarTheme(colors),
      drawerTheme: _drawerTheme(colors),
      inputDecorationTheme: _inputDecorationTheme(colors),
      dataTableTheme: _dataTableTheme(),
      textTheme: KaziTextStyles.textTheme,
      scaffoldBackgroundColor: colors.surface,
    );
  }

  static ThemeData dark() {
    final colors = _getColorScheme(Brightness.dark);

    return ThemeData.dark().copyWith(
      pageTransitionsTheme: pageTransitionsTheme,
      colorScheme: colors,
      appBarTheme: _appBarTheme(colors),
      cardTheme: _cardTheme(),
      listTileTheme: _listTileTheme(colors),
      bottomAppBarTheme: _bottomAppBarTheme(colors),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(colors),
      bottomSheetTheme: _bottomSheetTheme(colors),
      floatingActionButtonTheme: _floatingActionButtonTheme(colors),
      outlinedButtonTheme: _outlinedButtonTheme(colors),
      dividerTheme: _dividerTheme(colors),
      navigationRailTheme: _navigationRailTheme(colors),
      tabBarTheme: _tabBarTheme(colors),
      drawerTheme: _drawerTheme(colors),
      inputDecorationTheme: _inputDecorationTheme(colors),
      dataTableTheme: _dataTableTheme(),
      textTheme: KaziTextStyles.textTheme,
      scaffoldBackgroundColor: colors.surface,
    );
  }

  static ColorScheme _getColorScheme(Brightness brightness) =>
      ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: KaziColors.primary,
        primary: KaziColors.primary,
        surface: KaziColors.white,
        onSurface: KaziColors.black,
        error: KaziColors.red,
      );

  static CardTheme _cardTheme() => CardTheme(
        elevation: 0,
        shape: defaultShape,
        margin: const EdgeInsets.only(bottom: KaziInsets.sm),
        clipBehavior: Clip.antiAlias,
      );

  static ListTileThemeData _listTileTheme(ColorScheme colors) =>
      ListTileThemeData(selectedColor: colors.secondary);

  static AppBarTheme _appBarTheme(ColorScheme colors) => AppBarTheme(
        elevation: 0,
        backgroundColor: colors.primary,
        // foregroundColor: colors.onSurface,
      );

  static TabBarTheme _tabBarTheme(ColorScheme colors) => TabBarTheme(
        labelColor: colors.secondary,
        unselectedLabelColor: colors.onSurfaceVariant,
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: colors.secondary,
              width: 2,
            ),
          ),
        ),
      );

  static BottomAppBarTheme _bottomAppBarTheme(ColorScheme colors) =>
      BottomAppBarTheme(
        color: colors.surface,
        elevation: 0,
        height: 75,
      );

  static BottomNavigationBarThemeData _bottomNavigationBarTheme(
    ColorScheme colors,
  ) =>
      BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colors.surface,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.onPrimaryContainer,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      );

  static BottomSheetThemeData _bottomSheetTheme(ColorScheme colors) =>
      BottomSheetThemeData(
        backgroundColor: colors.surface,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
      );

  static FloatingActionButtonThemeData _floatingActionButtonTheme(
    ColorScheme colors,
  ) =>
      FloatingActionButtonThemeData(
        elevation: 0,
        highlightElevation: 0,
        backgroundColor: colors.primary,
        foregroundColor: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      );

  static OutlinedButtonThemeData _outlinedButtonTheme(ColorScheme colors) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: KaziColors.black),
        ),
      );

  static DividerThemeData _dividerTheme(ColorScheme colors) =>
      const DividerThemeData(
        color: KaziColors.lightGrey,
        thickness: 1,
        indent: 0,
        endIndent: 0,
        space: 0,
      );

  static NavigationRailThemeData _navigationRailTheme(ColorScheme colors) =>
      const NavigationRailThemeData();

  static DrawerThemeData _drawerTheme(ColorScheme colors) => DrawerThemeData(
        backgroundColor: colors.surface,
      );

  static InputDecorationTheme _inputDecorationTheme(ColorScheme colors) {
    const borderRadius = BorderRadius.all(Radius.circular(KaziInsets.xs));
    return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      fillColor: colors.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: KaziInsets.md),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: colors.onSurface),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: colors.onSurface),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: colors.onSurface),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: colors.onSurface),
      ),
    );
  }

  static DataTableThemeData _dataTableTheme() => DataTableThemeData(
        headingRowHeight: 42,
        dataRowMaxHeight: 42,
        dataRowMinHeight: 28,
        horizontalMargin: KaziInsets.md,
        columnSpacing: KaziInsets.md,
        headingTextStyle: KaziTextStyles.titleSm,
        dataTextStyle: KaziTextStyles.md,
      );
}
