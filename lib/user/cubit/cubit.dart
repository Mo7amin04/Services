import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:services/Worker/PostsScreen.dart';
import 'package:services/Worker/Settings.dart';
import 'package:services/network/shared_preferences.dart';
import 'package:services/user/screens/AddPost.dart';
import 'package:services/user/screens/Services_Screen.dart';
import 'package:services/user/screens/Settings.dart';
import 'package:services/user/cubit/status.dart';
import 'package:services/models/ProviderModel.dart';
import 'package:services/helper/constants.dart';
import 'package:services/models/departmentModel.dart';
import 'package:services/models/User.dart';
import 'package:services/user/screens/OrdersPage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(Empty());

  static UserCubit get(context) => BlocProvider.of(context);



  List<String> serviceTypes = [
    'خدمة تنظيف',
    'خدمة إصلاح',
    'خدمة توصيل'
  ]; // قائمة مبدئية بأنواع الخدمات

  void addNewServiceType({
    required BuildContext context,
    required String serviceType,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        String newServiceType = '';
        return AlertDialog(
          title: Text('إضافة نوع خدمة جديد'),
          content: TextField(
            decoration: InputDecoration(labelText: 'نوع الخدمة'),
            onChanged: (value) {
              newServiceType = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                if (newServiceType.isNotEmpty) {
                  serviceTypes.add(newServiceType);
                  serviceType = newServiceType;
                  emit(AddNewTypeSuccess());
                } else {
                  emit(AddNewTypeError(message: "message"));
                }
                Navigator.of(context).pop();
              },
              child: Text('إضافة'),
            ),
          ],
        );
      },
    );
  }

  final formKey = GlobalKey<FormState>();
  List<File> images = [];

  final ImagePicker _picker = ImagePicker();

  // دالة لاختيار صورة من المعرض
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      images.add(File(pickedFile.path));
      emit(GetImageSuccess());
    } else {
      emit(GetImageError(message: "message"));
    }
  }


  Future<void> submitForm({
    required BuildContext context,
    required String serviceType,
    required String serviceDetails,
  }) async {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();

      // إظهار تحميل
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
      );

      try {
        // تحميل الصور إلى Firebase Storage
        List<String> imageUrls = [];
        for (File image in images) {
          String imageUrl = await uploadImage(image, uId!);
          imageUrls.add(imageUrl);
        }

        // إضافة البيانات إلى Firestore
        await FirebaseFirestore.instance.collection('service_requests').add({
          'uId': uId,
          'serviceType': serviceType,
          'serviceDetails': serviceDetails,
          'imageUrls': imageUrls,
          'createdAt': FieldValue.serverTimestamp(),
        });

        Navigator.of(context).pop(); // إخفاء تحميل

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تم إرسال طلب الخدمة بنجاح!')),
        );

        // إعادة تعيين الحقول
        images.clear();
        emit(SavePostSuccess());
      } catch (e) {
        Navigator.of(context).pop(); // إخفاء تحميل
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('حدث خطأ أثناء إرسال الطلب: $e')),
        );
        emit(SavePostError(message: 'حدث خطأ أثناء إرسال الطلب: $e'));
      }
    }
  }

  Future<String> uploadImage(File image, String uId) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('service_images')
        .child(fileName)
        .child(uId);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }

  DepartmentModel departmentModel = DepartmentModel();
  List<DepartmentModel> department = [];

  void getAllDepartment() {
    emit(GetAllDepartmentLoading());

    FirebaseFirestore.instance.collection('department').get().then((value) {
      value.docs.forEach((i) {
        department.add(DepartmentModel.fromJson(i.data()));
        print(i.data());
      });
      //print(value.docs);
      emit(GetAllDepartmentSuccess());
    }).catchError((error) {
      debugPrint(error.toString());

      emit(GetAllDepartmentError(
        message: error.toString(),
      ));
    });
  }

  var picker = ImagePicker();
  File? image;

  Future<void> getImagePick() async {
    var pickImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      image = File(pickImage.path);
      emit(getImageSuccessStates());
    } else {
      //print("sorry         sorry     sorry");
      emit(getImageErrorStates(message: "eroooooooore"));
    }
  }

  List<ProviderModel> serviceProviders = [];



  void getServiceProviders() async {
    emit(GetServiceProvidersLoading());
    await FirebaseFirestore.instance
        .collection('Worker').get().then((value){
      value.docs.forEach((i) {
        serviceProviders.add(ProviderModel.fromJson(i.data()));
        print(i.data());
      });
      //print(value.docs);
      emit(GetServiceProvidersSuccess());
    }).catchError((error) {
      debugPrint(error.toString());

      emit(GetServiceProvidersError(
        message: error.toString(),
      ));
    });

  }



}
