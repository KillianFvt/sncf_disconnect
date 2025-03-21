import 'package:flutter/material.dart';
import 'package:sncf_disconnect/extensions/curves.dart';
import 'package:sncf_disconnect/widgets/animated_svg/animated_svg_painter.dart';
import 'package:xml/xml.dart' as xml;

class AnimatedSvgPath extends StatefulWidget {
  final String svgAsset;
  final List<PathProps> pathPropsList;
  final Color strokeColor;
  final double strokeWidth;

  const AnimatedSvgPath({
    super.key,
    required this.svgAsset,
    required this.pathPropsList,
    required this.strokeColor,
    required this.strokeWidth,
  });

  @override
  State<AnimatedSvgPath> createState() => _AnimatedSvgPathState();
}

class _AnimatedSvgPathState extends State<AnimatedSvgPath> {
  List<String?> _pathDataList = [];
  final List<Duration> _pathDelays = [];
  final List<GlobalKey<AnimatedSvgPainterState>> _pathKeys = [];

  @override
  void initState() {
    super.initState();
    _loadSvg();
  }

  Future<void> _loadSvg() async {
    final svgString = await DefaultAssetBundle.of(context).loadString(widget.svgAsset);
    final document = xml.XmlDocument.parse(svgString);
    final pathDataList = widget.pathPropsList.map((PathProps pathProps) {
      final pathElement = document.descendants.whereType<xml.XmlElement>().firstWhere((element) {
        _pathDelays.add(pathProps.delay);

        final GlobalKey<AnimatedSvgPainterState> key = GlobalKey();
        _pathKeys.add(key);

        return element.name.local == 'path' && element.getAttribute('class')?.contains(pathProps.className) == true;
      },
        orElse: () => throw Exception('Path with class ${pathProps.className} not found'),
      );
      return pathElement.getAttribute('d');
    }).toList();

    setState(() => _pathDataList = pathDataList);
  }

  @override
  Widget build(BuildContext context) {
    if (_pathDataList.isEmpty) {
      return const SizedBox.shrink();
    } else {
      return Stack(
        children: List.generate(_pathDataList.length, (int i) {
          return AnimatedSvgPainter(
            key: _pathKeys[i],
            pathData: _pathDataList[i]!,
            strokeColor: widget.strokeColor,
            strokeWidth: widget.strokeWidth,
            animationDuration: widget.pathPropsList[i].duration,
            animationCurve: widget.pathPropsList[i].curve,
            animationDelay: widget.pathPropsList[i].delay,
            reverse: widget.pathPropsList[i].reverse,
          );
        }),
      );
    }
  }
}

class PathProps {
  final String className;
  final int _durationMs;
  final int _delayMs;
  final Curve curve;
  final bool reverse;

  PathProps({
    required this.className,
    required int duration,
    int delay = 0,
    this.curve = CurvesExtension.animatedSvgCurve,
    this.reverse = false,
  })  : _durationMs = duration,
        _delayMs = delay;

  Duration get duration => Duration(milliseconds: _durationMs);
  Duration get delay => Duration(milliseconds: _delayMs);
}