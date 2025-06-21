import 'package:flutter/material.dart';
import 'package:kazi_core/shared/themes/themes.dart';

class KaziLoading extends StatefulWidget {
  const KaziLoading({
    super.key,
    this.color,
    this.height,
  });

  final Color? color;
  final double? height;

  @override
  State<KaziLoading> createState() => _KaziLoadingState();
}

class _KaziLoadingState extends State<KaziLoading>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<int> _animation;
  static const String _text = 'Carregando...';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    _animation = StepTween(begin: 0, end: _text.length).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? context.height,
      color: widget.color,
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final frame = _text.substring(0, _animation.value);
            return Text(
              frame,
              style: KaziTextStyles.titleLg.copyWith(
                color: KaziColors.primary,
                fontWeight: FontWeight.w600,
              ),
            );
          },
        ),
      ),
    );
  }
}
