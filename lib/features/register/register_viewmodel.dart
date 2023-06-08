import 'package:flutter_glori_new/data/api/services.dart';
import 'package:flutter_glori_new/data/local/share_pref.dart';
import 'package:flutter_glori_new/utils/snackbar.dart';
import 'package:flutter_glori_new/features/nav_bar/nav_bar_page.dart';
import 'package:flutter/material.dart';

class RegisterViewModel with ChangeNotifier {
  final api = Api();
  final sharePref = SharePref();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> register(
      context, String username, String password, String confirmPassword) async {
    final response = await api.postRegister(
        username: username,
        password: password,
        confirmPassword: confirmPassword);
    snackBar(context, response.data['message']);

    isLoading = false;
    if (response.statusCode == 201) {
      await sharePref.saveName(name: username);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NavBar()));
    }
  }
}
