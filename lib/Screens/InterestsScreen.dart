import 'package:flutter/material.dart';

class InterestsScreen extends StatelessWidget {
  final List<Interest> interests = [
    Interest(name: 'تكنولوجيا المعلومات', isSelected: true),
    Interest(name: 'التصوير والفيديو', isSelected: false),
    Interest(name: 'الهندسة و التصميم', isSelected: false),
    Interest(name: 'التعليم', isSelected: true),
    Interest(name: 'التسويق والمبيعات', isSelected: true),
    Interest(name: 'الإعلام والاتصالات', isSelected: false),
    Interest(name: 'الصحة والرعاية الصحية', isSelected: false),
    Interest(name: 'الفنون والثقافة', isSelected: false),
    Interest(name: 'الأعمال والإدارة', isSelected: false),
    Interest(name: 'الزراعة والبيئة', isSelected: false),
    Interest(name: 'الرياضة واللياقة البدنية', isSelected: true),
    Interest(name: 'التطوع والعمل الاجتماعي', isSelected: false),
    Interest(name: 'غير ذلك', isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  // Skip logic
                },
                child: Text(
                  'التخطي',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'ماهي اهتماماتك؟',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: interests.map((interest) {
                  return ChoiceChip(
                    label: Text(
                      interest.name,
                      style: TextStyle(
                        color: interest.isSelected ? Colors.white : Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    selected: interest.isSelected,
                    backgroundColor: Colors.grey.shade300,
                    selectedColor: Colors.blue,
                    onSelected: (selected) {
                      // Toggle interest selection logic
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Next button logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'التالي',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class Interest {
  final String name;
  bool isSelected;

  Interest({required this.name, this.isSelected = false});
}
