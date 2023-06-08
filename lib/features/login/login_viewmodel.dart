import 'package:flutter_glori_new/data/api/services.dart';
import 'package:flutter_glori_new/data/local/share_pref.dart';
import 'package:flutter_glori_new/utils/snackbar.dart';
import 'package:flutter_glori_new/features/nav_bar/nav_bar_page.dart';
import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  final api = Api();
  final sharePref = SharePref();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isVisible = true;
  bool get isVisible => _isVisible;

  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login(context, String username, String password) async {
    final response =
        await api.postLogin(username: username, password: password);
    snackBar(context, response.data['message']);

    isLoading = false;
    if (response.statusCode == 200) {
      await sharePref.saveName(name: username);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => NavBar()), (route) => false);
    }
  }
}
