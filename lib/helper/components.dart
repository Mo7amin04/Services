import 'package:flutter/material.dart';
//
// Widget defaultButton({
//   double wid = double.infinity,
//   double r = 10.0,
//   required String text,
//   bool isUpper = true,
//   Color back = Colors.blue,
//   @required Function function,
// }) =>
//     Container(
//       width: wid,
//       decoration: BoxDecoration(
//         color: back,
//         borderRadius: BorderRadius.circular(
//           r,
//         ),
//       ),
//       child: TextButton(
//         onPressed: function,
//         child: Text(
//           isUpper ? text.toUpperCase() : text,
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//

Widget buildTextFormField({
  required String label,
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String? Function(String?) validator,
}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      border: Border.all(color: Colors.grey),
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          label: Text(label),
          border: InputBorder.none,
        ),
        validator: validator,
      ),
    ),
  );
}


Widget defaultFormField({
  @required controller,
  hint = '',
  @required type,
  //required Function onType,
  isPassword = false,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
    //    onChanged: onType,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
//

Widget defultFormField({
  required TextEditingController controller,
  required TextInputType keybaordtype,
  required String labeltext,
  required IconData prefixIcon,
  required String textWarn,
  Function? sufixpressed,
  IconData? suffixIcon,
  double radios = 10,
  bool passShow = false,
}) =>
    TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return textWarn;
        }

        return null;
      },
      obscureText: passShow,
      controller: controller,
      keyboardType: keybaordtype,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radios),
          ),
          labelText: labeltext,
          prefix: Icon(prefixIcon),
          suffixIcon: IconButton(
            onPressed: () {
              sufixpressed!();
            },
            icon: Icon(suffixIcon),
          )),
    );

// void navigateTo(context, widget) =>
//     Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => widget,
//   ),
// );
//
//
// Widget buildSeparator() => Container(
//   height: 1.0,
//   width: double.infinity,
//   color: Colors.grey[300],
// );