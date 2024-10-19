import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:services/Worker/PostsScreen.dart';
import 'package:services/Worker/Settings.dart';
import 'package:services/login/cubit/status.dart';
import 'package:services/user/screens/AddPost.dart';
import 'package:services/user/screens/Services_Screen.dart';
import 'package:services/user/screens/Settings.dart';
import 'package:services/models/ProviderModel.dart';
import 'package:services/helper/constants.dart';
import 'package:services/models/departmentModel.dart';
import 'package:services/models/User.dart';
import 'package:services/user/screens/OrdersPage.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../network/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(initialState());

  static LoginCubit get(context) => BlocProvider.of(context);


  Future<void> userLogin(
      {@required String? password,
      BuildContext? context,
      @required String? email}) async {
    emit(UserLoginLoading());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      print("QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ");
      CacheHelper.saveData(key: 'uId', value: value.user!.uid);
      uId = CacheHelper.getData(key: 'uId');
      //getUserData();
      emit(UserLoginSuccess(token: value.user!.uid));
    }).catchError((error) {
      print(error.toString());
      emit(UserLoginError(message: error.toString()));
      String errorMessage = getFirebaseAuthErrorMessage(error);
      ScaffoldMessenger.of(context!)
          .showSnackBar(SnackBar(content: Text(errorMessage)));
      //emit(UserRegisterError(message: error));
      print(error.toString());
    });
  }

  Future<void> userSignOut() async {
    FirebaseAuth.instance.signOut().then((value) {
      CacheHelper.clearData(key: 'uId');
      uId = '';
      emit(AppSignOutSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(AppSignOutErrorStates(message: error.toString()));
    });
  }
  Future<void> workerSignOut() async {
    FirebaseAuth.instance.signOut().then((value) {
      CacheHelper.clearData(key: 'isWorker');
      isWorker = '';
      emit(AppSignOutSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(AppSignOutErrorStates(message: error.toString()));
    });
  }

  void userSignUp({
    @required String? name,
    @required String? pass,
    @required String? phone,
    @required String? email,
    @required BuildContext? context,
  }) {
    emit(UserRegisterLoading());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: pass!)
        .then((value) {
      print(value.user!.uid);
      CacheHelper.saveData(key: 'uId', value: value.user!.uid);
      uId = CacheHelper.getData(key: 'uId');
      CacheHelper.saveData(key: 'isWorker', value: "true");
      isWorker = CacheHelper.getData(key: 'isWorker');
      createUser(
          name: name!,
          phone: phone!,
          email: email,
          uId: value.user!.uid,
          context: context!);
      emit(UserRegisterSuccess());
    }).catchError((error) {
      String errorMessage = getFirebaseAuthErrorMessage(error);
      ScaffoldMessenger.of(context!)
          .showSnackBar(SnackBar(content: Text(errorMessage)));
      emit(UserRegisterError(message: error));
      print(error.toString());
    });
  }

  void createUser({
    required String name,
    required String phone,
    required String email,
    required String uId,
    required BuildContext context,
  }) {
    // emit(CreateUserLoading());

    UserModel userModel = UserModel(
        name: name,
        phone: phone,
        uId: uId,
        email: email,
    );
    FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
      CacheHelper.saveData(key: "uId", value: uId);
      uId = CacheHelper.getData(key: 'uId')!;

      //navigateAndFinish(context, Homelayout());

      emit(CreateUserSuccess());
    }).catchError((error) {
      emit(CreateUserError(message: error.toString()));
      print(error.toString());
    });
  }

  void workerSignUp({
    required String firstName,
    required String email,
    required String pass,
    required String lastName,
    required String phone,
    required String BOD,
    required String city,
    required String sex,
    required String skill,
    required String rate,
    required String nationality,
    @required BuildContext? context,
  }) {
    emit(WorkerRegisterLoading());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((value) {
      print(value.user!.uid);
      CacheHelper.saveData(key: 'uId', value: value.user!.uid);
      uId = CacheHelper.getData(key: 'uId')!;
      createWorker(
          BOD: BOD,
          firstName: firstName,
          phone: phone,
          lastName: lastName,
          city: city,
         // maritalStatus: maritalStatus,
          nationality: nationality,
          rate: rate,
          sex: sex,
          skill: skill,
          uId: value.user!.uid,
          context: context!);
      emit(WorkerRegisterSuccess());
    }).catchError((error) {
      String errorMessage = getFirebaseAuthErrorMessage(error);
      ScaffoldMessenger.of(context!)
          .showSnackBar(SnackBar(content: Text(errorMessage)));
      emit(WorkerRegisterError(message: error));
      print(error.toString());
    });
  }

  void createWorker({
    required String firstName,
    required String lastName,
    required String phone,
    required String BOD,
    required String city,
    required String sex,
    required String skill,
    required String rate,
    required String nationality,
  //  required String maritalStatus,
    required String uId,
    required BuildContext context,
  }) {
    // emit(CreateUserLoading());

    ProviderModel providerModel = ProviderModel(
      firstname: firstName,
      uId: uId,
      phone: phone,
      BOD: BOD,
      city: city,
      lastname: lastName,
      // maritalStatus: maritalStatus,
      nationality: nationality,
      rate: rate,
      sex: sex,
      skill: skill,
    );
    FirebaseFirestore.instance
        .collection("Worker")
        .doc(uId)
        .set(providerModel.toMap())
        .then((value) {
      CacheHelper.saveData(key: "uId", value: uId);
      CacheHelper.saveData(key: "isWorker", value: "true");
      uId = CacheHelper.getData(key: 'uId')!;
      isWorker = CacheHelper.getData(key: 'isWorker')!;

      emit(CreateWorkerSuccess());
    }).catchError((error) {
      emit(CreateWorkerError(message: error.toString()));
      print(error.toString());
    });
  }

  String getFirebaseAuthErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'invalid-email':
          return 'The email address is not valid.';
        case 'email-already-in-use':
          return 'The email address is already in use by another account.';
        case 'weak-password':
          return 'The password is too weak. It must be at least 6 characters long.';
        case 'operation-not-allowed':
          return 'Email/password accounts are not enabled. Please contact support.';
        case 'network-request-failed':
          return 'Network error. Please check your internet connection and try again.';
        case 'user-disabled':
          return 'This user account has been disabled. Please contact support.';
        default:
          return 'An unknown error occurred. Please try again later.';
      }
    }
    return 'An error occurred. Please try again.';
  }

