import 'package:flutter/material.dart';
import 'package:sncf_disconnect/constants/colors.dart';

class TripResultItem extends StatelessWidget {
  const TripResultItem({
    super.key,
    required this.icon,
    required this.type,
    required this.title,
    this.details,
  });

  final IconData icon;
  final String type;
  final String title;
  final String? details;

  factory TripResultItem.city({
    required String title,
    String? details,
  }) {
    return TripResultItem(
      icon: const IconData(0xF103, fontFamily: "Mobility"),
      type: "Ville",
      title: title,
      details: details,
    );
  }

  factory TripResultItem.address({
    required String title,
    String? details,
  }) {
    return TripResultItem(
      icon: const IconData(0xF10A, fontFamily: "Mobility"),
      type: "Adresse",
      title: title,
      details: details,
    );
  }

  factory TripResultItem.tram({
    required String title,
    String? details,
  }) {
    return TripResultItem(
      icon: const IconData(0xF116, fontFamily: "Transports"),
      type: "Tram",
      title: title,
      details: details,
    );
  }

  factory TripResultItem.metro({
    required String title,
    String? details,
  }) {
    return TripResultItem(
      icon: const IconData(0xF10D, fontFamily: "Mobility"),
      type: "Métro",
      title: title,
      details: details,
    );
  }

  factory TripResultItem.poi({
    required String title,
    String? details,
  }) {
    return TripResultItem(
      icon: const IconData(0xF124, fontFamily: "Divers"),
      type: "Point d'intérêt",
      title: title,
      details: details,
    );
  }

  factory TripResultItem.station({
    required String title,
    String? details,
  }) {
    return TripResultItem(
      icon: const IconData(0xF117, fontFamily: "Mobility"),
      type: "Gare",
      title: title,
      details: details,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        minHeight: 60,
      ),
      child: MaterialButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),

              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      type,
                      style: const TextStyle(
                        fontSize: 14,
                        color: sncfGrey
                      ),
                    ),
                
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          if (details != null)
                            TextSpan(
                              text: " ($details)",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: sncfGrey,
                              ),
                            )
                        ],
                        style: const TextStyle(
                          fontFamily: "Avenir",
                          fontSize: 18,
                        )
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}