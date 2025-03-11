import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppbarItemText extends StatefulWidget {
  const AppbarItemText(this.text, {super.key, this.isActive = false});

  final bool isActive;
  final String text;

  @override
  State<AppbarItemText> createState() => _AppbarItemTextState();
}

class _AppbarItemTextState extends State<AppbarItemText> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 100));

  @override void didUpdateWidget(covariant AppbarItemText oldWidget) {
    if (oldWidget.isActive != widget.isActive) {
      widget.isActive ? _controller.forward() : _controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
        widget.text,
        style: TextStyle(
            color: Color.lerp(sncfAWhite, sncfLightBlue, _controller.value),
            fontSize: 12,
            fontWeight: FontWeight.w500
        )
    );
  }
}
