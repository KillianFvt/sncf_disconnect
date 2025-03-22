import 'package:flutter/material.dart';
import 'package:sncf_disconnect/constants/colors.dart';

import '../../dynamic_dropdown.dart';
import 'header_icon.dart';

class TrafficInfoNetworkDropdown extends StatelessWidget {
  const TrafficInfoNetworkDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return const DynamicDropdown(
        headerTitle: "Infos trafic et réseaux",
        headerSubtitle: "Perturbations, travaux, plans...",
        isExpanded: false,
        headerIcon: HeaderIcon(
          iconData: IconData(0xE801, fontFamily: "ReworkedIcons"),
          color: sncfLightPink,
          size: 27,
        ),
        isExpandable: false,
        children: [
          SizedBox(height: 20),
          Text("Hello"),
          SizedBox(height: 20),
          Text("World"),
        ]
    );;
  }
}
