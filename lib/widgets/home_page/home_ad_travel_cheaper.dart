import 'package:flutter/material.dart';
import 'package:sncf_disconnect/constants/constants.dart';
import 'package:sncf_disconnect/widgets/misc/ad_btns.dart';

import '../../constants/colors.dart';

class HomeAdTravelCheaper extends StatelessWidget {
  const HomeAdTravelCheaper({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: sncfDarkGreyBlue,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/calanques-marseilles.jpg",
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ouverture des ventes été",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 3,),

                        Text(
                          "Les meilleures offres vers la France et l'Europe sont disponibles !",
                          style: TextStyle(
                            color: sncfGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Positioned(
              top: 0,
              right: 0,
              child: AdBtns(),
            )
          ],
        ),
      ),
    );
  }
}
