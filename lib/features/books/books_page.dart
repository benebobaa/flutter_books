import 'package:flutter_glori_new/features/books/books_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_glori_new/features/books/widgets/book_item.dart';
import 'package:provider/provider.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  late BooksViewModel booksViewModel;

  @override
  void initState() {
    super.initState();
    booksViewModel = Provider.of(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      booksViewModel.getAllBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.teal,
        color: Colors.white,
        displacement: 200,
        strokeWidth: 5,
        onRefresh: () async {
          await booksViewModel.getAllBooks();
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "lukea.",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 55,
                    color: Colors.white),
              ),
              Text(
                "Let's See The Review",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (value) => booksViewModel.searchBook(value),
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Books Title",
                  suffixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Consumer<BooksViewModel>(
                  builder: (context, value, child) {
                    if (value.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (value.booksSearch.isEmpty) {
                      return const Center(
                        child: Text(
                          'Books Not Found',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: booksViewModel.booksSearch.length,
                        itemBuilder: (context, index) {
                          return BookItem(
                            book: booksViewModel.booksSearch[index],
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
