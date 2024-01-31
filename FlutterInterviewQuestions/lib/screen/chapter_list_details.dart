import 'package:dart_bangla/model/dart_book.dart';
import 'package:flutter/material.dart';

class ChapterDetailsScreen extends StatelessWidget {
  final DartBook dartBook;

  const ChapterDetailsScreen(this.dartBook, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dartBook.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  dartBook.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  dartBook.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.normal),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
