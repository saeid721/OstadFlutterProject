import 'package:flutter/material.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _productCodeTEController =
      TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleTEController,
              decoration: const InputDecoration(
                label: Text('Title'),
                hintText: 'Enter Product title',
              ),
            ),
            TextFormField(
              controller: _productCodeTEController,
              decoration: const InputDecoration(
                label: Text('Procuct Code'),
                hintText: 'Enter Product Code',
              ),
            ),
            TextFormField(
              controller: _quantityTEController,
              decoration: const InputDecoration(
                label: Text('Quantity'),
                hintText: 'Enter Product Quantity',
              ),
            ),
            TextFormField(
              controller: _priceTEController,
              decoration: const InputDecoration(
                label: Text('Price'),
                hintText: 'Enter Product Price',
              ),
            ),
            TextFormField(
              controller: _totalPriceTEController,
              decoration: const InputDecoration(
                label: Text('Total Price'),
                hintText: 'Enter Product Total Price',
              ),
            ),
            TextFormField(
              controller: _descriptionTEController,
              maxLines: 5,
              decoration: const InputDecoration(
                label: Text('Discription'),
                hintText: 'Enter Product Discription',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {},
                child: const Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleTEController.dispose();
    _productCodeTEController.dispose();
    _quantityTEController.dispose();
    _priceTEController.dispose();
    _totalPriceTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
