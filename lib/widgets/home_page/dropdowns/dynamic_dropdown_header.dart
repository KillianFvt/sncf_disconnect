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
  });

  final String headerTitle, headerSubtitle;
  final double headerHeight, radius;
  final Widget headerIcon;
  final Animation animation;
  final void Function() toggleExpand;

  @override
  State<DynamicDropdownHeader> createState() => _DynamicDropdownHeaderState();
}

class _DynamicDropdownHeaderState extends State<DynamicDropdownHeader> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(widget.radius),
          bottom: Radius.circular((1-widget.animation.value) * widget.radius),
        ),
        color: sncfDarkGreyBlue,
      ),
      child: InkWell(
        // TODO fix ink, it is displayed behind
        onTap: () {},
        child: SizedBox(
          height: widget.headerHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
                child: SizedBox.square(
                  dimension: widget.headerHeight * 0.8,
                  child: widget.headerIcon,
                ),
              ),
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
              Transform.rotate(
                  angle: (widget.animation.value) * (-pi),
                  child: IconButton(
                    onPressed: widget.toggleExpand,
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
      ),
    );
  }
}
