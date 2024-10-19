import 'package:flutter/material.dart';
// import 'package:services/Screens/ConfirmationCodePage.dart';
import 'package:services/helper/constants.dart';

class ContactDetailsPage extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 160,
            ),
            Text(
              'تفاصيل الإتصال',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
            ),
            SizedBox(height: 50),

            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'رقم الهاتف',
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'البريد الإلكتروني',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    side: BorderSide(color: Colors.black),
                  ),
                  child: const Text('التراجع'),
                ),
                ElevatedButton(
                  onPressed: () {
                //    navigateTo(context, ConfirmationCodePage());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('التالي'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
