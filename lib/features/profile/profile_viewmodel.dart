import 'package:flutter_glori_new/data/local/share_pref.dart';
import 'package:flutter_glori_new/features/login/login_page.dart';
import 'package:flutter_glori_new/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class ProfileViewModel with ChangeNotifier {
  String username = '';

  final sharePref = SharePref();

  Future<void> getUsername() async {
    final name = await sharePref.readName();
    username = name ?? 'user';
    notifyListeners();
  }

  Future<void> logout(context) async {
    await sharePref.deleteName();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const SplashPage()),
        (route) => false);
  }
}
