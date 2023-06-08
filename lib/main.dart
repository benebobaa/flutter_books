import 'package:flutter_glori_new/features/add_book/add_book_viewmodel.dart';
import 'package:flutter_glori_new/features/add_review/add_review_viewmodel.dart';
import 'package:flutter_glori_new/features/login/login_viewmodel.dart';
import 'package:flutter_glori_new/features/profile/profile_viewmodel.dart';
import 'package:flutter_glori_new/features/register/register_viewmodel.dart';
import 'package:flutter_glori_new/features/books/books_viewmodel.dart';
import 'package:flutter_glori_new/features/splash/splash_page.dart';
import 'package:flutter_glori_new/features/splash/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => RegisterViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => SplashViewModel(),
    ),
    ChangeNotifierProvider( 
      create: (_) => ProfileViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => BooksViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => AddBookViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => AddReviewViewModel(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 247, 244, 237),
      ),
      home: const SplashPage(),
    );
  }
}
