import 'package:flutter_glori_new/data/local/share_pref.dart';
import 'package:flutter_glori_new/features/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashViewModel with ChangeNotifier {
  final sharePref = SharePref();

  bool _isLogin = false;
  bool get isLogin => _isLogin;

  set isLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  Future<void> checkUser(context) async {
    final name = await sharePref.readName();
    if (name != null) {
      
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPageFirst()));
    }
  }
}
