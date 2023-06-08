// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_glori_new/features/books/model/books_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_glori_new/features/books/model/review_model.dart';
import 'package:flutter_glori_new/features/reviews_list/widgets/review_item.dart';

class ReviewListPage extends StatefulWidget {
  final Book book;
  final List<Review> review;
  const ReviewListPage({
    Key? key,
    required this.book,
    required this.review,
  }) : super(key: key);

  @override
  State<ReviewListPage> createState() => _ReviewListPageState();
}

class _ReviewListPageState extends State<ReviewListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 1))
                ],
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image.network(
                      widget.book.imageUrl ??
                          'https://i.pinimg.com/564x/72/e9/e9/72e9e94ae829ebda6ff4f25724b45311.jpg',
                      width: 150,
                      height: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        Text(
                          widget.book.title ?? '',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: const Color(0xFFE69316)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 180,
                          height: 50,
                          child: Text(
                            widget.book.author ?? '',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w600,
                                height: 1,
                                fontSize: 13.5),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: (widget.review.isEmpty)
                  ? const Center(
                      child: Text(
                        'No Reviews',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  : ListView.builder(
                      itemCount: widget.review.length,
                      itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(15),
                          child: ReviewItem(
                            review: widget.review[index],
                          ))),
            )
          ],
        ),
      ),
    );
  }
}
