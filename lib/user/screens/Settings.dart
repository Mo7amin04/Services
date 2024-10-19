import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services/login/FirstPage.dart';
import 'package:services/login/cubit/cubit.dart';
import 'package:services/login/cubit/status.dart';
import 'package:services/user/cubit/cubit.dart';
import 'package:services/user/screens/HomeLayout.dart';
import 'package:services/user/cubit/status.dart';
import 'package:services/helper/constants.dart';

class Settings_Screen extends StatelessWidget {
  const Settings_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = UserCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (BuildContext context, LoginState state) {
        return Column(
          //mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                // onTap: () {
                //   setState(() {
                //     isDarkMode = !isDarkMode;
                //   });
                // },
                title: Text("Language"),
                trailing: Icon(Icons.language),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  LoginCubit.get(context).userSignOut();

              //navigateAndFinish(context, Login_Page());
                },
                title: Text("Sign Out"),
                trailing: Icon(Icons.logout),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {




                },
                title: Text("Edit Profile"),
                trailing: Icon(Icons.manage_accounts_sharp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {


                },
                title: Text("History Service"),
                trailing: Icon(Icons.history),
              ),
            ),
          ],
        );
      },
      listener: (BuildContext context, LoginState state) {
        if (state is AppSignOutSuccessStates) {
          navigateAndFinish(context, FirstPage());
        }
      },
    );
  }
}
