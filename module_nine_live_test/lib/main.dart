import 'package:flutter/material.dart';

void main() {
  runApp(const SizeSelectorApp());
}

class SizeSelectorApp extends StatelessWidget {
  const SizeSelectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Size Selector',
      home: SizeSelectorScreen(),
    );
  }
}

class SizeSelectorScreen extends StatefulWidget {
  const SizeSelectorScreen({super.key});

  @override
  _SizeSelectorScreenState createState() => _SizeSelectorScreenState();
}

class _SizeSelectorScreenState extends State<SizeSelectorScreen> {
  String selectedSize = '';
  List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Size Selector'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: sizes.sublist(0, 3).map((size) {
                return _buildSizeButton(size);
              }).toList(),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: sizes.sublist(3).map((size) {
                return _buildSizeButton(size);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSizeButton(String size) {
    return ElevatedButton(
      onPressed: () {
        updateSize(size);
      },
      style: ElevatedButton.styleFrom(
        primary: size == selectedSize ? Colors.orange : Colors.black26,
        padding: const EdgeInsets.all(16),
        fixedSize: const Size(100, 40), // Adjust button size as needed
      ),
      child: Text(
        size,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  void updateSize(String newSize) {
    setState(() {
      if (newSize == selectedSize) {
        // Deselect the size if it's already selected
        selectedSize = '';
      } else {
        // Set the selected size
        selectedSize = newSize;
      }

      // Show a Snackbar with the selected size
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(selectedSize.isNotEmpty
              ? 'Selected Size: $selectedSize'
              : 'Size Deselected'),
        ),
      );
    });
  }
}
