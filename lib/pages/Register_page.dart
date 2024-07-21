import 'package:secondtry/services/auth/auth_service.dart';
import 'package:secondtry/components/my_button.dart';
import 'package:secondtry/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _ConfirmPwController = TextEditingController();
  void Function()? onTap;

  void register(BuildContext context) {
    //get auth service
    final auth = AuthService();

  //password matc - user create
    if (_pwController.text == _ConfirmPwController.text) {
      try {
        auth.signUpwithEmailandPassword(
            _emailController.text,
            _pwController.text
        );

      }
      catch(e){
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ));
      }
  }

    //password doesnt match - tell user to fix it
    else{
      showDialog(context: context, builder: (context) => const AlertDialog(
        title: Text("Passwords dont match!"),
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
            Icons.boy,
            size: 100,
            color: Colors.teal.shade300,
          ),

          const SizedBox(height: 50),

          //welcome back message
          Text(
            "Lets Create an account for you",
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

          const SizedBox(height: 10,),

          //Confirm pw textfield
          MyTextField(
            hintText: "Confirm Password",
            obscureText: true,
            controller: _ConfirmPwController,
          ),

          const SizedBox(height: 25),

          //login button
          MyButton(
            text: "Register",
            onTap: ()=> register(context),
            color: Colors.teal,

          ),

          const SizedBox(height: 25),

          //register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Login now",
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
