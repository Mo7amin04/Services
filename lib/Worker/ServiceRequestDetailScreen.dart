import 'package:flutter/material.dart';

class ServiceRequestDetailScreen extends StatelessWidget {
  final String serviceType;
  final String serviceDetails;
  final List<dynamic> imageUrls;

  ServiceRequestDetailScreen({
    required this.serviceType,
    required this.serviceDetails,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceType),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'تفاصيل الخدمة:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(serviceDetails, style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              Text(
                'صور الخدمة:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              imageUrls.isNotEmpty
                  ? Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: imageUrls.map((url) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            url,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        );
                      }).toList(),
                    )
                  : Text('لا توجد صور مرفقة'),
            ],
          ),
        ),
      ),
    );
  }
}
