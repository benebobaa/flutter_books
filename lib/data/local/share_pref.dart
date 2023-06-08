import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  static const String _name = 'name!';
  String? name;

  Future<void> saveName({required String name}) async {
    final sharePref = await SharedPreferences.getInstance();
    await sharePref.setString(_name, name);
  }

  Future<String?> readName() async {
    final sharePref = await SharedPreferences.getInstance();
    final name = sharePref.getString(_name);
    return name;
  }

  Future<void> deleteName() async {
    final sharePref = await SharedPreferences.getInstance();
    await sharePref.remove(_name);
  }
}
