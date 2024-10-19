// import 'package:flutter/material.dart';
//
// class PersonalInfoScreen extends StatefulWidget {
//   @override
//   State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
// }
//
// class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blue, Colors.white],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'معلومات الشخصية',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(height: 20),
//               CustomTextField(hintText: 'اسم الأول'),
//               CustomTextField(hintText: 'اسم الأخير'),
//               Row(
//                 children: [
//                   Expanded(child: CustomDropdown(hintText: 'الجنس')),
//                   SizedBox(width: 10),
//                   Expanded(child: CustomTextField(hintText: 'تاريخ الميلاد')),
//                 ],
//               ),
//               CustomDropdown(hintText: 'الجنسية'),
//               CustomTextField(hintText: 'المدينة'),
//               CustomDropdown(hintText: 'الحالة إجتماعية'),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueGrey,
//                       shape: CircleBorder(),
//                       padding: EdgeInsets.all(20),
//                     ),
//                     onPressed: () {},
//                     child: Text('التالي', style: TextStyle(color: Colors.white)),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       shape: CircleBorder(),
//                       padding: EdgeInsets.all(20),
//                     ),
//                     onPressed: () {},
//                     child: Text('التراجع', style: TextStyle(color: Colors.black)),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CustomTextField extends StatelessWidget {
//   final String hintText;
//
//   const CustomTextField({required this.hintText});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextField(
//         decoration: InputDecoration(
//           hintText: hintText,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           filled: true,
//           fillColor: Colors.white,
//         ),
//       ),
//     );
//   }
// }
//
// class CustomDropdown extends StatelessWidget {
//   final String hintText;
//
//   const CustomDropdown({required this.hintText});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: DropdownButtonFormField(
//         decoration: InputDecoration(
//           hintText: hintText,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           filled: true,
//           fillColor: Colors.white,
//         ),
//         items: [],
//         onChanged: (value) {},
//       ),
//     );
//   }
// }