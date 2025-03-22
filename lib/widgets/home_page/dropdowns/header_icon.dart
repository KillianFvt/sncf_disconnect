import 'package:flutter/material.dart';


class HeaderIcon extends StatelessWidget {
  const HeaderIcon({
    super.key,
    required this.iconData,
    required this.color,
    this.size = 37,
  });

  final IconData iconData;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox.square(
        child: Icon(
          iconData,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
