
import 'package:flutter_glori_new/features/books/model/review_model.dart';

class Book {
  String? author;
  int? id;
  String? imageUrl;
  List<Review>? reviews;
  String? title;

  Book({this.author, this.id, this.imageUrl, this.reviews, this.title});

  Book.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    id = json['id'];
    imageUrl = json['image_url'];
    if (json['reviews'] != null) {
      reviews = <Review>[];
      json['reviews'].forEach((v) {
        reviews!.add(Review.fromJson(v));
      });
    }
    title = json['title'];
  }

}
