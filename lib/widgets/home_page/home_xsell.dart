import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sncf_disconnect/constants/colors.dart';
import 'package:sncf_disconnect/constants/constants.dart';

class HomeXsell extends StatelessWidget {
  const HomeXsell({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},

      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kBorderRadius)),
      splashColor: sncfBlue.withValues(alpha: 0.25),
      highlightColor: sncfBlue.withValues(alpha: 0.25),
      elevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      color: sncfDarkGreyBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 70,
            child: SvgPicture.asset(
              "assets/illustrations/home_xsell_icon.svg",
              fit: BoxFit.fitWidth,
              colorFilter: const ColorFilter.mode(sncfIllustrationBlue, BlendMode.srcIn),
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 12.0, 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Bien plus que du train !",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),

                    Text(
                      "Voiture de location, hôtels...",
                      style: TextStyle(
                        color: sncfGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),

                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: sncfLightBlue,
                  size: 28,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
