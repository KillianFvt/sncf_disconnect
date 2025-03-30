import 'package:flutter/material.dart';
import 'package:sncf_disconnect/constants/colors.dart';

class TripResultCatTxt extends StatelessWidget {
  const TripResultCatTxt(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: sncfGrey,
      ),
    );
  }
}
