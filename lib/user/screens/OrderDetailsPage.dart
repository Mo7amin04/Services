import 'package:flutter/material.dart';
import 'package:services/helper/constants.dart';

class OrderDetailsPage extends StatelessWidget {
  final Order order;

  OrderDetailsPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(order.imageUrl),
            SizedBox(height: 16),
            Text(
              order.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              order.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}