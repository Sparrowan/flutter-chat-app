import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/my_button.dart';
import 'package:flutter_chat_app/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  // controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void register() {
    print("register");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.person_add,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 25),

              // title
              Text(
                "Create your account",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 50),

              // email
              MyTextfield(
                hintText: "Email",
                obscureText: false,
                controller: _emailController,
              ),
              const SizedBox(height: 10),

              // password
              MyTextfield(
                hintText: "Password",
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 10),

              // confirm password
              MyTextfield(
                hintText: "Confirm Password",
                obscureText: true,
                controller: _confirmPasswordController,
              ),
              const SizedBox(height: 25),

              // register button
              MyButton(text: "Register", onTap: register),

              const SizedBox(height: 25),

              // login redirect
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
