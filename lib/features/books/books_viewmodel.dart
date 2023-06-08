import 'package:flutter_glori_new/data/api/services.dart';
import 'package:flutter_glori_new/features/books/model/books_model.dart';
import 'package:flutter/material.dart';

class BooksViewModel with ChangeNotifier {
  final api = Api();

  List<Book> _books = [];
  List<Book> get books => _books;

  List<Book> _booksSearch = [];
  List<Book> get booksSearch => _booksSearch;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getAllBooks() async {
    isLoading = true;
    final res = await api.getBooks();
    List<Book> listBook = res.data.map<Book>((e) => Book.fromJson(e)).toList();
    _books = listBook;
    _booksSearch = listBook;
    isLoading = false;
    notifyListeners();
  }

  void searchBook(String searchText) {
    List<Book> searchResults = [];

    for (var item in books) {
      if (item.title!.toLowerCase().contains(searchText.toLowerCase())) {
        searchResults.add(item);
      }
    }

    _booksSearch = searchResults;
    notifyListeners();
  }
}
