import 'package:flutter/cupertino.dart';

import '../data/place.dart';

class TripSearchProvider extends ChangeNotifier {
  bool _loading = false;
  final TextEditingController _textController = TextEditingController();
  final List<Place> _searchResults = [];

  bool get loading => _loading;
  TextEditingController get textController => _textController;
  List<Place> get searchResults => _searchResults;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void search(BuildContext context, String query) async {

    if (query.trim().isEmpty) {
      _searchResults.clear();
      return;
    }

    loading = true;
    await Future.delayed(const Duration(seconds: 1), () async {

      if (context.mounted) {
        List<Place> data = await Place.readJsonData(context, "assets/fake_data/fake_sncf_data.json");
        _searchResults.clear();
        for (final Place place in data) {
          if (place.name != null && place.name!.toLowerCase().contains(query.toLowerCase())) {
            _searchResults.add(place);
          } else if (place.city.toLowerCase().contains(query.toLowerCase())) {
            _searchResults.add(place);
          } else if (place.region.toLowerCase().contains(query.toLowerCase())) {
            _searchResults.add(place);
          }
        }
      }
      loading = false;
    });
  }
}