import 'package:flutter/material.dart';
import 'package:services/Screens/ContactDetailsPage.dart';
import 'package:services/helper/constants.dart';

class CompanyInfoForm extends StatefulWidget {
  @override
  _CompanyInfoFormState createState() => _CompanyInfoFormState();
}

class _CompanyInfoFormState extends State<CompanyInfoForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController officeAddressController = TextEditingController();
  TextEditingController companyDescriptionController = TextEditingController();
  String? companyType;
  String? sector;

  final List<String> companyTypes = ['خاص', 'حكومي', 'مشترك'];
  final List<String> sectors = ['تكنولوجيا', 'صناعة', 'تجارة', 'تعليم', 'صحة'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'معلومات الشركة',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
              SizedBox(height: 50),
              TextFormField(
                controller: companyNameController,
                decoration: InputDecoration(labelText: 'اسم الشركة'),
              ),
              SizedBox(height: 30),
              DropdownButtonFormField<String>(
                value: companyType,
                hint: Text('نوع الشركة'),
                items: companyTypes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    companyType = newValue;
                  });
                },
              ),
              SizedBox(height: 30),
              DropdownButtonFormField<String>(
                value: sector,
                hint: Text('القطاع'),
                items: sectors.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    sector = newValue;
                  });
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: officeAddressController,
                decoration: InputDecoration(labelText: 'عنوان المكتب'),
              ),
              SizedBox(height: 70),
              TextFormField(
                controller: companyDescriptionController,
                decoration: InputDecoration(
                  labelText: 'وصف الشركة',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                maxLines:
                    6, // Adjust the number of lines as needed for a larger text box
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
                      side: BorderSide(color: Colors.grey),
                    ),
                    child: const Text(
                      'التراجع',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        navigateTo(context, ContactDetailsPage());

                      }
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
      ),
    );
  }
}
