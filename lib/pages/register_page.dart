import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_textfeilds.dart';
import 'package:food_delivery/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailConroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void registerUser() async {
    final _authService = AuthService();

    if (passwordController.text == confirmPasswordController.text) {
      try {
        await _authService.signInWithEmailPassoword(
            emailConroller.text, passwordController.text);
      } catch (e) {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(e.toString()),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              }, child: const Text("OK"))
            ],
          );
        });
      }
    } else {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: const Text("Passwords do not match"),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: const Text("OK"))
          ],
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //logo
          Icon(Icons.lock_open_rounded,
              size: 100, color: Theme.of(context).colorScheme.inversePrimary),
          //MSg and slogan
          Text("Let's Get Started",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          //Textfields
          //Email
          MyTextfeilds(
              hintText: "Email",
              controller: emailConroller,
              obscureText: false),

          const SizedBox(height: 10),
          //Password
          MyTextfeilds(
              hintText: "Password",
              controller: passwordController,
              obscureText: true),
          const SizedBox(height: 10),
          //Confirm Password
          MyTextfeilds(
              hintText: "Confrom Password",
              controller: confirmPasswordController,
              obscureText: true),

          const SizedBox(height: 10),
          //Sign Up Button
          MyButton(text: "Sign Up", onPressed: () {
            registerUser();
          }),
          //Register Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Log In now",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
