import 'package:flutter/material.dart';
import 'package:kazi_core/shared/components/safe_area/widgets/padding_wrap.dart';
import 'package:kazi_core/shared/components/scroll/kazi_scroll_behavior.dart';

class KaziSafeArea extends StatelessWidget {
  const KaziSafeArea({
    super.key,
    this.onRefresh,
    this.child,
    this.padding,
  });

  final Future<void> Function()? onRefresh;
  final Widget? child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScrollConfiguration(
        behavior: KaziScrollBehavior(),
        child: onRefresh != null
            ? RefreshIndicator(
                onRefresh: onRefresh!,
                child: PaddingWrap(
                  padding: padding,
                  child: child,
                ),
              )
            : PaddingWrap(
                padding: padding,
                child: child,
              ),
      ),
    );
  }
}
