import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:services/user/cubit/status.dart';
import 'package:services/helper/constants.dart';
import 'package:services/user/screens/HomeLayout.dart';

class PersonalInfoForm extends StatefulWidget {
  PersonalInfoForm({
    super.key,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  _PersonalInfoFormState createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  final _formKey = GlobalKey<FormState>();

  String? selectedGender;
  Map<String, String>? selectedNationality;
  String? selectedCity;
  String? selectedSocialStatus;
  DateTime? selectedDate;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  // Nationalities with flags
  final List<Map<String, String>> nationalities = [
    {'name': 'ليبي', 'flag': '🇱🇾'},
    {'name': 'مصري', 'flag': '🇪🇬'},
    {'name': 'سوري', 'flag': '🇸🇾'},
    {'name': 'عراقي', 'flag': '🇮🇶'},
    {'name': 'سوداني', 'flag': '🇸🇩'},
    {'name': 'تونسي', 'flag': '🇹🇳'},
  ];

  final List<String> genderOptions = ['ذكر', 'أنثى'];
  final List<String> cityOptions = ['مصراته', 'طرابلس', 'بنغازي'];
  final List<String> socialStatusOptions = [
    'مطور برمجيات',
    'خدمات طبية',
    'خدمات منزلية'
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();

    //   BlocConsumer<AppCubit, AppState>(
    //   builder: (BuildContext context, AppState state) {
    //     return Scaffold(
    //       backgroundColor: Colors.blue[50],
    //       body: Padding(
    //         padding: const EdgeInsets.all(16.0),
    //         child: Form(
    //           key: _formKey,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Spacer(),
    //               const Center(
    //                 child: Text(
    //                   "المعلومات الشخصية",
    //                   style:
    //                       TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    //                 ),
    //               ),
    //               const SizedBox(height: 30),
    //               _buildTextFormField(firstNameController, "اسم الأول",
    //                   "يرجى إدخال الاسم الأول"),
    //               const SizedBox(height: 15),
    //               _buildTextFormField(lastNameController, "اسم الأخير",
    //                   "يرجى إدخال الاسم الأخير"),
    //               const SizedBox(height: 15),
    //               _buildNumericTextFormField(
    //                   phoneController, "رقم الهاتف", "يرجى إدخال رقم الهاتف"),
    //               const SizedBox(height: 15),
    //               _buildGenderAndDateRow(context),
    //               const SizedBox(height: 15),
    //               _buildNationalityDropdown(),
    //               const SizedBox(height: 15),
    //               _buildDropdown(
    //                   "المدينة التي تقيم بها", cityOptions, selectedCity,
    //                   (value) {
    //                 setState(() {
    //                   selectedCity = value;
    //                 });
    //               }),
    //               const SizedBox(height: 15),
    //               _buildDropdown("الوظيفة أو الخدمة", socialStatusOptions,
    //                   selectedSocialStatus, (value) {
    //                 setState(() {
    //                   selectedSocialStatus = value;
    //                 });
    //               }),
    //               Spacer(),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   ElevatedButton(
    //                     onPressed: () {
    //                       Navigator.pop(context);
    //                     },
    //                     style: ElevatedButton.styleFrom(
    //                       foregroundColor: Colors.black,
    //                       backgroundColor: Colors.white,
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(30),
    //                       ),
    //                       side: BorderSide(color: Colors.grey),
    //                     ),
    //                     child: const Text(
    //                       'التراجع',
    //                       style: TextStyle(color: Colors.blue),
    //                     ),
    //                   ),
    //                   ElevatedButton(
    //                     onPressed: () {
    //                       AppCubit.get(context).workerSignUp(
    //                           firstName: firstNameController.text,
    //                           email: widget.email,
    //                           pass:  widget.password,
    //                           lastName: lastNameController.text,
    //                           phone: phoneController.text,
    //                           BOD: selectedDate.toString(),
    //                           city: selectedCity.toString(),
    //                           sex: selectedGender.toString(),
    //                           skill: selectedSocialStatus.toString(),
    //                           rate: 0.toString(),
    //                           nationality: selectedNationality.toString(),
    //                           context: context);
    //                     },
    //                     style: ElevatedButton.styleFrom(
    //                       backgroundColor: Colors.blue,
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(30),
    //                       ),
    //                     ),
    //                     child: const Text('التالي'),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    //   listener: (BuildContext context, AppState state) {
    //     if (state is CreateWorkerSuccess) {
    //       navigateAndFinish(context, Homelayout());
    //     }
    //   },
    // );
  }

  // Helper function to create text form fields
  Widget _buildTextFormField(
      TextEditingController controller, String label, String errorMessage) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMessage;
        }
        return null;
      },
    );
  }

  Widget _buildNumericTextFormField(
      TextEditingController controller, String label, String errorMessage) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 10,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
        counterText: '', // لإخفاء عداد الخانات
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMessage;
        } else if (value.length != 10) {
          return 'يجب أن يتكون رقم الهاتف من 10 أرقام';
        }
        return null;
      },
    );
  }

  // Helper function to create text fields
  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildNumericTextField(
      TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 10,
      // تحديد الحد الأقصى لعدد الخانات
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // يسمح بإدخال الأرقام فقط
      ],
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
        counterText: '', // لإخفاء عداد الخانات
      ),
    );
  }

  // Helper function for gender and date of birth row
  Widget _buildGenderAndDateRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child:
              _buildDropdown("الجنس", genderOptions, selectedGender, (value) {
            setState(() {
              selectedGender = value;
            });
          }),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black54),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedDate == null
                        ? "تاريخ الميلاد"
                        : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                  ),
                  const Icon(Icons.calendar_today),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Helper function to create nationality dropdown
  Widget _buildNationalityDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black54),
        color: Colors.white,
      ),
      child: DropdownButton<Map<String, String>>(
        isExpanded: true,
        value: selectedNationality,
        hint: const Text("الجنسية"),
        icon: const Icon(Icons.arrow_drop_down),
        underline: SizedBox.shrink(),
        onChanged: (Map<String, String>? newValue) {
          setState(() {
            selectedNationality = newValue;
          });
        },
        items: nationalities.map<DropdownMenuItem<Map<String, String>>>(
            (Map<String, String> nationality) {
          return DropdownMenuItem<Map<String, String>>(
            value: nationality,
            child: Row(
              children: [
                Text(nationality['flag'] ?? ''),
                const SizedBox(width: 8),
                Text(nationality['name'] ?? ''),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // Helper function to create other dropdown fields
  Widget _buildDropdown(String label, List<String> items, String? selectedItem,
      Function(String?) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black54),
        color: Colors.white,
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedItem,
        hint: Text(label),
        icon: const Icon(Icons.arrow_drop_down),
        underline: SizedBox.shrink(),
        onChanged: onChanged,
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

}
