import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'ServiceRequestDetailScreen.dart';

class ServiceRequestsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection('service_requests').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('حدث خطأ في جلب البيانات'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('لا يوجد طلبات خدمة حتى الآن'));
        }

        final serviceRequests = snapshot.data!.docs;

        return ListView.builder(
          itemCount: serviceRequests.length,
          itemBuilder: (context, index) {
            var request = serviceRequests[index];
            String serviceType = request['serviceType'] ?? 'غير محدد';
            String serviceDetails =
                request['serviceDetails'] ?? 'لا توجد تفاصيل';
            List<dynamic> imageUrls = request['imageUrls'] ?? [];

            return Card(
              margin: EdgeInsets.all(8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: ListTile(
                title: Text(serviceType,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                  serviceDetails,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                leading: imageUrls.isNotEmpty
                    ? Image.network(
                        imageUrls[0],
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 60,
                        height: 60,
                        color: Colors.grey[300],
                        child: Icon(Icons.image, color: Colors.grey[700]),
                      ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ServiceRequestDetailScreen(
                        serviceType: serviceType,
                        serviceDetails: serviceDetails,
                        imageUrls: imageUrls,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
