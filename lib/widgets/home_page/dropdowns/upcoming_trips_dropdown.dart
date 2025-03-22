import 'package:flutter/material.dart';
import 'package:sncf_disconnect/constants/colors.dart';

import '../../dynamic_dropdown.dart';
import 'header_icon.dart';

class UpcomingTripsDropdown extends StatelessWidget {
  const UpcomingTripsDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return const DynamicDropdown(
        headerTitle: "Vos itinéraires",
        headerSubtitle: "Fréquents, ponctuels...",
        width: double.infinity,
        isExpanded: false,
        headerIcon: HeaderIcon(
          iconData: IconData(0xF118, fontFamily: "Mobility"),
          color: sncfTurquoise,
        ),
        children: [
          SizedBox(height: 20),
          Text("Hello"),
          SizedBox(height: 20),
          Text("World"),
        ]
    );;
  }
}
