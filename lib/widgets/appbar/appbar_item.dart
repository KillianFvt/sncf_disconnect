import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../providers/app_provider.dart';

class AppbarIcon extends StatelessWidget {
  const AppbarIcon({
    super.key,
    required this.svg,
    this.isActive = false,
  });

  final String svg;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: SvgPicture.asset(
        "assets/icons/appbar/${svg + (isActive ? "_selected" : "")}.svg",
        colorFilter: ColorFilter.mode(isActive ? sncfLightBlue : sncfAWhite, BlendMode.srcIn),
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

class AppbarItem extends StatefulWidget {
  const AppbarItem({
    super.key,
    required this.title,
    required this.index,
  });

  final String title;
  final int index;

  @override
  State<AppbarItem> createState() => _AppbarItemState();
}

class _AppbarItemState extends State<AppbarItem> with SingleTickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 100))
    ..addListener(() => setState(() {}));
  late final Animation<double> _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<AppProvider>(
          builder: (context, appProvider, child) {
            bool isActive = widget.index == appProvider.currentPageIndex;

            isActive ? _controller.forward() : _controller.reverse();

            return InkWell(
              onTap:() => appProvider.setCurrentPageIndex(widget.index),
              customBorder: const CircleBorder(),
              child:  Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: 58,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AppbarIcon(
                          svg: widget.title.toLowerCase(),
                          isActive: isActive
                      ),
      
                      const SizedBox(height: 4),
      
                      Expanded(
                        child: IntrinsicWidth(
                          child: Column(
                            children: [
                              Text(
                                  widget.title,
                                  style: TextStyle(
                                      color: Color.lerp(sncfAWhite, sncfLightBlue, _animation.value),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500
                                  )
                              ),
                          
                              const Spacer(),
                          
                              Opacity(
                                opacity: _animation.value,
                                child: const Divider(
                                  color: sncfLightBlue,
                                  thickness: 2,
                                  height: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
