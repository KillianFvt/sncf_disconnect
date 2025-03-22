
import 'package:flutter/material.dart';
import 'package:sncf_disconnect/constants/colors.dart';
import 'package:sncf_disconnect/widgets/home_page/dropdowns/dynamic_dropdown_header.dart';

class DynamicDropdown extends StatefulWidget {
  final String headerTitle;
  final String headerSubtitle;
  final double headerHeight;
  final double width;
  final List<Widget> children;
  final bool isExpanded;
  final bool isExpandable;
  final double radius;
  final Widget headerIcon;

  const DynamicDropdown({
    super.key,
    required this.headerTitle,
    required this.headerSubtitle,
    this.headerHeight = 70,
    this.width = double.infinity,
    required this.children,
    required this.isExpanded,
    this.isExpandable = true,
    required this.headerIcon,
    this.radius = 15,
  });

  @override
  State<DynamicDropdown> createState() => _DynamicDropdownState();
}

class _DynamicDropdownState extends State<DynamicDropdown> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 250),
  );

  late final CurvedAnimation _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );


  late bool isExpanded = widget.isExpanded;

  @override
  void initState() {
    super.initState();
    if (isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
      if (isExpanded) {
        _controller.forward(); // Expand the widget
      } else {
        _controller.reverse(); // Collapse the widget
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: sncfDarkGreyBlue,
              borderRadius: BorderRadius.circular(widget.radius),
              border: Border.all(
                color: sncfDarkGreyBlue,
                width: 1,
              ),
            ),
            child: SizedBox(
              width: widget.width,
              child: Column(
                children: [
                  DynamicDropdownHeader(
                      headerTitle: widget.headerTitle,
                      headerSubtitle: widget.headerSubtitle,
                      headerHeight: widget.headerHeight,
                      headerIcon: widget.headerIcon,
                      radius: widget.radius,
                      animation: _animation,
                      toggleExpand: toggleExpand,
                      isExpandable: widget.isExpandable,
                  ),

                  if (widget.isExpandable) ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(widget.radius),
                    ),
                    child: Align(
                      heightFactor: _animation.value,
                      child: AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Column(
                              children: [
                                const Divider(
                                  color: sncfDarkBlue,
                                  thickness: 3,
                                  height: 3,
                                ),

                                ...widget.children,
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}