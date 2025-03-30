import 'package:flutter/material.dart';
import 'package:sncf_disconnect/widgets/trip_search_page/trip_result_cat_txt.dart';
import 'package:sncf_disconnect/widgets/trip_search_page/trip_result_item.dart';

class TripSearchResults extends StatefulWidget {
  const TripSearchResults({super.key});

  @override
  State<TripSearchResults> createState() => _TripSearchResultsState();
}

class _TripSearchResultsState extends State<TripSearchResults> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TripResultCatTxt("Villes, Gares et Stations"),
            TripResultItem.station(title: "Toulon", details: "Provence-Alpes-Côte d'Azur"),
            TripResultItem.metro(title: "Bastille"),
            TripResultItem.tram(title: "Nationale", details: "Tours"),
            TripResultItem.poi(title: "Tour Eiffel"),
            TripResultItem.address(title: "Place de la Bastille"),
            TripResultItem.city(title: "Tours"),
            const TripResultCatTxt("Adresses"),
            const TripResultCatTxt("Points d'intérêt"),
          ],
        ),
      ),
    );
  }
}
