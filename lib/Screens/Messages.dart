import 'package:flutter/material.dart';
import 'package:services/Screens/Chattingscreen.dart';
import 'package:services/helper/constants.dart';

class Messages_Page extends StatefulWidget {
  const Messages_Page({super.key});

  @override
  State<Messages_Page> createState() => _Messages_PageState();
}

class _Messages_PageState extends State<Messages_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
          itemBuilder: (c, i) {
            return ListTile(
              onTap: (){
                navigateTo(context, Chatting_Page());
              },
              leading: Icon(Icons.account_circle_outlined),
              title: Text("Names"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            );

          },
          separatorBuilder: (c, i) {
            return MyDivider();
          },
          itemCount: 10),
    );
  }
}
