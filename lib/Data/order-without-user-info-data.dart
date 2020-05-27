import 'package:flutter/cupertino.dart';
import 'package:mysqltest/Model/meal.dart';

class OrderWithoutUserInfoData extends ChangeNotifier {
  List<Map<String, int>> _orderWithoutUserInfo = [];

  List<Map<String, int>> get orderWithoutUserInfo {
    return _orderWithoutUserInfo;
  }

  void addOrderWithoutUserInfo(Map<String, int> mIdCount) {
    _orderWithoutUserInfo.add(mIdCount);

    notifyListeners();
  }

  void removeOrderWithoutUserInfo(Map<String, int> mIdCount) {
    _orderWithoutUserInfo.remove(mIdCount);
    notifyListeners();
  }
}
