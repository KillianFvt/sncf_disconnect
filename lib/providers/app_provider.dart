import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AppProvider extends ChangeNotifier {

  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  void setCurrentPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  static AppProvider of(context, {listen = true}) {
    return Provider.of<AppProvider>(context, listen: listen);
  }
}