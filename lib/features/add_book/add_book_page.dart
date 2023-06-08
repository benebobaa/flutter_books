import 'package:flutter_glori_new/features/add_book/add_book_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  late AddBookViewModel addBookViewModel;

  final titleController = TextEditingController();
  final authorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    addBookViewModel = Provider.of<AddBookViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: const EdgeInsets.all(24),
          child: ListView(
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
          "ADD BOOKS",
          style: TextStyle(
              fontSize: 80, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Whats the books title ?",
          style: TextStyle(fontSize: 20),
        ),
        TextField(
          controller: titleController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "books title ?",
            hintStyle: const TextStyle(color: Colors.white),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Whos the books writer ?",
          style: TextStyle(fontSize: 20),
        ),
        TextField(
          controller: authorController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "writers name ?",
            hintStyle: const TextStyle(color: Colors.white),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Insert the picture of the books cover",
          style: TextStyle(fontSize: 20),
        ),
        const TextField(
          decoration: InputDecoration(
            enabled: false,
            hintText: "choose picture ",
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () =>
              addBookViewModel.uploadImage(ImageSource.gallery, context),
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            "choose image",
            style: TextStyle(fontSize: 10),
          ),
        ),
        Consumer<AddBookViewModel>(
          builder: (context, value, child) => ElevatedButton(
            onPressed: (value.isLoading)
                ? null
                : () {
                    addBookViewModel.checkUserorSubmit(
                        titleController.text, authorController.text, context);
                  },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: (value.isLoading)
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text(
                    "Add Book",
                    style: TextStyle(fontSize: 20),
                  ),
          ),
        ),
      ],
    );
  }
}
