import 'package:flutter/cupertino.dart';

class TripSearchProvider extends ChangeNotifier {
  bool _loading = false;
  final TextEditingController _textController = TextEditingController();

  bool get loading => _loading;
  TextEditingController get textController => _textController;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }
}