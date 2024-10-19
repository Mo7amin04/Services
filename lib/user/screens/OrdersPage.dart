import 'package:flutter/material.dart';

import '../../helper/constants.dart';
import 'OrderDetailsPage.dart';

class OrdersPage extends StatelessWidget {
  // قائمة من الطلبات كمثال
  final List<Order> orders = [
    Order(
      title: 'طلب 1',
      imageUrl: 'https://via.placeholder.com/150',
      description: 'هذا هو وصف الطلب 1',
    ),
    Order(
      title: 'طلب 2',
      imageUrl: 'https://via.placeholder.com/150',
      description: 'هذا هو وصف الطلب 2',
    ),
    Order(
      title: 'طلب 3',
      imageUrl: 'https://via.placeholder.com/150',
      description: 'هذا هو وصف الطلب 3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Image.network(
                loadingBuilder: (context, error, stackTrace) {
                  return CircularProgressIndicator();
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 50,
                    height: 50,
                  );
                },
                order.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(order.title),
              onTap: () {
                // الانتقال إلى صفحة تفاصيل الطلب عند النقر
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailsPage(order: order),
                  ),
                );
              },
            ),
          );
        },
      )
    ;
  }
}