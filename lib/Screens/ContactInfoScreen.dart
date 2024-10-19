import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services/Screens/CreateProfile.dart';


class ContactInfoScreen extends StatefulWidget {
  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  bool isPassword = true;

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container();
    //   BlocConsumer<AppCubit, AppState>(
    //   builder: (BuildContext context, AppState state) {
    //     return Scaffold(
    //       body: Padding(
    //         padding: const EdgeInsets.all(16.0),
    //         child: Form(
    //           key: formKey,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Spacer(),
    //               Text(
    //                 ' البريد الإلكتروني',
    //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
    //                 textAlign: TextAlign.center,
    //               ),
    //               SizedBox(height: 50),
    //               // Email TextField
    //               TextFormField(
    //                 controller: emailController,
    //                 decoration: InputDecoration(
    //                   labelText: 'البريد الإلكتروني',
    //                   border: OutlineInputBorder(),
    //                 ),
    //                 keyboardType: TextInputType.emailAddress,
    //                 validator: (value) {
    //                   if (value == null || value.isEmpty) {
    //                     return 'الرجاء إدخال البريد الإلكتروني';
    //                   }
    //                   return null;
    //                 },
    //               ),
    //               SizedBox(height: 20),
    //               // Password TextField
    //               TextFormField(
    //                 controller: passwordController,
    //                 decoration: InputDecoration(
    //                   suffixIcon: IconButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         isPassword = !isPassword;
    //                       });
    //                     },
    //                     icon: Icon(isPassword
    //                         ? Icons.visibility
    //                         : Icons.visibility_off),
    //                   ),
    //                   labelText: 'كلمة المرور',
    //                   border: OutlineInputBorder(),
    //                 ),
    //                 obscureText: isPassword,
    //                 validator: (value) {
    //                   if (value == null || value.isEmpty) {
    //                     return 'الرجاء إدخال كلمة المرور';
    //                   } else if (value.length < 6) {
    //                     return 'يجب أن تكون كلمة المرور 6 خانات على الأقل';
    //                   }
    //                   return null;
    //                 },
    //               ),
    //
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
    //                       if (formKey.currentState!.validate()) {
    //                         navigateTo(
    //                             context,
    //                             PersonalInfoForm(
    //                                 email: emailController.text,
    //                                 password: passwordController.text));
    //                         // Handle form submission or navigation
    //                       }
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
    //   listener: (BuildContext context, AppState state) {},
    // );
  }
}
