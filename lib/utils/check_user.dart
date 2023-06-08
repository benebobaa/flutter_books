import 'package:flutter_glori_new/data/local/share_pref.dart';
import 'package:flutter_glori_new/features/add_review/add_review_page.dart';
import 'package:flutter_glori_new/features/login/login_page.dart';
import 'package:flutter/material.dart';

void checkUserAddReviewPage(int id, context) async {
  final sharePref = SharePref();
  final name = await sharePref.readName();
  if (name != null) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddReviewPage(
                  id: id,
                )));
  } else {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPageFirst()));
  }
}
