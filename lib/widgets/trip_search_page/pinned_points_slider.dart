import 'package:flutter/material.dart';
import 'package:sncf_disconnect/constants/colors.dart';
import 'package:sncf_disconnect/constants/constants.dart';

class PinnedPointsSlider extends StatelessWidget {
  const PinnedPointsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [

          SizedBox(width: 11.0),

          PinnedPointPlaceholder(
            placeholderText: "Maison",
          ),

          PinnedPointPlaceholder(
            placeholderText: "Travail",
          ),

          PinnedPointPlaceholder(),

          SizedBox(width: 11.0),
        ],
      ),
    );
  }
}

class PinnedPointPlaceholder extends StatelessWidget {
  const PinnedPointPlaceholder({
    super.key,
    this.placeholderText = "Autre",
  });

  final String placeholderText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2 - 22,
        child: MaterialButton(
          onPressed: () {},
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          color: sncfDarkGreyBlue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kBorderRadius)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Ajouter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),

                  Text(
                    placeholderText,
                    style: const TextStyle(
                      color: sncfGrey,
                      fontSize: 14,
                    ),
                  )
                ],
              ),

              const Icon(
                Icons.add_circle_rounded,
                color: sncfLightBlue,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
