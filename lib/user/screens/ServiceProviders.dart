import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services/Screens/ServiceProvider.dart';
import 'package:services/Worker/cubit/cubit.dart';
import 'package:services/user/cubit/cubit.dart';
import 'package:services/user/cubit/status.dart';

import '../../helper/constants.dart';

class Service_Providers_Page extends StatefulWidget {
  Service_Providers_Page({super.key});



  @override
  State<Service_Providers_Page> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<Service_Providers_Page> {




  @override
  Widget build(BuildContext context) {

    return BlocConsumer<UserCubit,UserState>(
      builder: (BuildContext context, UserState state) {
        var cubit= UserCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("hell0"),
          ),
          body: ListView.builder(
            itemCount: cubit.serviceProviders.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  navigateTo(context,
                      Service_Provider(name: "${cubit.serviceProviders[index].firstname}"));
                },
                title: Text("${cubit.serviceProviders[index].firstname}"),
                leading: Icon(Icons.account_circle_outlined),
                trailing: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("4.5"),
                      Icon(
                        Icons.star_border,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }, listener: (BuildContext context, UserState state) {  },
    );
  }
}
