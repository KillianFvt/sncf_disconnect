import 'package:flutter/material.dart';
import 'package:sncf_disconnect/constants/colors.dart';

class TripResultCatTxt extends StatelessWidget {
  const TripResultCatTxt(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 5),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: sncfGrey,
        ),
      ),
    );
  }
}
