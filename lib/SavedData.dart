
import 'package:flutter/foundation.dart';

class SavedData extends ChangeNotifier {
  List<Map<String, String>> _data = [];

  List<Map<String, String>> get data => _data;

  void addData(Map<String, String> newData) {
    _data.add(newData);
    notifyListeners();
  }

  void removeData(Map<String, String> dataToRemove) {
    _data.remove(dataToRemove);
    notifyListeners();
  }
}

