import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sncf_disconnect/providers/trip_search_provider.dart';
import 'package:sncf_disconnect/widgets/trip_search_page/trip_result_cat_txt.dart';
import 'package:sncf_disconnect/widgets/trip_search_page/trip_result_item.dart';

import '../../data/place.dart';

class TripSearchResults extends StatefulWidget {
  const TripSearchResults({super.key});

  @override
  State<TripSearchResults> createState() => _TripSearchResultsState();
}


class _TripSearchResultsState extends State<TripSearchResults> {

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Consumer<TripSearchProvider>(
        builder: (context, tripSearchProvider, child) {

          List<Widget> citiesAndStations = [];
          List<Widget> addresses = [];
          List<Widget> pois = [];
          for (final Place place in tripSearchProvider.searchResults) {
            if (place.type == PlaceType.city) {
              citiesAndStations.add(TripResultItem.city(title: place.city, details: place.region));
            } else if (place.type == PlaceType.metro_station) {
              citiesAndStations.add(TripResultItem.metro(title: "Random Metro", details: place.city));
            } else if (place.type == PlaceType.tram_station) {
              citiesAndStations.add(TripResultItem.tram(title: "Random Tram", details: place.city));
            } else if (place.type == PlaceType.train_station) {
              citiesAndStations.add(TripResultItem.station(title: place.name ?? place.city, details: place.region));
            } else if (place.type == PlaceType.point_of_interest) {
              pois.add(TripResultItem.poi(title: "${place.name ?? "Random point d'intérêt"}, ${place.city}"));
            } else {
              addresses.add(TripResultItem.address(title: "${place.name ?? "Random adresse"}, ${place.city}"));
            }
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (citiesAndStations.isNotEmpty) const TripResultCatTxt("Villes, Gares et Stations"),

                  ...citiesAndStations,
                  if (addresses.isNotEmpty) const TripResultCatTxt("Adresses"),
                  ...addresses,

                  if (pois.isNotEmpty) const TripResultCatTxt("Points d'intérêt"),
                  ...pois,
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
