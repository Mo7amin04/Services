import 'package:flutter/material.dart';
import 'package:services/Screens/CompanyInfo.dart';
import 'package:services/Screens/ContactInfoScreen.dart';
import 'package:services/Screens/CreateProfile.dart';
import 'package:services/helper/constants.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "إلغاء",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "إنشاء حساب",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 40),
            _buildButton(
              context,
              label: "باحث عن عمل",
              onPressed: () {

                navigateTo(context, ContactInfoScreen());
              },
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              label: "جهة توظيف",
              onPressed: () {
                navigateTo(context, CompanyInfoForm());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, {required String label, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
