import 'package:flutter/material.dart';

import '../widgets/profile_summery_card.dart';
import 'service_items_list_details.dart';

class ServiceItemsListScreen extends StatefulWidget {
  const ServiceItemsListScreen({super.key});

  @override
  State<ServiceItemsListScreen> createState() => _ServiceItemsListScreenState();
}

class _ServiceItemsListScreenState extends State<ServiceItemsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummeryCard(),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ServiceItemsList();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
