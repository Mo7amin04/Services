import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services/Worker/cubit/cubit.dart';
import 'package:services/Worker/cubit/status.dart';
import 'package:services/user/cubit/status.dart';
import 'package:services/helper/constants.dart';


class WorkerHome extends StatefulWidget {
  const WorkerHome({super.key});

  @override
  State<WorkerHome> createState() => _WorkerHomeState();
}

class _WorkerHomeState extends State<WorkerHome> {
  @override
  Widget build(BuildContext context) {
    var cubit = WorkerCubit.get(context);
    return BlocConsumer<WorkerCubit, WorkerState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                 print(isWorker);
                },
                icon: Icon(
                  Icons.mail,
                  color: Colors.yellow,
                ))
          ],
        ),
        body: cubit.Workerpages[cubit.currentIndex],
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
          currentIndex: cubit.currentIndex,
          onTap: (i) {
            cubit.bottomChanged(i);
          },
        ),
      ),
    );
  }
}
