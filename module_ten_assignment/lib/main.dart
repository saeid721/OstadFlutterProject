import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> itemList = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  void _showAlertDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit or Delete?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _showEditBottomSheet(index);
              },
              child: Text('Edit'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  itemList.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _showEditBottomSheet(int index) {
    titleController.text = itemList[index]['title'].toString();
    subtitleController.text = itemList[index]['subtitle'].toString();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: subtitleController,
                decoration: InputDecoration(labelText: 'Subtitle'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    itemList[index] = {
                      'title': titleController.text,
                      'subtitle': subtitleController.text,
                    };
                  });
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Example'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: subtitleController,
                  decoration: InputDecoration(labelText: 'Subtitle'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      itemList.add({
                        'title': titleController.text,
                        'subtitle': subtitleController.text,
                      });
                      titleController.clear();
                      subtitleController.clear();
                    });
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(itemList[index]['title'].toString()),
                  subtitle: Text(itemList[index]['subtitle'].toString()),
                  onLongPress: () {
                    _showAlertDialog(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
