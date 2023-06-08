// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_glori_new/features/reviews_list/review_list_page.dart';
import 'package:flutter_glori_new/utils/check_user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_glori_new/features/books/model/books_model.dart';

class BookItem extends StatelessWidget {
  final Book book;
  const BookItem({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
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
                  book.imageUrl ??
                      'https://i.pinimg.com/564x/72/e9/e9/72e9e94ae829ebda6ff4f25724b45311.jpg',
                  width: 150,
                  height: 100,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title ?? '',
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
                      book.author ?? '',
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          height: 1,
                          fontSize: 13.5),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReviewListPage(
                                        book: book,
                                        review: book.reviews ?? [],
                                      )));
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xFFE69316),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text('Read Reviews'),
                      ),
                      IconButton(
                          onPressed: () {
                            checkUserAddReviewPage(book.id ?? 0, context);
                          },
                          icon: const Icon(
                            size: 33,
                            Icons.add_box_rounded,
                            color: Colors.black54,
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
