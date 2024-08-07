import 'package:secondtry/services/auth/auth_service.dart';
import 'package:secondtry/components/my_button.dart';
import 'package:secondtry/components/my_textfield.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {

  LoginPage({super.key, required this.onTap});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final void Function()? onTap;


  //login method
  void login(BuildContext context)async{

    //auth service
  final authService = AuthService();

    //try logging in
    try{
      await authService.signInWithEmailAndPassword(_emailController.text, _pwController.text);
    
    }
    catch(e){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ));
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          //logo
          Icon(
            Icons.message,
            size: 100,
            color: Colors.blueAccent.shade400,
          ),

          const SizedBox(height: 50),

          //welcome back message
          Text(
            "Welcome back, you've been missed",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16
            ),
          ),

          const SizedBox(height: 25),


          //email textfield
          MyTextField(
            hintText: "Email",
            obscureText: false,
            controller: _emailController,
          ),

          const SizedBox(height: 10,),

          //pw textfield
          MyTextField(
            hintText: "Password",
            obscureText: true,
            controller: _pwController,
          ),

          const SizedBox(height: 25),

          //login button
          MyButton(
            text: "Login",
            onTap: ()=> login(context),
            color: Colors.blueAccent.shade700,

          ),

          const SizedBox(height: 25),

          //register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not a member? ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Register now",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
