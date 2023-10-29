import 'package:flutter/material.dart';
import 'package:module_eleven_class/screens/add_new_product_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Selcect Action'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text('Edit'),
                      leading: Icon(Icons.edit),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddNewProductScreen(),
                          ),
                        );
                      },
                    ),
                    Divider(
                      height: 0,
                    ),
                    ListTile(
                      title: Text('Delete'),
                      leading: Icon(Icons.delete_outline_outlined),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              );
            });
      },
      leading: Image.network(
          'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-math-90946.jpg&fm=jpg'),
      title: const Text('Product Name'),
      subtitle: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Product Coade'),
              SizedBox(
                width: 24,
              ),
              Text('Total Price'),
            ],
          ),
          Text('Product Discription'),
        ],
      ),
      trailing: Text('\$120'),
    );
  }
}
