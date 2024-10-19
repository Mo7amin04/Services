import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services/Worker/cubit/cubit.dart';
import 'package:services/user/cubit/cubit.dart';
import 'package:services/user/cubit/status.dart';
import 'package:services/helper/constants.dart';

import 'ServiceProviders.dart';

class Services_Screen extends StatefulWidget {
  Services_Screen({super.key});

  @override
  State<Services_Screen> createState() => _Services_ScreenState();
}

class _Services_ScreenState extends State<Services_Screen> {
  @override
  Widget build(BuildContext context) {
    var cubit = UserCubit.get(context);
    return BlocProvider(

      create: (BuildContext context) =>UserCubit()..getServiceProviders(),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (BuildContext context, UserState state) {},
        builder: (BuildContext context, UserState state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: cubit.department.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    navigateTo(context, Service_Providers_Page());
                  },
                  child: Card(
                    color: Colors.blueGrey[50],
                    elevation: 6,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: state is GetAllDepartmentLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Image(
                                  image: NetworkImage(
                                      "${cubit.department[index].image}"),
                                  fit: BoxFit.fill,
                                  height: 100,
                                  //width: double.infinity,
                                ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "${cubit.department[index].name}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
