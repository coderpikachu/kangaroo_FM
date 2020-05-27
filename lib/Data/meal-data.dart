import 'package:flutter/material.dart';
import '../Model/meal.dart';

class MealData extends ChangeNotifier {
  Map<String, Meal> _mIdToMeal = {};
  Map<String, int> _mIdCount = {};

  Map<String, Meal> get mIdToMeal {
    return _mIdToMeal;
  }

  Map<String, int> get mIdCount {
    return _mIdCount;
  }

  void getMIdToMeal(List<Meal> mealsList) {
    mealsList.forEach(
      (e) {
        _mIdToMeal[e.mId] = e;
      },
    );
    notifyListeners();
  }

  void changeMIdCount(String mId, int count) {
    if (_mIdCount.containsKey(mId)) {
      if (count > 0) {
        _mIdCount[mId] += 1;
      } else {
        _mIdCount[mId] -= 1;
        if (_mIdCount[mId] == 0) {
          _mIdCount.remove(mId);
        }
      }
    } else {
      if (count > 0) {
        _mIdCount[mId] = 1;
      }
    }
    notifyListeners();
  }
}
