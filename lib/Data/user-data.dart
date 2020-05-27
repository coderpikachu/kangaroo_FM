import 'package:flutter/material.dart';
import '../Model/user.dart';

class UserData extends ChangeNotifier {
  User _user;
  User get user {
    return _user;
  }

  void getUser(User user) {
    _user = user;
    notifyListeners();
  }
}
