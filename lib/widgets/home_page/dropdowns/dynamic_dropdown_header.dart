import 'dart:math';

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class DynamicDropdownHeader extends StatefulWidget {
  const DynamicDropdownHeader({
    super.key,
    required this.headerTitle,
    required this.headerSubtitle,
    required this.headerHeight,
    required this.headerIcon,
    required this.radius,
    required this.animation,
    required this.toggleExpand,
    this.onPressed,
    this.isExpandable = true,
  });

  final String headerTitle, headerSubtitle;
  final double headerHeight, radius;
  final Widget headerIcon;
  final Animation animation;
  final void Function() toggleExpand;
  final void Function()? onPressed;
  final bool isExpandable;

  @override
  State<DynamicDropdownHeader> createState() => _DynamicDropdownHeaderState();
}

class _DynamicDropdownHeaderState extends State<DynamicDropdownHeader> {
  @override
  Widget build(BuildContext context) {

    final Radius topRadius = Radius.circular(widget.radius);
    final Radius bottomRadius = Radius.circular((1-widget.animation.value) * widget.radius);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: topRadius,
          bottom: bottomRadius,
        ),
        color: sncfDarkGreyBlue,
      ),
      child: SizedBox(
        height: widget.headerHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: MaterialButton(
                onPressed: () => widget.onPressed,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: topRadius,
                    bottomLeft: bottomRadius,
                  ),
                ),
                padding: EdgeInsets.zero,
                elevation: 0,
                highlightElevation: 0,
                hoverElevation: 0,
                splashColor: sncfLightBlue.withValues(alpha: 0.25),
                highlightColor: sncfLightBlue.withValues(alpha: 0.25),
                colorBrightness: Brightness.dark,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
                      child: SizedBox.square(
                        dimension: widget.headerHeight * 0.8,
                        child: widget.headerIcon,
                      ),
                    ),

                    const SizedBox(width: 8.0),

                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.headerTitle,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),

                          Text(
                            widget.headerSubtitle,
                            style: const TextStyle(
                              color: sncfGrey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Transform.rotate(
                angle: widget.isExpandable ? widget.animation.value * pi : -pi/2,
                child: IconButton(
                  onPressed: widget.isExpandable ? widget.toggleExpand : widget.onPressed,
                  padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: sncfLightBlue,
                    size: 28,
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
