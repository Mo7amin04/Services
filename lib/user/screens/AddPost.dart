import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:services/user/cubit/cubit.dart';
import 'package:services/user/cubit/status.dart';
import 'package:services/helper/constants.dart';


class AddPostScreen extends StatefulWidget {
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  var serviceType= TextEditingController();
  var serviceDetails= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      builder: (BuildContext context, UserState state) {
        var cubit = UserCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'إنشاء طلب خدمة',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[800]),
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'نوع الخدمة',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    value: serviceType.text.isNotEmpty ? serviceType.text : null,
                    items: cubit.serviceTypes.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      );
                    }).toList()
                      ..add(
                        DropdownMenuItem(
                          value: 'add_new',
                          child: Text('إضافة نوع خدمة جديد',
                              style: TextStyle(color: Colors.blueGrey)),
                        ),
                      ),
                    onChanged: (value) {
                      if (value == 'add_new') {
                        cubit.addNewServiceType(context: context, serviceType: serviceType.text);
                      } else {
                          serviceType.text = value ?? '';
                      }
                    },
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value == 'add_new') {
                        return 'يرجى اختيار نوع الخدمة';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: serviceDetails,
                    decoration: InputDecoration(
                      labelText: 'تفاصيل الخدمة',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    maxLines: 4,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال تفاصيل الخدمة';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  Text(
                    'صور إضافية',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey[800]),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: cubit.images.map((image) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.file(
                              image,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: IconButton(
                              icon: Icon(Icons.close, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  cubit.images.remove(image);
                                });
                              },
                            ),
                          ),
                        ],
                      );
                    }).toList()
                      ..add(
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: (){
                                cubit.pickImage();
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Icon(Icons.add_a_photo,
                                    color: Colors.grey[700]),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey[700],
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        cubit.submitForm(
                            context: context,
                            serviceType: serviceType.text,
                            serviceDetails: serviceDetails.text);
                      },
                      child:
                          Text('إرسال الطلب', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, UserState state) {},
    );
  }
}
