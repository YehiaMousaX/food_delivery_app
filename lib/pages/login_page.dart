import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_textfeilds.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:food_delivery/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailConroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void login() async {
    final _authService = AuthService();
    try {
      await _authService.signInWithEmailPassoword(
          emailConroller.text, passwordController.text);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Error"),
              content: Text(e.toString()),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"))
              ],
            );
          });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //logo
          Icon(Icons.lock_open_rounded,
              size: 100, color: Theme.of(context).colorScheme.inversePrimary),
          //MSg and slogan
          Text("Food Delivery App",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          //Textfields
          MyTextfeilds(
              hintText: "Email",
              controller: emailConroller,
              obscureText: false),

          const SizedBox(height: 10),
          MyTextfeilds(
              hintText: "Password",
              controller: passwordController,
              obscureText: true),

          const SizedBox(height: 10),
          //Login Button
          MyButton(
              text: "Login",
              onPressed: () {
                login();
              }),
          //Register Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Register here",
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
