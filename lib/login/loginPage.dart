import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services/helper/constants.dart';

import '../user/screens/HomeLayout.dart';
import 'cubit/cubit.dart';
import 'cubit/status.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool isPassword = true;
  FocusNode passwordFocusNode = FocusNode();

  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (BuildContext context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: Container(),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "إلغاء",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Text(
                "أدخل البريد الإلكتروني و كلمة المرور",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
               SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(passwordFocusNode);
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text("Email"),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'email غير صحيح';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      obscureText: isPassword,
                      focusNode: passwordFocusNode,
                      controller: passwordController,
                      decoration: InputDecoration(
                        label: Text("Password"),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                          icon: Icon(isPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password should be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.only(left: 80.0, right: 80, bottom: 50),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextButton(
                        onPressed: () {
                          cubit.userLogin(
                              password: passwordController.text,
                              email: emailController.text);

                        },
                        child: Center(
                          child:state is UserLoginLoading? CircularProgressIndicator():Text(
                        "تسجيل الدخول ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        cubit.userSignUp(name: "name", pass: "123456", phone: "phone", email: "g@gmail.com", context: context);
                      },
                      child: const Text(
                        "نسيت كلمة المرور ؟",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
      listener: (BuildContext context, state) {
        if(state is UserLoginSuccess){
          navigateAndFinish(context, Homelayout());

        }
      },
    );
  }
}
