import 'package:flutter/animation.dart';

extension CurvesExtension on Curves {
  static const Curve animatedSvgCurve = _AnimatedSvgCurve();
}

class _AnimatedSvgCurve extends Curve {
  final Cubic _cubic = const Cubic(0.15, 0.55, 0.55, 0.15);

  const _AnimatedSvgCurve();

  @override
  double transformInternal(double t) {
    return _cubic.transform(t);
  }
}