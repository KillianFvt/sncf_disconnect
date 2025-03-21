import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sncf_disconnect/extensions/curves.dart';
import 'package:sncf_disconnect/widgets/animated_svg/animated_svg.dart';
import 'package:sncf_disconnect/widgets/dynamic_dropdown.dart';
import 'package:sncf_disconnect/widgets/home_page/dropdowns/station_schedule_dropdown.dart';
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
              colorFilter: const ColorFilter.mode(sncfLightBlue, BlendMode.srcIn),
              placeholderBuilder: (context) => const SizedBox(height: 155),
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),

                Text(
                  "Bonjour 👋",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),

                SizedBox(height: 16),

                Text(
                  "Recherchez une destination, un trajet, un numéro de train...",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.1
                  ),
                ),

                SizedBox(height: 16),


                IgnorePointer(
                  ignoring: false,
                  child: TripSearchInput(showMic: false)
                ),
                
                /*Icon(
                  IconData(0xF115, fontFamily: "Mobility"),
                  color: sncfLightPurple,
                ),

                Icon(
                  IconData(0xF108, fontFamily: "Mobility"),
                  color: sncfYellow,
                ),

                Icon(
                  IconData(0xF14F, fontFamily: "NavigationAndAction"),
                  color: sncfLihgtPink,
                ),

                Icon(
                  IconData(0xF118, fontFamily: "Mobility"),
                  color: sncfTurquoise,
                ),*/

                SizedBox(height: 32),

                Text(
                  "Simplifiez vos trajets",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.1
                  ),
                ),

                SizedBox(height: 16),

                StationScheduleDropdown()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
