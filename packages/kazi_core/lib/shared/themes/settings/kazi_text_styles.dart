import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kazi_core/shared/themes/themes.dart';

abstract class KaziTextStyles {
  /// 22px, [KaziColors.white], [FontWeight.w500]
  static final cardTitle = GoogleFonts.outfit(
    color: KaziColors.white,
    fontWeight: FontWeight.w500,
    fontSize: 22,
  );

  /// 16px, [KaziColors.white], [FontWeight.w500]
  static final cardSubtitle = GoogleFonts.outfit(
    color: KaziColors.white,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  /// 18px, [KaziColors.black], [FontWeight.w400]
  static final appBarTitle = GoogleFonts.outfit(
    color: KaziColors.black,
    fontWeight: FontWeight.w400,
    fontSize: 18,
  );

  /// 36px, [KaziColors.black], [FontWeight.w500]
  static final loginTitle = GoogleFonts.outfit(
    color: KaziColors.black,
    fontWeight: FontWeight.w500,
    fontSize: 36,
  );

  /// 32px, [KaziColors.black], [FontWeight.w500]
  static final headlineLg = textTheme.headlineLarge!;

  /// 24px, [KaziColors.black], [FontWeight.w500]
  static final headlineMd = textTheme.headlineMedium!;

  /// 18px, [KaziColors.grey], [FontWeight.w500]
  static final headlineSm = textTheme.headlineSmall!;

  /// 24px, [KaziColors.black], [FontWeight.w500]
  static final titleLg = textTheme.titleMedium!;

  /// 20px, [KaziColors.black], [FontWeight.w500]
  static final titleMd = textTheme.titleMedium!;

  /// 16px, [KaziColors.black], [FontWeight.w500]
  static final titleSm = textTheme.titleSmall!;

  /// 18px, [KaziColors.black], [FontWeight.w400]
  static final lg = textTheme.bodyLarge!;

  /// 16px, [KaziColors.black], [FontWeight.w400]
  static final md = textTheme.bodyMedium!;

  /// 14px, [KaziColors.black], [FontWeight.w400]
  static final sm = textTheme.bodySmall!;

  /// 16px, [KaziColors.grey], [FontWeight.w400]
  static final labelLg = textTheme.labelLarge!;

  /// 14px, [KaziColors.grey], [FontWeight.w400]
  static final labelMd = textTheme.labelMedium!;

  /// 12px, [KaziColors.grey], [FontWeight.w400]
  static final labelSm = textTheme.labelSmall!;

  static final textTheme = TextTheme(
    displayLarge: GoogleFonts.outfit(),
    displayMedium: GoogleFonts.outfit(),
    displaySmall: GoogleFonts.outfit(),
    headlineLarge: GoogleFonts.outfit(
      color: KaziColors.black,
      fontWeight: FontWeight.w500,
      fontSize: 32,
    ),
    headlineMedium: GoogleFonts.outfit(
      color: KaziColors.black,
      fontWeight: FontWeight.w500,
      fontSize: 24,
    ),
    headlineSmall: GoogleFonts.outfit(
      color: KaziColors.grey,
      fontWeight: FontWeight.w500,
      fontSize: 18,
    ),
    titleLarge: GoogleFonts.outfit(
      color: KaziColors.black,
      fontWeight: FontWeight.w500,
      fontSize: 24,
    ),
    titleMedium: GoogleFonts.outfit(
      color: KaziColors.black,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    titleSmall: GoogleFonts.outfit(
      color: KaziColors.black,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    bodyLarge: GoogleFonts.outfit(
      color: KaziColors.black,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    ),
    bodyMedium: GoogleFonts.outfit(
      color: KaziColors.black,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    bodySmall: GoogleFonts.outfit(
      color: KaziColors.black,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    labelLarge: GoogleFonts.outfit(
      color: KaziColors.grey,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    labelMedium: GoogleFonts.outfit(
      color: KaziColors.grey,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    labelSmall: GoogleFonts.outfit(
      color: KaziColors.grey,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  );
}
