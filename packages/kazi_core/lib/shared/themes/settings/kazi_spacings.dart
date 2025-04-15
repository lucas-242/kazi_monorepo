import 'package:flutter/widgets.dart';
import 'package:kazi_core/shared/themes/themes.dart';

abstract class KaziSpacings {
  ///8.0px
  static const verticalXs = SizedBox(height: KaziInsets.xs);

  ///12.0px
  static const verticalSm = SizedBox(height: KaziInsets.sm);

  ///16.0px
  static const verticalMd = SizedBox(height: KaziInsets.md);

  ///20.0px
  static const verticalLg = SizedBox(height: KaziInsets.lg);

  ///28.0px
  static const verticalXLg = SizedBox(height: KaziInsets.xLg);

  ///40.0px
  static const verticalXxLg = SizedBox(height: KaziInsets.xxLg);

  ///50.0px
  static const verticalXxxLg = SizedBox(height: KaziInsets.xxxLg);

  ///8.0px
  static const horizontalXs = SizedBox(width: KaziInsets.xs);

  ///12.0px
  static const horizontalSm = SizedBox(width: KaziInsets.sm);

  ///16.0px
  static const horizontalMd = SizedBox(width: KaziInsets.md);

  ///20.0px
  static const horizontalLg = SizedBox(width: KaziInsets.lg);

  ///28.0px
  static const horizontalXLg = SizedBox(width: KaziInsets.xLg);

  ///40.0px
  static const horizontalXxLg = SizedBox(width: KaziInsets.xxLg);

  ///50.0px
  static const horizontalXxxLg = SizedBox(width: KaziInsets.xxxLg);
}
