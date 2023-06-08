import 'package:flutter_glori_new/features/add_review/add_review_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddReviewPage extends StatelessWidget {
  final int id;
  final nameController = TextEditingController();
  final rateController = TextEditingController();
  final reviewController = TextEditingController();

   AddReviewPage({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: const [
        Text(
          "ADD REVIEWS",
          style: TextStyle(
              fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: nameController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "What’s your name ?",
            hintStyle: const TextStyle(color: Colors.white),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: rateController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Rates the book (on a scale 0-5) ",
            hintStyle: const TextStyle(color: Colors.white),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: reviewController,
          style: const TextStyle(color: Colors.white),
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "Add review of the books down below",
            hintStyle: const TextStyle(color: Colors.white),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
          ),
        ),
        const SizedBox(height: 10),
        Consumer<AddReviewViewModel>(
          builder: (context, value, child) => ElevatedButton(
            onPressed: (value.isLoading)
                ? null
                : () => value.submitReview(id,nameController.text,
                    rateController.text, reviewController.text, context),
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 140),
                backgroundColor: const Color(0xFFE69316)),
            child: (value.isLoading)
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text(
                    "Submit Review",
                    style: TextStyle(fontSize: 20),
                  ),
          ),
        )
      ],
    );
  }
}
