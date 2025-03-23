import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdBtns extends StatelessWidget {
  const AdBtns({super.key});

  static const _size = 15.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: SizedBox.square(
            dimension: _size,
            child: Center(
              child: SvgPicture.asset(
                "assets/icons/ad_choices.svg",
                colorFilter: const ColorFilter.mode(Color(0xff00aecd), BlendMode.srcIn),
              ),
            ),
          ),
        ),

        const DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: SizedBox.square(
            dimension: _size,
            child: Center(
              child: Icon(
                Icons.close_sharp,
                color: Color(0xff00aecd),
                size: _size,
              )
            ),
          ),
        )
      ],
    );
  }
}
