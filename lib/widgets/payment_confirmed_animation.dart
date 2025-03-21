import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'animated_svg/animated_svg.dart';

class PaymentConfirmedAnimation extends StatelessWidget {
  const PaymentConfirmedAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      alignment: Alignment.centerRight,
      scale: 1.25,
      child: AnimatedSvgPath(
        svgAsset: "assets/illustrations/confirmed.svg",
        pathPropsList: [
          PathProps(
            className: "animated-confirm-loop",
            duration: 3000,
          ),
          PathProps(
            className: "animated-confirm-check",
            duration: 1500, delay: 1500,
            curve: Curves.easeOut,
            reverse: true,
          )
        ],
        strokeColor: sncfLightBlue,
        strokeWidth: 2,
      ),
    );
  }
}
