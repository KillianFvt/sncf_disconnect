import 'package:flutter/material.dart';
import 'package:sncf_disconnect/widgets/dynamic_dropdown.dart';

import '../../../constants/colors.dart';
import 'header_icon.dart';

class StationScheduleDropdown extends StatelessWidget {
  const StationScheduleDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return const DynamicDropdown(
        headerTitle: "Horaires en gare",
        headerSubtitle: "Tableaux des départs et arrivées.",
        isExpanded: false,
        headerIcon: HeaderIcon(
          iconData: IconData(0xF115, fontFamily: "Mobility"),
          color: sncfLightPurple,
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
