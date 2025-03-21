import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class HeaderIcon extends StatelessWidget {
  const HeaderIcon({
    super.key,
    required this.iconData,
    required this.color,
  });

  final IconData iconData;
  final Color color;

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
          size: 37,
        ),
      ),
    );
  }
}