//  TextEditingController messageController = TextEditingController();

// void sendMessage(UserDataModel userDataModel) {
//   FirebaseFirestore.instance
//       .collection('users')
//       .doc(user!.uId)
//       .collection('chats')
//       .get()
//       .then((value) {
//     MessageDataModel model = MessageDataModel(
//       time: DateTime.now().toString(),
//       message: messageController.text,
//       receiverId: userDataModel.uId,
//       senderId: user!.uId,
//     );
//
//     if (value.docs
//         .any((element) => element.reference.id != userDataModel.uId)) {
//       ChatDataModel chatDataModel = ChatDataModel(
//         username: userDataModel.username,
//         userId: userDataModel.uId,
//         userImage: userDataModel.image,
//       );
//
//       FirebaseFirestore.instance
//           .collection('users')
//           .doc(user!.uId)
//           .collection('chats')
//           .doc(userDataModel.uId)
//           .set(chatDataModel.toJson())
//           .then((value) {})
//           .catchError((error) {
//         debugPrint(error.toString());
//
//         emit(CreateChatError(
//           message: error.toString(),
//         ));
//       });
//
//       FirebaseFirestore.instance
//           .collection('users')
//           .doc(userDataModel.uId)
//           .collection('chats')
//           .doc(user!.uId)
//           .set(chatDataModel.toJson())
//           .then((value) {})
//           .catchError((error) {
//         debugPrint(error.toString());
//
//         emit(CreateChatError(
//           message: error.toString(),
//         ));
//       });
//     } else {
//       FirebaseFirestore.instance
//           .collection('users')
//           .doc(user!.uId)
//           .collection('chats')
//           .doc(userDataModel.uId)
//           .collection('messages')
//           .add(model.toJson())
//           .then((value) {
//         messageController.clear();
//       }).catchError((error) {
//         debugPrint(error.toString());
//
//         emit(CreateChatError(
//           message: error.toString(),
//         ));
//       });
//
//       FirebaseFirestore.instance
//           .collection('users')
//           .doc(userDataModel.uId)
//           .collection('chats')
//           .doc(user!.uId)
//           .collection('messages')
//           .add(model.toJson())
//           .then((value) {
//         messageController.clear();
//       }).catchError((error) {
//         debugPrint(error.toString());
//
//         emit(CreateChatError(
//           message: error.toString(),
//         ));
//       });
//     }
//   }).catchError((error) {
//     debugPrint(error.toString());
//
//     emit(SendMessage(
//       message: error.toString(),
//     ));
//   });
// }
//
// List<MessageDataModel> messagesList = [];
//
// void getMessages(UserDataModel userDataModel) {
//   FirebaseFirestore.instance
//       .collection('users')
//       .doc(user!.uId)
//       .collection('chats')
//       .doc(userDataModel.uId)
//       .collection('messages').orderBy('time', descending: true,)
//       .snapshots()
//       .listen((value) {
//     messagesList = [];
//
//     for (var element in value.docs) {
//       messagesList.add(MessageDataModel.fromJson(element.data()));
//     }
//
//     debugPrint(messagesList.length.toString());
//
//     emit(GetMessagesSuccess());
//   });
// }
}
