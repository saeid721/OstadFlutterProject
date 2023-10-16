import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ItemListScreen(),
    );
  }
}

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  List<ItemModel> items = [
    ItemModel("Item 1", false),
    ItemModel("Item 2", false),
    ItemModel("Item 3", false),
    ItemModel("Item 4", false),
    ItemModel("Item 5", false),
  ];

  List<ItemModel> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selectable Item List"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),
            tileColor: items[index].isSelected ? Colors.blue : null,
            onTap: () {
              setState(() {
                items[index].isSelected = !items[index].isSelected;
                if (items[index].isSelected) {
                  selectedItems.add(items[index]);
                } else {
                  selectedItems.remove(items[index]);
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showSelectedItemsCountDialog(context);
        },
        child: Icon(Icons.check),
      ),
    );
  }

  void _showSelectedItemsCountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Selected Items"),
          content: Text("Number of selected items: ${selectedItems.length}"),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class ItemModel {
  String name;
  bool isSelected;

  ItemModel(this.name, this.isSelected);
}