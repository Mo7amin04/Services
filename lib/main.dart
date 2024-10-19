import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services/Worker/Worker_Home.dart';
import 'package:services/Worker/cubit/cubit.dart';
import 'package:services/login/cubit/cubit.dart';
import 'package:services/login/loginPage.dart';
import 'package:services/login/FirstPage.dart';
import 'package:services/user/cubit/cubit.dart';
import 'package:services/user/screens/HomeLayout.dart';
import 'package:services/helper/blocobserver.dart';
import 'package:services/helper/constants.dart';
import 'package:services/network/shared_preferences.dart';
import 'package:services/onBording/onBording.dart';


void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();

  Widget widget;

  uId = CacheHelper.getData(key: "uId");
  isWorker = CacheHelper.getData(key: "isWorker");
 onBording=CacheHelper.getData(key: "onBording");

 if(CacheHelper.getData(key: "onBording") !=null){
    if (uId != null) {
      if(isWorker != null){
        widget = WorkerHome();

      }else{
        widget = Homelayout();


      }
    } else {
      widget = FirstPage();
    }
  }else{
   widget = OnBording();
 }

  runApp(MyApp(
    sWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({required this.sWidget});

  final Widget sWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => WorkerCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => UserCubit()..getServiceProviders(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: sWidget,
      ),
    );
  }
}
