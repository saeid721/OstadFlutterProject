import 'package:dart_bangla/model/dart_book.dart';
import 'package:dart_bangla/screen/chapter_list_details.dart';
import 'package:flutter/material.dart';

class ChapterListScreen extends StatefulWidget {
  const ChapterListScreen({super.key, required this.title});

  final String title;

  @override
  State<ChapterListScreen> createState() => _ChapterListScreenState();
}

class _ChapterListScreenState extends State<ChapterListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: chaptarList.length,
            itemBuilder: (context, index) {
              DartBook dartBook = chaptarList[index];
              return Card(
                child: ListTile(
                  title: Text(dartBook.title),
                  trailing: const Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChapterDetailsScreen(dartBook)));
                  },
                ),
              );
            }) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
