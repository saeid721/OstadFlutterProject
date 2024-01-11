import 'package:crafty_bay/widgets/product_card_item.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.builder(
            itemCount: 40,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.90,
                mainAxisSpacing: 8,
                crossAxisSpacing: 4),
            itemBuilder: (context, index) {
              return const FittedBox(child: ProductCardItem());
            }),
      ),
    );
  }
}
