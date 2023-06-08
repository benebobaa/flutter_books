import 'package:flutter_glori_new/data/api/services.dart';
import 'package:flutter_glori_new/features/books/books_viewmodel.dart';
import 'package:flutter_glori_new/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddReviewViewModel with ChangeNotifier {
  final api = Api();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String pathFile = '';

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> submitReview(
      int id, String name, String rate, String review, context) async {
    try {
      isLoading = true;
      final res =
          await api.postReview(id: id, name: name, rate: rate, review: review);
      isLoading = false;
      if (res.statusCode == 200) {
        snackBar(context, res.data['message']);
        Provider.of<BooksViewModel>(context, listen: false).getAllBooks();
        Navigator.pop(context);
      } else {
        snackBar(context, res.data['message']);
      }
    } catch (e) {
      isLoading = false;
      snackBar(context, e.toString());
    }
  }
}
