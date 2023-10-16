import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.white)),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController titleCon = TextEditingController();
  TextEditingController descripCon = TextEditingController();

  List<Item> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.search,
              color: Colors.blue,
            ),
          ],
        ),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a text';
                  }
                  return null;
                },
                controller: titleCon,
                decoration: InputDecoration(
                    hintText: 'Add Title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a text';
                  }
                  return null;
                },
                controller: descripCon,
                decoration: InputDecoration(
                    hintText: 'Add Title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Item newitem = Item(titleCon.text, descripCon.text);
                    items.add(newitem);
                    titleCon.clear();
                    descripCon.clear();
                    setState(() {});
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(90, 40)),
                child: const Text(
                  'Add',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.separated(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return buildAlertDialog(context, index);
                        });
                  },
                  tileColor: const Color(0xFFe0e0e0),
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text('${items[index].title}'),
                  subtitle: Text('${items[index].descrip}'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 5,
                );
              },
            )),
          ],
        ),
      ),
    );
  }

  AlertDialog buildAlertDialog(BuildContext context, int index) {
    return AlertDialog(
      title: const Text('Alert'),
      actions: [
        Column(
          children: [
            SizedBox(
              height: 65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      controller: titleCon
                                        ..text = items[index].title,
                                      decoration: InputDecoration(
                                          hintText: '',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, left: 8, right: 8),
                                    child: TextFormField(
                                      controller: descripCon
                                        ..text = items[index].descrip,
                                      decoration: InputDecoration(
                                          hintText: '',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        int itemNumber =
                                            items.indexOf(items[index]);
                                        if (itemNumber != -1) {
                                          items[index] = Item(
                                              titleCon.text, descripCon.text);

                                          titleCon.clear();
                                          descripCon.clear();

                                          Navigator.of(context).pop();

                                          setState(() {});
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          minimumSize: const Size(90, 40)),
                                      child: const Text(
                                        'Edit Done',
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: const Text(
                        'Edit',
                        style: TextStyle(color: Colors.red),
                      )),
                  GestureDetector(
                    onTap: () {
                      items.removeAt(index);
                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Item {
  String title;
  String descrip;
  Item(this.title, this.descrip);
}
