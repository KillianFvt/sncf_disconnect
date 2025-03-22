import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../dynamic_dropdown.dart';
import 'header_icon.dart';

class ItineraryDropdown extends StatelessWidget {
  const ItineraryDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return const DynamicDropdown(
        headerTitle: "Vos itinéraires",
        headerSubtitle: "Fréquents, ponctuels...",
        isExpanded: false,
        headerIcon: HeaderIcon(
          iconData: IconData(0xE800, fontFamily: "ReworkedIcons"),
          color: sncfYellow,
          size: 22,
        ),
        children: [
          SizedBox(height: 20),
          Text("Hello"),
          SizedBox(height: 20),
          Text("World"),
        ]
    );
  }
}
