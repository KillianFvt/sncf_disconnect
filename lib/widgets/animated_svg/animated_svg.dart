import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
import 'package:path_drawing/path_drawing.dart';
import 'dart:ui' as ui;

class AnimatedSvgPath extends StatefulWidget {
  final String svgAsset;
  final String pathClass;
  final Color strokeColor;
  final double strokeWidth;
  final Duration animationDuration;

  const AnimatedSvgPath({
    super.key,
    required this.svgAsset,
    required this.pathClass,
    required this.strokeColor,
    required this.strokeWidth,
    required this.animationDuration,
  });

  @override
  State<AnimatedSvgPath> createState() => _AnimatedSvgPathState();
}

class _AnimatedSvgPathState extends State<AnimatedSvgPath> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _curve;
  late Animation<double> _animation;
  String? _pathData;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.animationDuration);
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _animation = Tween<double>(begin: 0, end: 1).animate(_curve);
    _loadSvg();
  }


  Future<void> _loadSvg() async {
    final svgString = await DefaultAssetBundle.of(context).loadString(widget.svgAsset);
    final document = xml.XmlDocument.parse(svgString);
    final pathElement = document.descendants.whereType<xml.XmlElement>().firstWhere(
      (element) => element.name.local == 'path' && element.getAttribute('class')?.contains(widget.pathClass) == true,
      orElse: () => throw Exception('Path with class ${widget.pathClass} not found'),
    );
    setState(() {
      _pathData = pathElement.getAttribute('d');
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (_pathData == null) {
      print('Path data is null');
      return const SizedBox.shrink();
    } else {
      print("Displaying path data: $_pathData");
      return CustomPaint(
        painter: _SvgPathPainter(
          pathData: _pathData!,
          strokeColor: widget.strokeColor,
          strokeWidth: widget.strokeWidth,
          animation: _animation,
        ),
      );
    }
  }
}


class _SvgPathPainter extends CustomPainter {
  final String pathData;
  final Color strokeColor;
  final double strokeWidth;
  final Animation<double> animation;

  _SvgPathPainter({
    required this.pathData,
    required this.strokeColor,
    required this.strokeWidth,
    required this.animation,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final path = parseSvgPathData(pathData);
    final pathMetrics = path.computeMetrics().toList();
    final paint = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    for (final metric in pathMetrics) {
      final extractPath = metric.extractPath(0, metric.length * animation.value);
      canvas.drawPath(extractPath, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}