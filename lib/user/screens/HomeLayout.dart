import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services/user/cubit/cubit.dart';
import 'package:services/user/cubit/status.dart';
import 'package:services/helper/constants.dart';
import 'package:services/network/shared_preferences.dart';
import 'package:services/user/screens/AddPost.dart';
import 'package:services/user/screens/OrdersPage.dart';
import 'package:services/user/screens/Settings.dart';

import 'Services_Screen.dart';

class Homelayout extends StatefulWidget {
  const Homelayout({super.key});

  @override
  State<Homelayout> createState() => _HomelayoutState();
}

class _HomelayoutState extends State<Homelayout> {

  int currentIndex = 0;
  List<Widget> pages = <Widget>[
    Services_Screen(),
    AddPostScreen(),
    OrdersPage(),
    Settings_Screen(),
  ];
  @override
  Widget build(BuildContext context) {
    var cubit = UserCubit.get(context);
    return BlocProvider(
      create: (BuildContext context) => UserCubit()..getAllDepartment(),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text("${uId}"),
            actions: [
              IconButton(
                  onPressed: () {
                 //   CacheHelper.saveData(key: "isWorker", value: "true");

                  },
                  icon: Icon(
                    Icons.mail,
                    color: Colors.yellow,
                  ))
            ],
          ),
          body: pages[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.green[300],
            selectedItemColor: Colors.green[600],
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_repair_service),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box),
                label: "Ad",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.request_page),
                label: "Requests",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
              ),
            ],
            currentIndex:currentIndex,
            onTap: (i) {
              setState(() {
                currentIndex=i;

              });
              //cubit.bottomChanged(i);
            },
          ),
        ),
      ),
    );
  }
}
