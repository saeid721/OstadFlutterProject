// Implement similar structures for other screens using dummy data and CustomCard widget.
// You can use ListView.builder for dynamic content.

// Example: services_screen.dart
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/custom_card.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custoemer'),
      ),
      body: ListView.builder(
        itemCount: dummyServices.length,
        itemBuilder: (context, index) {
          final service = dummyServices[index];
          return CustomCard(
            title: service.name,
            subtitle: service.description,
            imageUrl: 'service_image_$index.png',
          );
        },
      ),
    );
  }
}
