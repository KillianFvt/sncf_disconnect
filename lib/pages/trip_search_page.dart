import 'package:flutter/material.dart';
import 'package:sncf_disconnect/constants/colors.dart';
import 'package:sncf_disconnect/widgets/trip_search_page/pinned_points_slider.dart';

import '../widgets/search/trip_search_input.dart';

class TripSearchPage extends StatelessWidget {
  const TripSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sncfDarkBlue,
      appBar: AppBar(
        title: const Text(
            "Rechercher",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
            )
        ),
        leading: const SizedBox.shrink(),
        leadingWidth: 0,
        backgroundColor: sncfDarkBlue,
        elevation: 0,
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Annuler",
              style: TextStyle(
                color: sncfLightBlue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),

      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TripSearchInput()
          ),

          SizedBox(height: 16),

          PinnedPointsSlider(),
        ],
      ),
    );
  }
}

void displayTripSearchPage(BuildContext context) {

  final double topPadding = MediaQuery.of(context).viewPadding.top;

  Scaffold.of(context).showBottomSheet(
    (context) {
      return Padding(
          padding: EdgeInsets.only(top: topPadding),
          child: const TripSearchPage()
      );
    },
    backgroundColor: sncfDarkBlue,
    elevation: 0,
    enableDrag: true,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height,
    ),
  );
}
