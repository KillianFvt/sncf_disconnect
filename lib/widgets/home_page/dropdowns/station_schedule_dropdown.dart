import 'package:flutter/material.dart';
import 'package:sncf_disconnect/widgets/dynamic_dropdown.dart';

import '../../../constants/colors.dart';
import 'header_icon.dart';

class StationScheduleDropdown extends StatefulWidget {
  const StationScheduleDropdown({super.key});

  @override
  State<StationScheduleDropdown> createState() => _StationScheduleDropdownState();
}

class _StationScheduleDropdownState extends State<StationScheduleDropdown> {
  @override
  Widget build(BuildContext context) {
    return const DynamicDropdown(
        headerTitle: "Horaires en gare",
        headerSubtitle: "Tableaux des départs et arrivées.",
        headerHeight: 70,
        width: double.infinity,
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
