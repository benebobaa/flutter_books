import 'package:flutter_glori_new/data/api/services.dart';
import 'package:flutter_glori_new/data/local/share_pref.dart';
import 'package:flutter_glori_new/features/login/login_page.dart';
import 'package:flutter_glori_new/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddBookViewModel with ChangeNotifier {
  final api = Api();
  final sharePref = SharePref();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String pathFile = '';

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> checkUserorSubmit(String title, String author, context) async {
    final name = await sharePref.readName();
    if (name != null) {
      try {
        isLoading = true;
        final res = await api.postBook(
          title: title,
          author: author,
          filePath: pathFile,
        );
        snackBar(context, res.data['message']);
        isLoading = false;
        pathFile = '';
      } catch (e) {
        snackBar(context, 'Foto belum dipilih');
        pathFile = '';
        isLoading = false;
      }
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPageFirst()));
    }
  }

  Future<void> uploadImage(ImageSource imageSource, context) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile == null) return;
    pathFile = pickedFile.path;
  }
}
