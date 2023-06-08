// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_glori_new/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:flutter_glori_new/features/profile/profile_viewmodel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileViewModel profileViewModel;

  @override
  void initState() {
    super.initState();
    profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);
    profileViewModel.getUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFE69316),
            ),
            const SizedBox(
              height: 30,
            ),
            Consumer<ProfileViewModel>(
              builder: (context, value, child) => Text(value.username,
                  style: GoogleFonts.inter(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Color(0xFFE69316),
              ),
            ),
            InfoCard(text: 'Name', icon: Icons.edit, onPressed: () async {}),
            // InfoCard(
            //   text: 'Email',
            //   icon: Icons.email,
            //   onPressed: () async {},
            // ),
            InfoCard(
              text: 'Password',
              icon: Icons.password,
              onPressed: () {},
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                snackBar(
                    context, 'Edit profile not available yet in this version');
              },
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 125),
                  backgroundColor: const Color(0xFFE69316)),
              child: const Text(
                "Edit Profile",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  profileViewModel.logout(context);
                },
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 140),
                    backgroundColor: const Color(0xFFE69316)),
                child: const Text(
                  "Log Out",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  Function onPressed;

  InfoCard({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: const Color(0xFFE69316),
          ),
          title: Text(
            text,
            style: GoogleFonts.sourceSansPro(
                fontSize: 20, color: const Color(0xFFE69316)),
          ),
        ),
      ),
    );
  }
}
