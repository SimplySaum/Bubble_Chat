import 'package:secondtry/pages/Login_page.dart';
import 'package:secondtry/pages/Register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  //default login page show
  bool ShowLoginPage = true;

  //toggle between login and Register
  void togglePages(){
    setState(() {
      ShowLoginPage = !ShowLoginPage;
    });
  }



  @override
  Widget build(BuildContext context) {
    if(ShowLoginPage){
      return LoginPage(
        onTap: togglePages,
      );
    }
    else{
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}
