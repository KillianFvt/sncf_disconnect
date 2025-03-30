import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sncf_disconnect/constants/colors.dart';
import 'package:sncf_disconnect/providers/trip_search_provider.dart';
import 'package:sncf_disconnect/widgets/trip_search_page/pinned_points_slider.dart';
import 'package:sncf_disconnect/widgets/trip_search_page/trip_search_results.dart';

import '../widgets/trip_search_page/trip_search_input.dart';

class TripSearchPage extends StatelessWidget {
  const TripSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TripSearchProvider>(
      create: (context) => TripSearchProvider(),
      builder: (context, child) {
        return Consumer<TripSearchProvider>(
          builder: (context, tripSearchProvider, child) {
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
                bottom: PreferredSize(
                    preferredSize: Size(MediaQuery.of(context).size.width, 1),
                    child: Opacity(
                      opacity: tripSearchProvider.loading ? 1 : 0,
                      child: LinearProgressIndicator(
                        color: sncfLightBlue,
                        backgroundColor: sncfLightBlue.withValues(alpha: 0.25),
                      ),
                    ),
                ),
              ),

              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TripSearchInput(
                      controller: tripSearchProvider.textController,
                    )
                  ),

                  const SizedBox(height: 16),

                  const PinnedPointsSlider(),

                  const TripSearchResults()
                ],
              ),
            );
          }
        );
      }
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
