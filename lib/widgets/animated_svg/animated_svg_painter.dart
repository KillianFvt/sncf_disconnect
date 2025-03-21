import 'package:flutter/cupertino.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:sncf_disconnect/extensions/curves.dart';

class AnimatedSvgPainter extends StatefulWidget {

  final String pathData;
  final Color strokeColor;
  final double strokeWidth;
  final Duration animationDuration;
  final Curve animationCurve;
  final Duration animationDelay;
  final bool reverse;

  const AnimatedSvgPainter({
    super.key,
    required this.pathData,
    required this.strokeColor,
    required this.strokeWidth,
    required this.animationDuration,
    this.animationCurve = CurvesExtension.animatedSvgCurve,
    this.animationDelay = Duration.zero,
    this.reverse = false,
  });

  @override
  State<AnimatedSvgPainter> createState() => AnimatedSvgPainterState();
}

class AnimatedSvgPainterState extends State<AnimatedSvgPainter> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.animationDuration,
    reverseDuration: widget.animationDuration,
  )..addListener(
    () => setState(() {
      if (_controller.isCompleted && false) {
        _controller.reset();
        startAnimation();
      }
    })
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: widget.animationCurve,
  );

  void startAnimation() {
    Future.delayed(widget.animationDelay, () {
      _controller.forward();
    });
  }

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SvgPathPainter(
        pathData: widget.pathData,
        strokeColor: widget.strokeColor,
        strokeWidth: widget.strokeWidth,
        animation: _animation,
        reverse: widget.reverse,
      ),
    );
  }
}


class SvgPathPainter extends CustomPainter {
  final String pathData;
  final Color strokeColor;
  final double strokeWidth;
  final Animation<double> animation;
  final bool reverse;

  SvgPathPainter({
    required this.pathData,
    required this.strokeColor,
    required this.strokeWidth,
    required this.animation,
    this.reverse = false,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final path = parseSvgPathData(pathData);
    final pathMetrics = path.computeMetrics().toList();
    final paint = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    for (final metric in pathMetrics) {
      final Path extractPath;

      if (reverse) {
        extractPath = metric.extractPath(0, metric.length * animation.value);
      } else {
        extractPath = metric.extractPath(metric.length * (1 - animation.value), metric.length);
      }
      canvas.drawPath(extractPath, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}