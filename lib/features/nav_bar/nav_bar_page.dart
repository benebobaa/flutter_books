import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_glori_new/features/add_book/add_book_page.dart';
import 'package:flutter_glori_new/features/books/books_page.dart';
import 'package:flutter_glori_new/features/profile/profile_page.dart';

class NavBar extends StatefulWidget {
  int currentIndex = 1;
  List pages = [const AddBookPage(), const BooksPage(), const ProfilePage()];

  NavBar({super.key});

  @override
  State<NavBar> createState() => _NavbarState();
}

class _NavbarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.pages[widget.currentIndex],
        bottomNavigationBar: GNav(
            backgroundColor: Colors.black,
            gap: 8,
            haptic: true,
            color: Colors.white,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.white,
            padding: const EdgeInsets.all(16),
            onTabChange: (index) {
              setState(() {
                widget.currentIndex = index;
              });
            },
            selectedIndex: 1,
            tabs: const [
              GButton(
                icon: Icons.add,
                text: 'Add Books',
              ),
              GButton(
                icon: Icons.search,
                text: 'Books Review',
              ),
              GButton(
                icon: Icons.people,
                text: 'Profile',
              )
            ]));
  }
}
