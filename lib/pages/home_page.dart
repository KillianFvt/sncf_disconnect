import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sncf_disconnect/pages/trip_search_page.dart';
import 'package:sncf_disconnect/widgets/home_page/dropdowns/itinerary_dropdown.dart';
import 'package:sncf_disconnect/widgets/home_page/dropdowns/station_schedule_dropdown.dart';
import 'package:sncf_disconnect/widgets/home_page/dropdowns/traffic_info_network_dropdown.dart';
import 'package:sncf_disconnect/widgets/home_page/dropdowns/upcoming_trips_dropdown.dart';
import 'package:sncf_disconnect/widgets/home_page/home_ad_travel_cheaper.dart';
import 'package:sncf_disconnect/widgets/home_page/home_xsell.dart';
import 'package:sncf_disconnect/widgets/misc/ad_btns.dart';
import 'package:sncf_disconnect/widgets/search/trip_search_input.dart';

import '../constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          SizedBox(
            height: 155,
            child: SvgPicture.asset(
              // TODO this is not the right asset
              "assets/illustrations/train.svg",
              width: MediaQuery.of(context).size.width,
              colorFilter: const ColorFilter.mode(sncfIllustrationBlue, BlendMode.srcIn),
              placeholderBuilder: (context) => const SizedBox(height: 155),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),

                const Text(
                  "Bonjour 👋",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  "Recherchez une destination, un trajet, un numéro de train...",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.1
                  ),
                ),

                const SizedBox(height: 16),

                GestureDetector(
                  onTap: () => displayTripSearchPage(context),
                  child: const AbsorbPointer(
                    absorbing: true,
                    child: TripSearchInput(showMic: false)
                  ),
                ),

                const SizedBox(height: 32),

                const Text(
                  "Simplifiez vos trajets",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.1
                  ),
                ),

                const SizedBox(height: 12),

                const StationScheduleDropdown(),
                const ItineraryDropdown(),
                const TrafficInfoNetworkDropdown(),
                const UpcomingTripsDropdown(),

                const SizedBox(height: 55),

                const HomeXsell(),

                const SizedBox(height: 35),

                const Text(
                  "Voyager moins cher",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 14),

                const HomeAdTravelCheaper(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
